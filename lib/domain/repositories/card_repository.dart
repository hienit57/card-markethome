import 'package:card_markethome/domain/index.dart';

abstract class CardRepository {
  ///CARD PACKAGE
  Future<CardMarkethomeReponse?> fetchCardPackages({
    required int agencyId,
  });

  Future<CardDetailResponse?> fetchCardPackageDetail({
    required int agencyId,
    required int packId,
  });

  ///REGISTER CARD
  Future<AgencyCardMKHReponse?> fetchAgenciesSellingCards();
  Future<BillModel?> createBillBuyCard({
    required int agencyId,
    required CreateBillBuyCardPayload request,
  });
  Future<TransactionModel?> createRequestBuyCard({
    required int agencyId,
    required CreateRequestBuyCardPayload payload,
  });
  Future<BaseResultResponse?> confirmPayment({
    required int transactionId,
  });
  Future<BaseResultResponse?> cancelTransaction({
    required int transactionId,
  });
  Future<CardRankResponse?> fetchNextCardRank({
    required int packId,
    required int amount,
  });

  ///CARD INFO
  Future<UserCardModel?> fetchUserCardInfo();
  Future<CardRanksResponse?> fetchCardRanks();
}
