import 'package:card_markethome/index.dart';

class AddressTitleDropdownWidget extends StatelessWidget {
  const AddressTitleDropdownWidget({
    super.key,
    required this.title,
    this.isRequired = true,
    required this.placeHolder,
    this.content,
    required this.items,
    this.onChanged,
  });
  final String title;
  final bool isRequired;

  final String placeHolder;
  final String? content;

  final List<dynamic> items;
  final Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.text.titleMedium?.copyWith(
                fontSize: 12,
              ),
            ),
            if (isRequired) ...[
              Text(
                ' *',
                style: context.text.titleMedium?.copyWith(
                  fontSize: 12,
                  color: AppColors.red500,
                ),
              ),
            ]
          ],
        ),
        const SizedBox(height: 6),
        DropDownWidget(
          customButtonDropdown: Container(
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.outline,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      content ?? placeHolder,
                      style: context.text.titleSmall?.copyWith(
                        fontSize: 12,
                        color: content != null
                            ? AppColors.gray800
                            : AppColors.gray400,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const AppImage(
                    assetImage: Assets.lib_assets_icons_ic_arrow_down,
                    width: 16,
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
          items: items,
          builderItem: (item) {
            return Text(
              item.name,
              style: context.text.titleMedium?.copyWith(
                color: AppColors.gray400,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
          onChanged: onChanged,
        ),
      ],
    );
  }
}
