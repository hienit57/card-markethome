import 'package:card_markethome/index.dart';

class PurchaseBatchPage extends StatelessWidget {
  const PurchaseBatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const BaseAppBar(
        title: 'Chi tiết gói',
      ),
      body: Container(
        color: AppColors.colorF3F3F3,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return const ItemPurchaseBatchWidget();
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: 7,
          ),
        ),
      ),
    );
  }
}
