import 'package:card_markethome/domain/index.dart';

class CardUsecase {
  CardUsecase({
    required CardRepository repository,
  }) : _cardRepository = repository;

  final CardRepository _cardRepository;

  ///CARD PACKAGE
  Future<CardMarkethomeReponse?> fetchCardPackages({
    required int agencyId,
  }) async =>
      await _cardRepository.fetchCardPackages(agencyId: agencyId);

  Future<CardDetailResponse?> fetchCardPackageDetail({
    required int agencyId,
    required int packId,
  }) async =>
      await _cardRepository.fetchCardPackageDetail(
        agencyId: agencyId,
        packId: packId,
      );

  ///REGISTER CARD
  Future<AgencyCardMKHReponse?> fetchAgenciesSellingCards() async =>
      await _cardRepository.fetchAgenciesSellingCards();

  Future<BillModel?> createBillBuyCard({
    required int agencyId,
    required CreateBillBuyCardPayload request,
  }) async =>
      await _cardRepository.createBillBuyCard(
        agencyId: agencyId,
        request: request,
      );

  Future<TransactionModel?> createRequestBuyCard({
    required int agencyId,
    required CreateRequestBuyCardPayload payload,
  }) async =>
      await _cardRepository.createRequestBuyCard(
        agencyId: agencyId,
        payload: payload,
      );

  Future<bool> confirmPayment({
    required int transactionId,
  }) async {
    final response = await _cardRepository.confirmPayment(
      transactionId: transactionId,
    );

    return response?.result ?? false;
  }

  Future<bool> cancelTransaction({
    required int transactionId,
  }) async {
    final response = await _cardRepository.cancelTransaction(
      transactionId: transactionId,
    );

    return response?.result ?? false;
  }

  ///CARD RANK
  Future<CardRankModel?> fetchNextCardRank({
    required int packId,
    required int amount,
  }) async =>
      (await _cardRepository.fetchNextCardRank(
        packId: packId,
        amount: amount,
      ))
          ?.rank;

  Future<UserCardModel?> fetchUserCardInfo() async =>
      await _cardRepository.fetchUserCardInfo();

  Future<List<CardRankModel>?> fetchCardRanks() async =>
      (await _cardRepository.fetchCardRanks())?.ranks;
}
