import 'package:card_markethome/index.dart';

class TransactionDetailPage extends StatelessWidget {
  const TransactionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const BaseAppBar(
        title: 'Chi tiết giao dịch',
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      color: AppColors.colorF3F3F3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _buildTransactionAmount(context),
            const SizedBox(height: 16),
            const SectionInforWidget(
              title: 'Thông tin chủ thẻ',
              children: [
                RowTitleContentWidget(
                  title: 'Tên chủ thẻ',
                  content: '-500.000đ',
                ),
                RowTitleContentWidget(
                  title: 'ID VDone',
                  content: 'VN346KH76',
                ),
                RowTitleContentWidget(
                  title: 'Số điện thoại',
                  content: '0342078965',
                ),
              ],
            ),
            const SizedBox(height: 16),
            const SectionInforWidget(
              title: 'Chi tiết giao dịch',
              children: [
                RowTitleContentWidget(
                  title: 'Loại giao dịch',
                  content: 'Mua gói Makethome',
                ),
                RowTitleContentWidget(
                  title: 'Giá tiền',
                  content: '5.000.000đ',
                ),
                RowTitleContentWidget(
                  title: 'Số lượng D-One',
                  content: '10.000 D-One',
                ),
                RowTitleContentWidget(
                  title: 'Số lượng',
                  content: '1',
                ),
                RowTitleContentWidget(
                  title: 'Tổng tiền thanh toán',
                  content: '5.000.000đ',
                ),
                RowTitleContentWidget(
                  title: 'Hạn mức nhận được',
                  content: '10.000 D-One',
                ),
              ],
            ),
            const SizedBox(height: 16),
            const SectionInforWidget(
              title: 'Người giới thiệu',
              children: [
                RowTitleContentWidget(
                  title: 'Tên chủ thẻ',
                  content: 'Nguyễn Thị Lan',
                ),
                RowTitleContentWidget(
                  title: 'ID VDone',
                  content: 'VN346KH76',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionAmount(BuildContext context) {
    return Container(
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
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Text(
              '-500.000đ',
              style: context.text.titleLarge?.copyWith(
                color: AppColors.textPrimary,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              decoration: BoxDecoration(
                color: AppColors.colorFDF2DC,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                child: Text(
                  'Chờ xử lý',
                  style: context.text.titleLarge?.copyWith(
                    color: AppColors.colorF08315,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
