import 'package:card_markethome/index.dart';

class AppSearchTextField extends StatefulWidget {
  const AppSearchTextField({
    super.key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.readOnly = false,
  });

  final String? hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;

  final FocusNode? focusNode;

  final bool readOnly;

  @override
  State<AppSearchTextField> createState() => _AppSearchTextFieldState();
}

class _AppSearchTextFieldState extends State<AppSearchTextField> {
  final ValueNotifier<bool> _isFocusSearch = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(() {
      if (!(widget.focusNode?.hasFocus ?? false)) {
        _isFocusSearch.value = false;
      }
    });
  }

  @override
  void dispose() {
    widget.focusNode?.dispose(); // Dispose the FocusNode
    _isFocusSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isFocusSearch,
      builder: (context, isError, child) {
        return AppTextField(
          focusNode: widget.focusNode,
          readOnly: widget.readOnly,

          ///TODO: ADD ME SOON
          // borderColor:
          //     _isFocusSearch.value ? AppColors.subMain : AppColors.neutral300,
          placeholder: widget.hintText ?? 'Tìm kiếm',
          controller: widget.controller,

          ///TODO: ADD ME SOON

          prefix: Padding(
            padding: const EdgeInsets.all(12),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Assets.lib_assets_icons_ic_arrow_left.svg(),
            ),
          ),
          suffix: _isFocusSearch.value
              ? GestureDetector(
                  onTap: () {
                    widget.controller?.clear();
                    widget.onChanged?.call('');
                  },
                  child: Assets.lib_assets_icons_ic_close_circle.svg())
              : null,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          borderRadius: 8,
          onTap: () => _isFocusSearch.value = true,
          onChanged: (value) {
            _isFocusSearch.value = true;
            widget.onChanged?.call(value);
          },
          onFieldSubmitted: widget.onFieldSubmitted,
          //hasHiddenWhenTapOutside: true,
        );
      },
    );
  }
}
