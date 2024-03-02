import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_terget_app/core/constants/constant_text.dart';
import 'package:my_terget_app/core/style/style_color.dart';
import 'package:my_terget_app/core/style/style_text.dart';
import 'package:my_terget_app/features/marketing/data/models/marketing_model.dart';
import 'package:my_terget_app/features/marketing/domain/entities/marketing.dart';
import 'package:my_terget_app/features/marketing/presentation/blocs/marketing/marketing_bloc.dart';

class EditMarketingPage extends StatefulWidget {
  const EditMarketingPage({super.key, required this.marketing, required this.index});

  final Marketing marketing;
  final int index;

  @override
  State<EditMarketingPage> createState() => _EditMarketingPageState();
}

class _EditMarketingPageState extends State<EditMarketingPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _demografiController = TextEditingController();
  final TextEditingController _targetController = TextEditingController();
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

  updateMarketing() {
    context.read<MarketingBloc>().add(
          OnUpdateMarketing(
            MarketingModel(
              _titleController.text,
              _demografiController.text,
              _targetController.text,
              _startDate!,
              _endDate!,
              DateTime.now(),
              _statusController.text,
            ),
            widget.index
          ),
        );
  }

  deleteMarketing(){
    context.read<MarketingBloc>().add(OnDeleteMarketing(widget.index));
  }

  getExtra(){
    _titleController.text = widget.marketing.title;
    _demografiController.text = widget.marketing.demografi;
    _targetController.text = widget.marketing.target;
    _statusController.text = widget.marketing.status;
    _startDate = widget.marketing.startDate;
    _endDate = widget.marketing.endDate;
  }

  @override
  void initState() {
    super.initState();
    getExtra();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _demografiController.dispose();
    _targetController.dispose();
    _statusController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ConstantText.editMarketing,
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
                ConstantText.demographics,
                style: b2Bold(),
              ),
              const Gap(4),
              TextFormField(
                controller: _demografiController,
                style: b2Bold(),
                decoration: InputDecoration(
                  hintText: ConstantText.enterDemographics,
                  hintStyle: b2Reguler(),
                  filled: true,
                  fillColor: Colors.blue.withOpacity(0.2),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
              const Gap(12),
              Text(
                ConstantText.profitTarget,
                style: b2Bold(),
              ),
              const Gap(4),
              TextFormField(
                controller: _targetController,
                style: b2Bold(),
                keyboardType: TextInputType.number,
                
                decoration: InputDecoration(
                    hintText: ConstantText.enterProfitTarger,
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
        child: BlocListener<MarketingBloc, MarketingState>(
          listener: (context, state) {
            if (state is MarketingFailed) {
              const snackBar = SnackBar(
                content: Text("Add failed"),
                duration: Duration(seconds: 3),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is MarketingUpdateSuccess) {
              context.pushReplacement('/home');
            }
            if (state is MarketingDeleteSuccess) {
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
                              deleteMarketing();
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
                  onPressed: () => updateMarketing(),
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
