import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_terget_app/core/constants/constant_text.dart';
import 'package:my_terget_app/core/style/style_color.dart';
import 'package:my_terget_app/core/style/style_text.dart';
import 'package:my_terget_app/features/product/data/models/product_model.dart';
import 'package:my_terget_app/features/product/presentation/blocs/product/product_bloc.dart';

class AddTargetPage extends StatefulWidget {
  const AddTargetPage({super.key});

  @override
  State<AddTargetPage> createState() => _AddTargetPageState();
}

class _AddTargetPageState extends State<AddTargetPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;

  String _formatDate(DateTime date) {
    final String day = date.day.toString().padLeft(2, '0');
    final String month = date.month.toString().padLeft(2, '0');
    final String year = date.year.toString();
    return '$day/$month/$year';
  }

  pickStartDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2099),
    ).then((date) {
      setState(() {
        _startDate = date;
      });
    });
  }

  pickEndDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2099),
    ).then((date) {
      setState(() {
        _endDate = date;
      });
    });
  }

  submitTarget() {
    context.read<ProductBloc>().add(
          OnAddProduct(
            ProductModel(
              _titleController.text,
              _categoryController.text,
              _weightController.text,
              _startDate!,
              _endDate!,
              DateTime.now(),
              _statusController.text,
            ),
          ),
        );
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _categoryController.dispose();
    _weightController.dispose();
    _statusController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ConstantText.addProduct,
          style: b1Bold(),
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ConstantText.yourTarget,
                style: b2Bold(),
              ),
              const Gap(4),
              TextFormField(
                controller: _titleController,
                style: b2Bold(),
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: ConstantText.enterYourTarget,
                    hintStyle: b2Reguler(),
                    filled: true,
                    fillColor: Colors.blue.withOpacity(0.2),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none)),
              ),
              const Gap(12),
              Text(
                ConstantText.category,
                style: b2Bold(),
              ),
              const Gap(4),
              DropdownMenu(
                width: MediaQuery.of(context).size.width * 0.7,
                hintText: ConstantText.selectCategory,
                textStyle: b2Bold(),
                controller: _categoryController,
                inputDecorationTheme: InputDecorationTheme(
                    filled: true,
                    fillColor: Colors.blue.withOpacity(0.3),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    )),
                dropdownMenuEntries: const [
                  DropdownMenuEntry(
                      value: "quantitative", label: "Quantitative"),
                  DropdownMenuEntry(value: "qualitative", label: "Qualitative"),
                ],
              ),
              const Gap(12),
              Text(
                ConstantText.weight,
                style: b2Bold(),
              ),
              const Gap(4),
              TextFormField(
                controller: _weightController,
                style: b2Bold(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: ConstantText.weight,
                    hintStyle: b2Reguler(),
                    filled: true,
                    fillColor: Colors.blue.withOpacity(0.2),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    suffixText: "/Kg",
                    suffixStyle: b2Bold()),
              ),
              const Gap(12),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ConstantText.startDate,
                          style: b2Bold(),
                        ),
                        const Gap(4),
                        Container(
                          padding: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  pickStartDate();
                                },
                                icon: const Icon(Icons.calendar_month),
                              ),
                              const Gap(4),
                              Text(
                                _startDate == null
                                    ? ConstantText.formatDate
                                    : _formatDate(_startDate!),
                                style: b2Reguler(),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ConstantText.endDate,
                          style: b2Bold(),
                        ),
                        const Gap(4),
                        Container(
                          padding: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  pickEndDate();
                                },
                                icon: const Icon(Icons.calendar_month),
                              ),
                              const Gap(4),
                              Text(
                                _endDate == null
                                    ? ConstantText.formatDate
                                    : _formatDate(_endDate!),
                                style: b2Reguler(),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(12),
              Text(
                ConstantText.status,
                style: b2Bold(),
              ),
              const Gap(4),
              DropdownMenu(
                controller: _statusController,
                width: MediaQuery.of(context).size.width * 0.7,
                hintText: ConstantText.selectStatus,
                textStyle: b2Bold(),
                inputDecorationTheme: InputDecorationTheme(
                    filled: true,
                    fillColor: Colors.blue.withOpacity(0.3),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    )),
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: "to do", label: "To Do"),
                  DropdownMenuEntry(value: "in progress", label: "In Progress"),
                  DropdownMenuEntry(value: "done", label: "Done"),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocListener<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductFailed) {
              const snackBar = SnackBar(
                content: Text("Add failed"),
                duration: Duration(seconds: 3),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is ProductAddSuccess) {
              context.pushReplacement('/home');
            }
          },
          child: Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () => submitTarget(),
                  padding: const EdgeInsets.all(16),
                  color: Colors.blue.shade600,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    ConstantText.submitText,
                    style: b2Medium(colorText: CustomColor.primary100),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
