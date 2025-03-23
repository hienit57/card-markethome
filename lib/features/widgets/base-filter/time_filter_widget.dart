import 'dart:io';
import 'package:card_markethome/index.dart';
import 'package:flutter/cupertino.dart';

class TimeFilterWidget extends StatefulWidget {
  const TimeFilterWidget({
    super.key,
    required this.timeSelected,
    required this.onDateTimeChanged,
    required this.minTimeSelect,
    this.maxTimeSelect,
  });

  final String timeSelected;
  final Function(DateTime) onDateTimeChanged;
  final DateTime minTimeSelect;
  final DateTime? maxTimeSelect;

  @override
  State<TimeFilterWidget> createState() => _TimeFilterWidgetState();
}

class _TimeFilterWidgetState extends State<TimeFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onPickingDate(),
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.grey79,
            )),
        child: Text(widget.timeSelected),
      ),
    );
  }

  Future<void> _onPickingDate() async {
    if (Platform.isAndroid) {
      _showDialogSelectDate(context);
    } else {
      await showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) {
          return Material(
            child: SizedBox(
              height: 226,
              child: SafeArea(
                top: false,
                minimum: const EdgeInsets.only(bottom: 16),
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Spacer(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: CupertinoDatePicker(
                        onDateTimeChanged: widget.onDateTimeChanged,
                        initialDateTime: DateTime(
                            widget.minTimeSelect.year,
                            widget.minTimeSelect.month,
                            widget.minTimeSelect.day + 1),
                        minimumDate: widget.minTimeSelect,
                        maximumDate: widget.maxTimeSelect ??
                            DateTime(
                              DateTime.now().year,
                              DateTime.now().month,
                              DateTime.now().day + 2,
                            ),
                        use24hFormat: true,
                        mode: CupertinoDatePickerMode.date,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }

  void _showDialogSelectDate(BuildContext context) {
    showDatePicker(
        context: context,
        initialDate: DateTime(widget.minTimeSelect.year,
            widget.minTimeSelect.month, widget.minTimeSelect.day + 1),
        firstDate: widget.minTimeSelect,
        lastDate: widget.maxTimeSelect ?? DateTime.now(),
        fieldHintText: 'dd/mm/yyyy',
        // confirmText: S.of(context).cta_Accept.toUpperCase(),
        builder: (BuildContext? context, Widget? child) {
          return child!;
        }).then((DateTime? date) {
      if (date != null) {
        widget.onDateTimeChanged(date);
      }
    });
  }
}
