import 'package:card_markethome/index.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

typedef DropdownItemBuilder<T> = Widget Function(T item);

class DropDownWidget<T> extends StatefulWidget {
  const DropDownWidget({
    super.key,
    required this.items,
    required this.builderItem,
    this.onChanged,
    this.customButtonDropdown,
    this.itemHeight,
  });

  final List<T> items;
  final Function(T?)? onChanged;
  final Widget? customButtonDropdown;
  final DropdownItemBuilder<T> builderItem;
  final double? itemHeight;

  @override
  State<DropDownWidget<T>> createState() => _DropDownWidgetState<T>();
}

class _DropDownWidgetState<T> extends State<DropDownWidget<T>> {
  T? _valueSelected;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      // ignore: always_specify_types
      child: DropdownButton2(
        customButton: widget.customButtonDropdown,
        isExpanded: true,
        hint: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Select Item',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.yellow,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        items: widget.items
            // ignore: always_specify_types
            .map((item) => DropdownMenuItem<T>(
                value: item, child: widget.builderItem(item)))
            .toList(),
        value: _valueSelected,
        onChanged: (T? value) {
          widget.onChanged?.call(value);
        },
        menuItemStyleData: widget.itemHeight != null
            ? MenuItemStyleData(
                height: widget.itemHeight!,
              )
            : const MenuItemStyleData(),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors.white,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 4),
                blurRadius: 10,
              ),
            ],
          ),
          //offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
      ),
    );
  }
}
