import 'package:card_markethome/index.dart';
import 'package:flutter/services.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    super.key,
    this.isClose = true,
    this.isBack = true,
    this.showShape = false,
    this.title,
    this.onBack,
    this.titleWidget,
    this.backButtonColor,
    this.backgroundColor,
    this.bottom,
    this.leadingWidth,
    this.actions,
    //this.elevation,
    this.centerTitle = true,
    this.onClosed,
    this.textStyle,
    this.titleSpacing,
    this.titleColor = AppColors.black,
  });

  final String? title;
  final Color titleColor;
  final Widget? titleWidget;
  //final double? elevation;
  final bool isClose;
  final bool isBack;
  final bool showShape;
  final bool centerTitle;

  final Function()? onBack;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? backButtonColor;
  final PreferredSizeWidget? bottom;
  final double? leadingWidth;
  final double? titleSpacing;
  final Function()? onClosed;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        // shadowColor: elevation != null && elevation! > 0
        //     ? Colors.grey.withOpacity(.2)
        //     : Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        title: titleWidget ??
            Text(
              title ?? '',
              style: textStyle ??
                  context.text.titleLarge?.copyWith(
                    fontSize: 16,
                    color: titleColor,
                  ),
            ),
        backgroundColor: backgroundColor ?? Colors.transparent,
        surfaceTintColor: Colors.white,
        //elevation: elevation ?? 0.0,
        centerTitle: centerTitle,
        titleSpacing: titleSpacing,
        leadingWidth: leadingWidth,
        automaticallyImplyLeading: false,
        leading: isBack
            ? Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: GestureDetector(
                  onTap: onBack ?? () => Navigation.pop(context),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Center(
                      child: AppImage(
                        assetImage: Assets.lib_assets_icons_ic_arrow_back,
                        color: titleColor,
                      ),
                    ),
                  ),
                ),
              )
            : null,
        shape:
            showShape ? null : Border.all(width: 0, color: Colors.transparent),
        bottom: bottom != null
            ? PreferredSize(
                preferredSize:
                    Size.fromHeight(bottom!.preferredSize.height + 1),
                child: Column(
                  children: [
                    bottom!,
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.colorE8E8E8,
                    ),
                  ],
                ),
              )
            : const PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Divider(
                    height: 1, thickness: 1, color: AppColors.colorE8E8E8),
              ),
        actions: actions
        // ??
        // <Widget>[
        //   if (isClose)
        //     CustomCloseButton(
        //       alignment: Alignment.center,
        //       onPressed: onClosed,
        //     ),
        // ],
        );
  }

  static final AppBar _appBar = AppBar();

  @override
  Size get preferredSize => _appBar.preferredSize;
}
