import 'package:flutter/material.dart';
import 'package:card_markethome/core/index.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String cancelText;
  final String confirmText;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;
  final bool isOnlyConfirm;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    this.cancelText = 'Huỷ',
    this.confirmText = 'Xác nhận',
    this.onCancel,
    this.onConfirm,
    this.isOnlyConfirm = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                title,
                style: context.text.titleMedium?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 1,
              color: const Color(0xFFE8E8E8),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              child: Text(
                message,
                style: context.text.bodyMedium?.copyWith(
                  fontSize: 14,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  if (!isOnlyConfirm) ...[
                    Expanded(
                      child: CustomSolidButton(
                        radius: 8,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        backgroundColor: AppColors.colorF3F3F3,
                        title: 'Huỷ',
                        titleStyle: context.text.titleMedium?.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                        ),
                        onTap: onCancel ?? () => Navigation.pop(context),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  Expanded(
                    child: CustomSolidButton(
                      radius: 8,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      backgroundColor: AppColors.textAccent,
                      title: 'Xác nhận',
                      titleStyle: context.text.titleMedium?.copyWith(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                      onTap: onConfirm ?? () => Navigation.pop(context),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18)
          ],
        ),
      ),
    );
  }

  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String message,
    String? cancelText,
    String? confirmText,
    VoidCallback? onCancel,
    VoidCallback? onConfirm,
  }) {
    return showGeneralDialog<bool>(
      context: context,
      barrierDismissible: false,
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation1, animation2) => ConfirmationDialog(
        title: title,
        message: message,
        cancelText: cancelText ?? 'Huỷ',
        confirmText: confirmText ?? 'Xác nhận',
        onCancel: onCancel,
        onConfirm: onConfirm,
      ),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return child;
        // ScaleTransition(
        //   scale: Tween<double>(begin: 0.5, end: 1.0).animate(
        //     CurvedAnimation(
        //       parent: animation,
        //       curve: Curves.fastOutSlowIn,
        //     ),
        //   ),
        //   child: child,
        // );
      },
    );
  }

  static Future<bool?> showOnlyConfirm({
    required BuildContext context,
    required String title,
    required String message,
    String? cancelText,
    String? confirmText,
    VoidCallback? onConfirm,
  }) {
    return showGeneralDialog<bool>(
      context: context,
      barrierDismissible: false,
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation1, animation2) => ConfirmationDialog(
        title: title,
        message: message,
        cancelText: cancelText ?? 'Huỷ',
        confirmText: confirmText ?? 'Xác nhận',
        onConfirm: onConfirm,
        isOnlyConfirm: true,
      ),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return child;
        // ScaleTransition(
        //   scale: Tween<double>(begin: 0.5, end: 1.0).animate(
        //     CurvedAnimation(
        //       parent: animation,
        //       curve: Curves.fastOutSlowIn,
        //     ),
        //   ),
        //   child: child,
        // );
      },
    );
  }
}
