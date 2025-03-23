// import 'package:card_markethome/index.dart';

// class PrimarySolidButton extends StatelessWidget {
//   const PrimarySolidButton({
//     super.key,
//     required this.title,
//     required this.onTap,
//     this.color,
//     required this.disabled,
//     this.backgroundColor,
//     required this.width,
//     this.height,
//     this.radius,
//     this.prefix,
//     this.isLoading = false,
//     this.textColor,
//     this.titleStyle,
//     this.padding,
//   });

//   final String title;
//   final Function()? onTap;
//   final Color? color;
//   final Color? textColor;
//   final Color? backgroundColor;
//   final double? width;
//   final double? height;
//   final double? radius;
//   final Widget? prefix;
//   final bool isLoading;
//   final bool disabled;
//   final EdgeInsetsGeometry? padding;

//   final TextStyle? titleStyle;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: isLoading || disabled ? null : onTap,
//       child: Stack(
//         children: <Widget>[
//           Container(
//             width: width,
//             height: height ?? 48,
//             padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(radius ?? 8),
//               color: (color ?? Colors.amber).withOpacity(disabled ? .2 : 1),
//             ),
//             child: Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   if (prefix != null)
//                     Container(
//                       margin: const EdgeInsets.only(right: 8),
//                       child: prefix,
//                     ),
//                   Flexible(
//                     child: Text(
//                       title,
//                       textAlign: TextAlign.center,
//                       style: titleStyle ??
//                           TextStyle(
//                             height: 1,
//                             color: disabled
//                                 ? AppColors.grey72
//                                 : (textColor ?? AppColors.white),
//                           ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           if (isLoading)
//             const Positioned(
//               right: 20,
//               top: 0,
//               bottom: 0,
//               child: Center(
//                 child: SizedBox(
//                   width: 16,
//                   height: 16,
//                   child: CircularProgressIndicator(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             )
//         ],
//       ),
//     );
//   }
// }
