import 'package:card_markethome/features/index.dart';
import 'package:card_markethome/index.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  static const routeName = '/activity';

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const ActivityAppBar(),
      body: Container(
        color: AppColors.colorF3F3F3,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text(
                    'Tháng 10',
                    style: context.text.titleLarge?.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(height: 1, color: AppColors.colorE8E8E8),
                ...List.generate(3, (index) => const ItemActivityWidget())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
