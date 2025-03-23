// import 'package:card_markethome/index.dart';

// class PrimaryButton extends StatelessWidget {
//   const PrimaryButton({
//     super.key,
//     required this.title,
//     required this.onTap,
//     this.color,
//     required this.disabled,
//     this.disableColor,
//     required this.width,
//     this.height,
//     this.prefix,
//     this.isLoading = false,
//     this.backgroundColor,
//     this.titleStyle,
//   });
//   final String title;
//   final Function()? onTap;
//   final Color? color;
//   final Color? disableColor;
//   final Color? backgroundColor;
//   final double? width;
//   final double? height;
//   final Widget? prefix;
//   final bool isLoading;
//   final bool disabled;
//   final TextStyle? titleStyle;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: isLoading || disabled ? null : onTap,
//       child: Container(
//         width: width,
//         height: height ?? 48,
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           color: disabled ? AppColors.grey12 : disableColor,

//           ///TODO: ADD ME SOON
//           //gradient: disabled ? null : ,
//         ),
//         child: isLoading
//             ? const SizedBox(
//                 width: 16,
//                 height: 16,
//                 child: CircularProgressIndicator(
//                   color: Colors.white,
//                 ),
//               )
//             : Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     if (prefix != null)
//                       Container(
//                         margin: const EdgeInsets.only(right: 8),
//                         child: prefix,
//                       ),
//                     Text(
//                       title,
//                       style: titleStyle ??
//                           TextStyle(
//                             color:
//                                 disabled ? AppColors.grey72 : AppColors.white,
//                           ),
//                     ),
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
// }
