import '../index.dart';

class CardRepositoryImpl implements CardRepository {
  CardRepositoryImpl();

  ///REGISTER CARD
  @override
  Future<AgencyCardMKHReponse?> fetchAgenciesSellingCards() async {
    try {
      final queryParameters = {
        'page': 1,
        'pageSize': 10,
        'type': 1,
      };

      final response = await ApiDioHelper().get(
        AppUrl.fetchAgenciesSellingCard,
        request: queryParameters,
      );

      return AgencyCardMKHReponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) return null;
      } else {}
    }

    return null;
  }

  @override
  Future<CardMarkethomeReponse?> fetchCardPackages({
    required int agencyId,
  }) async {
    try {
      final path = AppUrl.fetchCardPackages.replaceFirst(
        "{agencyId}",
        agencyId.toString(),
      );

      final response = await ApiDioHelper().get(path);

      return CardMarkethomeReponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) return null;
      } else {}
    }

    return null;
  }

  @override
  Future<CardDetailResponse?> fetchCardPackageDetail({
    required int agencyId,
    required int packId,
  }) async {
    try {
      final path = AppUrl.fetchCardPackageDetail
          .replaceFirst(
            "{agencyId}",
            agencyId.toString(),
          )
          .replaceFirst(
            "{packId}",
            packId.toString(),
          );

      final response = await ApiDioHelper().get(path);

      return CardDetailResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) return null;
      } else {}
    }

    return null;
  }

  @override
  Future<BillModel?> createBillBuyCard({
    required int agencyId,
    required CreateBillBuyCardPayload request,
  }) async {
    try {
      final path = AppUrl.createBillBuyCard.replaceFirst(
        "{agencyId}",
        agencyId.toString(),
      );

      final response = await ApiDioHelper().post(
        path: path,
        request: request.toJson(),
      );
      return BillModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) return null;
      } else {}
    }

    return null;
  }

  @override
  Future<TransactionModel?> createRequestBuyCard({
    required int agencyId,
    required CreateRequestBuyCardPayload payload,
  }) async {
    try {
      final path = AppUrl.createRequestBuyCard.replaceFirst(
        "{id}",
        agencyId.toString(),
      );

      final response = await ApiDioHelper().post(
        path: path,
        request: payload.toJson(),
      );

      return TransactionModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) return null;
      } else {
        return null;
      }
    }

    return null;
  }

  @override
  Future<BaseResultResponse?> confirmPayment({
    required int transactionId,
  }) async {
    try {
      final path = AppUrl.confirmPayment.replaceFirst(
        "{transactionId}",
        transactionId.toString(),
      );

      final response = await ApiDioHelper().post(path: path);

      return BaseResultResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) return null;
      } else {
        return null;
      }
    }

    return null;
  }

  @override
  Future<BaseResultResponse?> cancelTransaction({
    required int transactionId,
  }) async {
    try {
      final path = AppUrl.cancelTransaction.replaceFirst(
        "{transactionId}",
        transactionId.toString(),
      );

      final response = await ApiDioHelper().post(path: path);

      return BaseResultResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) return null;
      } else {
        return null;
      }
    }
    return null;
  }

  @override
  Future<CardRankResponse?> fetchNextCardRank({
    required int packId,
    required int amount,
  }) async {
    try {
      final queryParameters = {
        'packId': packId,
        'amount': amount,
      };

      final response = await ApiDioHelper().get(
        AppUrl.fetchNextCardRank,
        request: queryParameters,
      );

      return CardRankResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) return null;
      } else {
        return null;
      }
    }

    return null;
  }

  ///CARD INFO
  @override
  Future<UserCardModel?> fetchUserCardInfo() async {
    try {
      final response = await ApiDioHelper().get(AppUrl.fetchUserCardInfo);
      return UserCardModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) return null;
      } else {
        return null;
      }
    }
    return null;
  }

  @override
  Future<CardRanksResponse?> fetchCardRanks() async {
    try {
      final response = await ApiDioHelper().get(AppUrl.fetchCardRanks);
      return CardRanksResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) return null;
      } else {
        return null;
      }
    }
    return null;
  }
}
