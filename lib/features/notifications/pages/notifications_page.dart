import 'package:card_markethome/features/index.dart';
import 'package:card_markethome/index.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  static const routeName = '/notifications';

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const BaseAppBar(
        title: 'Thông báo',
        isBack: false,
      ),
      body: Container(
        color: AppColors.colorF3F3F3,
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return const ItemNotificationWidget();
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: 7,
        ),
      ),
    );
  }
}
