import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_terget_app/common/my_text_field.dart';
import 'package:my_terget_app/core/constants/constant_text.dart';
import 'package:my_terget_app/core/style/style_color.dart';
import 'package:my_terget_app/core/style/style_text.dart';
import 'package:my_terget_app/features/business/data/models/business_model.dart';
import 'package:my_terget_app/features/business/domain/entities/business.dart';
import 'package:my_terget_app/features/business/presentation/blocs/business/business_bloc.dart';

class EditBusinessPage extends StatefulWidget {
  const EditBusinessPage({
    super.key,
    required this.business,
    required this.index,
  });

  final Business business;
  final int index;

  @override
  State<EditBusinessPage> createState() => _EditBusinessPageState();
}

class _EditBusinessPageState extends State<EditBusinessPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _strategyController = TextEditingController();
  final TextEditingController _modalController = TextEditingController();
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

  updateBusiness() {
    context.read<BusinessBloc>().add(
          OnUpdateBusiness(
              BusinessModel(
                _titleController.text,
                _strategyController.text,
                _modalController.text,
                _startDate!,
                _endDate!,
                DateTime.now(),
                _statusController.text,
              ),
              widget.index),
        );
  }

  deleteBusiness() {
    context.read<BusinessBloc>().add(OnDeleteBusiness(widget.index));
  }

  getExtra() {
    _titleController.text = widget.business.title;
    _strategyController.text = widget.business.strategi;
    _modalController.text = widget.business.modal;
    _statusController.text = widget.business.status;
    _startDate = widget.business.startDate;
    _endDate = widget.business.endDate;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getExtra();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _strategyController.dispose();
    _modalController.dispose();
    _statusController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ConstantText.editBusiness,
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
              MyTextField(
                controller: _titleController,
                hintText: ConstantText.enterYourTarget,
              ),
              const Gap(12),
              Text(
                ConstantText.strategy,
                style: b2Bold(),
              ),
              const Gap(4),
              MyTextField(
                controller: _modalController,
                hintText: ConstantText.enterCapitalVenture,
                textInputType: TextInputType.number,
              ),
              const Gap(12),
              Text(
                ConstantText.modal,
                style: b2Bold(),
              ),
              const Gap(4),
              TextFormField(
                controller: _modalController,
                style: b2Bold(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: ConstantText.enterCapitalVenture,
                    hintStyle: b2Reguler(),
                    filled: true,
                    fillColor: Colors.blue.withOpacity(0.2),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    prefixText: "Rp.",
                    prefixStyle: b2Bold()),
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
        child: BlocListener<BusinessBloc, BusinessState>(
          listener: (context, state) {
            if (state is BusinessFailed) {
              const snackBar = SnackBar(
                content: Text("Add failed"),
                duration: Duration(seconds: 3),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is BusinessUpdateSuccess) {
              context.pushReplacement('/home');
            }
            if (state is BusinessDeleteSuccess) {
              context.pushReplacement('/home');
            }
          },
          child: Row(
            children: [
              IconButton.filledTonal(
                color: CustomColor.danger600,
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          ConstantText.deleteTarget,
                          style: h4Medium(),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                ConstantText.cancel,
                                style: b2Medium(),
                              )),
                          TextButton(
                            onPressed: () {
                              deleteBusiness();
                            },
                            child: Text(
                              ConstantText.delete,
                              style: b2Medium(colorText: CustomColor.danger700),
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.delete),
              ),
              const Gap(16),
              Expanded(
                child: MaterialButton(
                  onPressed: () => updateBusiness(),
                  padding: const EdgeInsets.all(16),
                  color: Colors.blue.shade600,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    ConstantText.updateText,
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
