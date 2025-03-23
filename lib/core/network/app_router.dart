class AppUrl {
  AppUrl._();

  static const String endPointTest = 'character/?page=';

  static const String fetchGlobalConfigByKey = '/api/v1/setting/';
  static const String fetchUserProfile = '/api/v1/user/me';

  static const String fetchUserAddress = '/ecom/api/customers-address/me';
  static const String fetchCountries = '/ecom/api/countries';
  static const String fetchProvinces = '/ecom/api/provinces/{countryId}';
  static const String fetchDistricts = '/ecom/api/districts/{provinceId}';
  static const String fetchWards = '/ecom/api/wards/{districtId}';

  static const String fetchMarshop = '/api/v1/marshop/list';
  static const String fetchMarshopByUserId = '/api/v1/marshop/user';

  ///REGISTER CARD
  static const String fetchAgenciesSellingCard =
      '/api/v1/personal-d-one-agency/list';
  static const String createBillBuyCard =
      '/api/v1/personal-d-one-agency/voucher/user/{agencyId}/payment-info';
  static const String createRequestBuyCard =
      '/api/v1/personal-d-one-agency/voucher/user/{id}/buy';
  static const String confirmPayment =
      '/api/v1/personal-d-one-agency/voucher/user/{transactionId}/confirm-payment';
  static const String cancelTransaction =
      '/api/v1/personal-d-one-agency/voucher/user/{transactionId}/cancel-transaction';
  static const String fetchNextCardRank =
      '/api/v1/personal-d-one-agency/voucher/user/next-wallet-rank';

  ///CARD INFO
  static const String fetchUserCardInfo =
      '/api/v1/personal-d-one-agency/voucher/user/wallet';
  static const String fetchCardRanks =
      '/api/v1/personal-d-one-agency/voucher/user/wallet-rank/list';

  ///Card Packge
  static const String fetchCardPackages =
      '/api/v1/personal-d-one-agency/operator/{agencyId}/voucher-pack/list';
  static const String fetchCardPackageDetail =
      '/api/v1/personal-d-one-agency/operator/{agencyId}/voucher-pack/{packId}';

  ///Ricebook
  static const String fetchRiceBookPackages =
      '/ecom/api/v1/cert-markethome/product/list';
}
