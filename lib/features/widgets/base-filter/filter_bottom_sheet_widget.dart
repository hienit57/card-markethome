import 'package:card_markethome/core/extentions/index.dart';
import 'package:card_markethome/features/index.dart';
import 'package:flutter/services.dart';

import '../../../../../index.dart';

class BaseFilterBottomSheetWidget extends StatefulWidget {
  const BaseFilterBottomSheetWidget({
    super.key,
    required this.onReset,
    required this.onApplyFilter,
  });

  final Function() onReset;
  final Function() onApplyFilter;

  @override
  State<BaseFilterBottomSheetWidget> createState() =>
      _BaseFilterBottomSheetWidgetState();
}

class _BaseFilterBottomSheetWidgetState
    extends State<BaseFilterBottomSheetWidget> {
  final ValueNotifier<PriceEnum?> priceSelected =
      ValueNotifier<PriceEnum?>(null);

  final TextEditingController txtMinPrice = TextEditingController();
  final TextEditingController txtMaxPrice = TextEditingController();
  final ValueNotifier<bool> isInvalidPrice = ValueNotifier<bool>(false);

  late ValueNotifier<DateTime?> startTimeNotifier;
  late ValueNotifier<DateTime?> endTimeNotifier;
  late ValueNotifier<TimeFilterEnum> timeSelectedNotifier;

  @override
  void initState() {
    super.initState();
    startTimeNotifier = ValueNotifier<DateTime?>(null);
    endTimeNotifier = ValueNotifier<DateTime?>(null);
    timeSelectedNotifier = ValueNotifier<TimeFilterEnum>(TimeFilterEnum.today);
  }

  @override
  void dispose() {
    priceSelected.dispose();
    txtMinPrice.dispose();
    txtMaxPrice.dispose();
    isInvalidPrice.dispose();
    startTimeNotifier.dispose();
    endTimeNotifier.dispose();
    timeSelectedNotifier.dispose();
    super.dispose();
  }

  void _updateInvalidPrice() {
    priceSelected.value = PriceEnum.other;
    double minPrice = double.tryParse(txtMinPrice.text) ?? 0;
    double maxPrice = double.tryParse(txtMaxPrice.text) ?? double.infinity;
    isInvalidPrice.value = minPrice > maxPrice;
  }

  void _updateInvalidTime({
    TimeFilterEnum? timeEnum,
    DateTime? startTime,
    DateTime? endTime,
  }) {
    final DateTime timeNow = DateTime.now();

    if (timeEnum != null) {
      if (timeEnum == TimeFilterEnum.today) {
        startTimeNotifier.value = timeNow.startDate;
        endTimeNotifier.value = timeNow.endDate;
      }
      if (timeEnum == TimeFilterEnum.week) {
        startTimeNotifier.value = timeNow.startThisWeek;
        endTimeNotifier.value = timeNow.endThisWeek;
      }

      if (timeEnum == TimeFilterEnum.month) {
        startTimeNotifier.value = timeNow.startThisMonth;
        endTimeNotifier.value = timeNow.endThisMonth;
      }
    }
    if (startTime != null) {
      startTimeNotifier.value = startTime;
      timeSelectedNotifier.value = TimeFilterEnum.other;
    }
    if (endTime != null) {
      endTimeNotifier.value = endTime;
      timeSelectedNotifier.value = TimeFilterEnum.other;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //context.hideKeyboard();
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        child: Container(
          color: AppColors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Assets.lib_assets_icons_ic_close.svg(
                      color: AppColors.neutral900,
                    ),
                    Text(
                      'Lọc',
                      style: context.text.titleLarge?.copyWith(
                        fontSize: 16,
                        color: AppColors.neutral900,
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
              Container(height: 1, color: AppColors.colorE8E8E8),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildPriceFilterWidget(context),
                    buildTimeFilterWidget(context),
                  ],
                ),
              ),
              _buildButtonBottom(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonBottom(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: CommonOutlineButton(
              title: 'Thiết lập lại',
              colorOutline: AppColors.textAccent,
              onPressed: () => widget.onReset.call(),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: CustomSolidButton(
              title: 'Áp dụng',
              backgroundColor: AppColors.textAccent,
              onTap: () => widget.onApplyFilter.call(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPriceFilterWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Khoảng giá',
            style: context.text.titleLarge!.copyWith(
              fontSize: 16,
              color: AppColors.neutral900,
            ),
          ),
          const SizedBox(height: 10),
          ValueListenableBuilder<PriceEnum?>(
            valueListenable: priceSelected,
            builder: (context, selectedPrice, child) {
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildItemSelect(
                    context,
                    title: PriceEnum.price0_1000k.title,
                    isSelected: selectedPrice == PriceEnum.price0_1000k,
                    onTap: () => priceSelected.value = PriceEnum.price0_1000k,
                  ),
                  _buildItemSelect(
                    context,
                    title: PriceEnum.price1000k_5000k.title,
                    isSelected: selectedPrice == PriceEnum.price1000k_5000k,
                    onTap: () =>
                        priceSelected.value = PriceEnum.price1000k_5000k,
                  ),
                  _buildItemSelect(
                    context,
                    title: PriceEnum.price5000k.title,
                    isSelected: selectedPrice == PriceEnum.price5000k,
                    onTap: () => priceSelected.value = PriceEnum.price5000k,
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Hoặc nhập khoảng giá',
            style: context.text.titleMedium!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColors.greyLightTextColor,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: _buildTextField(
                  context,
                  title: 'Từ',
                  placeholder: 'Giá thấp nhất',
                  controller: txtMinPrice,
                  onChange: (value) => _updateInvalidPrice.call(),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 4,
                child: ValueListenableBuilder<PriceEnum?>(
                  valueListenable: priceSelected,
                  builder: (context, selectedPrice, child) {
                    if (selectedPrice == PriceEnum.price5000k) {
                      return const SizedBox.shrink();
                    }
                    return _buildTextField(
                      context,
                      title: 'Đến',
                      placeholder: 'Giá cao nhất',
                      controller: txtMaxPrice,
                      onChange: (value) => _updateInvalidPrice.call(),
                    );
                  },
                ),
              ),
            ],
          ),
          ValueListenableBuilder<bool>(
            valueListenable: isInvalidPrice,
            builder: (context, invalid, child) {
              if (invalid) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    '"Giá thấp nhất" phải nhỏ hơn "Giá cao nhất"',
                    style: context.text.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.red500,
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  Widget buildTimeFilterWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Thời gian',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          ValueListenableBuilder<TimeFilterEnum>(
            valueListenable: timeSelectedNotifier,
            builder: (context, timeSelected, child) {
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildItemSelect(
                    context,
                    title: 'Hôm nay',
                    isSelected: timeSelected == TimeFilterEnum.today,
                    onTap: () {
                      timeSelectedNotifier.value = TimeFilterEnum.today;
                    },
                  ),
                  _buildItemSelect(
                    context,
                    title: 'Tuần này',
                    isSelected: timeSelected == TimeFilterEnum.week,
                    onTap: () {
                      timeSelectedNotifier.value = TimeFilterEnum.week;
                    },
                  ),
                  _buildItemSelect(
                    context,
                    title: 'Tháng này',
                    isSelected: timeSelected == TimeFilterEnum.month,
                    onTap: () {
                      timeSelectedNotifier.value = TimeFilterEnum.month;
                    },
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 10),
          Text(
            'Hoặc nhập khoảng thời gian',
            style: context.text.titleMedium!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColors.greyLightTextColor,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Từ'),
                    ValueListenableBuilder<DateTime?>(
                      valueListenable: startTimeNotifier,
                      builder: (context, startTime, child) {
                        return TimeFilterWidget(
                          timeSelected: startTime != null
                              ? startTime.toddMMMyyyy
                              : 'Từ ngày',
                          minTimeSelect: DateTime(2020, 1, 1),
                          maxTimeSelect: endTimeNotifier.value,
                          onDateTimeChanged: (dateTime) {
                            _updateInvalidTime(
                              timeEnum: TimeFilterEnum.other,
                              startTime: dateTime,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Đến'),
                    ValueListenableBuilder<DateTime?>(
                      valueListenable: endTimeNotifier,
                      builder: (context, endTime, child) {
                        return TimeFilterWidget(
                          timeSelected: endTime != null
                              ? endTime.toddMMMyyyy
                              : 'Đến ngày',
                          minTimeSelect:
                              startTimeNotifier.value ?? DateTime(2020, 1, 1),
                          onDateTimeChanged: (dateTime) {
                            _updateInvalidTime(
                              timeEnum: TimeFilterEnum.other,
                              endTime: dateTime,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required TextEditingController controller,
    required String title,
    String? placeholder,
    Function(String)? onChange,
    bool readOnly = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.text.titleMedium?.copyWith(
            color: AppColors.neutral900,
          ),
        ),
        AppTextField(
          borderRadius: 8,
          borderColor: AppColors.grey79,
          controller: controller,
          placeholder: placeholder,
          onChanged: onChange,
          keyboardType: TextInputType.number,
          inputFormatters: [
            // AppTextInputFormatter.currency,
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(11),
          ],
          readOnly: readOnly,
          hintStyle: context.text.titleMedium!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.gray400,
          ),
        ),
      ],
    );
  }

  Widget _buildItemSelect(
    BuildContext context, {
    required String title,
    bool isSelected = false,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: () => onTap?.call(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? Border.all(color: AppColors.blueEdit)
              : Border.all(color: AppColors.borderColor),
          color: isSelected ? AppColors.blueEdit : AppColors.white,
        ),
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.text.titleLarge!.copyWith(
            color: isSelected ? AppColors.white : AppColors.gray800,
          ),
        ),
      ),
    );
  }
}
