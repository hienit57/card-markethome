import 'package:card_markethome/index.dart';

class ProfileInforMeWidget extends StatelessWidget {
  const ProfileInforMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 173,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 138,
            width: context.maxWidth,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x1018280F).withOpacity(0.06),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                  spreadRadius: -2,
                ),
                BoxShadow(
                  color: const Color(0x1018281A).withOpacity(0.10),
                  offset: const Offset(0, 4),
                  blurRadius: 8,
                  spreadRadius: -2,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 38, 16, 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Nguyễn Thị Lan Chinh',
                        style: context.text.titleLarge?.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              AppColors.colorFFE6B0,
                              AppColors.colorE9AC41,
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 3),
                          child: Row(
                            children: [
                              Text(
                                'Vàng',
                                style: context.text.titleMedium?.copyWith(
                                  color: AppColors.color754632,
                                  fontSize: 8,
                                ),
                              ),
                              const AppImage(
                                assetImage:
                                    Assets.lib_assets_icons_ic_arrow_right,
                                width: 8,
                                height: 8,
                                color: AppColors.color754632,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 8),
                    child: Text(
                      'ID: VN4444650132',
                      style: context.text.titleSmall?.copyWith(
                        color: AppColors.grayA6A6A6,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.colorF0FAFF,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              width: 1,
                              color: AppColors.colorB6E0FA,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Hạn mức: ',
                                  style: context.text.titleMedium?.copyWith(
                                    color: AppColors.textPrimary,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  '20.000',
                                  style: context.text.titleMedium?.copyWith(
                                    color: AppColors.textAccent,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const AppImage(
                                  assetImage:
                                      Assets.lib_assets_images_img_d_one,
                                  width: 14,
                                  height: 14,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.colorF0FAFF,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              width: 1,
                              color: AppColors.colorB6E0FA,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Điểm thưởng: ',
                                  style: context.text.titleMedium?.copyWith(
                                    color: AppColors.textPrimary,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  '20.000',
                                  style: context.text.titleMedium?.copyWith(
                                    color: AppColors.textAccent,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const AppImage(
                                  assetImage:
                                      Assets.lib_assets_images_img_d_one,
                                  width: 14,
                                  height: 14,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.all(5),
                child: AppImage(
                  assetImage: Assets.lib_assets_icons_ic_tab_profile_selected,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
