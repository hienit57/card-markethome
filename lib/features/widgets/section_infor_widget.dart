import 'package:card_markethome/index.dart';

class SectionInforWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SectionInforWidget({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            title,
            style: context.text.titleMedium?.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ),
        Container(
          decoration: _buildBoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: children.map((child) {
                final index = children.indexOf(child);

                if (index == children.length - 1) return child;

                return Column(
                  children: [
                    child,
                    DeviderWidget(
                      isVertical: true,
                      sizePadding: 12,
                      color: AppColors.colorE8E8E8,
                      height: 1,
                      width: context.maxWidth,
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
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
    );
  }
}
