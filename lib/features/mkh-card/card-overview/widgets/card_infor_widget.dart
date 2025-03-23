// import 'package:card_markethome/index.dart';

// class CardInforWidget extends StatelessWidget {
//   const CardInforWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         cardInfor(context),
//         Padding(
//           padding: const EdgeInsets.only(top: 24, bottom: 4),
//           child: Assets.lib_assets_images_img_home_nav_card_rank.svg(),
//         ),
//       ],
//     );
//   }

//   Widget cardInfor(BuildContext context) {
//     return _cardRegistered(context);
//   }

//   Widget _cardNotRegister(BuildContext context) {
//     return Stack(
//       children: [
//         Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             SizedBox(
//               width: double.infinity,
//               child: Assets.lib_assets_images_img_home_register_card_now.svg(
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Padding(
//                 padding: const EdgeInsets.only(bottom: 20),
//                 child: GestureDetector(
//                   behavior: HitTestBehavior.opaque,
//                   onTap: () {
//                     print('Tap here');
//                   },
//                   child: SizedBox(
//                     width: context.maxWidth / 2,
//                     height: 40,
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//         Padding(
//           padding: EdgeInsets.only(
//             top: context.kPaddingToolBar + 10,
//             left: 12,
//             right: 12,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const SizedBox(width: 20),
//               Text(
//                 'Thẻ Markethome',
//                 style: context.text.titleMedium?.copyWith(
//                   fontSize: 16,
//                   color: AppColors.white,
//                 ),
//               ),
//               Assets.lib_assets_icons_ic_close.svg()
//             ],
//           ),
//         )
//       ],
//     );
//   }

//   Widget _cardRegistered(BuildContext context) {
//     return Stack(
//       children: [
//         SizedBox(
//           width: double.infinity,
//           child: Assets.lib_assets_images_img_home_register_card_now.svg(
//             fit: BoxFit.cover,
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(
//             top: context.kPaddingToolBar + 10,
//             left: 12,
//             right: 12,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const SizedBox(width: 20),
//               Text(
//                 'Thẻ Markethome',
//                 style: context.text.titleMedium?.copyWith(
//                   fontSize: 16,
//                   color: AppColors.white,
//                 ),
//               ),
//               Assets.lib_assets_icons_ic_close.svg()
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
