class MapperModel {
  static E getProperDataValue<E>(dynamic json) {
    try {
      switch (E) {
        case dynamic:
          return json as E;
        default:
          throw Exception('Chưa khai báo model Mapping');
      }
    } catch (e) {
      throw Exception('$e - Chưa khai báo model Mapping');
    }
  }
}