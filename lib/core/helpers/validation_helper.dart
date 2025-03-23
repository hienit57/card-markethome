String vietnameseLetterPatten =
    r'^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯăâêôƠƯÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠƯăáàạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹỶỸ\s]+$';

RegExp phoneRegex = RegExp(r'^\d{10}$');
RegExp passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[0-9]).{8,}$');
RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
RegExp characterOnlyRegex = RegExp(vietnameseLetterPatten);

class ValidationHelper {
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Số điện thoại không hợp lệ';
    }

    // Cập nhật regex để kiểm tra độ dài và ký tự đầu tiên không phải là số 0
    final RegExp regex = RegExp(r'^[0-9]{9,10}$');

    if (value.length <= 9 && value.startsWith('0')) {
      return 'Số điện thoại không hợp lệ';
    }

    if (!regex.hasMatch(value)) {
      return 'Số điện thoại không hợp lệ';
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mật khẩu không hợp lệ';
    }
    if (!passwordRegex.hasMatch(value)) {
      return 'Mật khẩu không hợp lệ';
    }
    return null;
  }

  static String? match(String? value1, String value2) {
    if (value1 != value2) {
      return 'Mật khẩu không khớp';
    }
    return null;
  }

  static String? requiredValid(String? value, String label) {
    if (value == null || value.trim().isEmpty) {
      return 'Vui lòng nhập $label';
    }
    return null;
  }

  static String? requiredValidAndNotNum(String? value, String label) {
    if (value == null || value.trim().isEmpty) {
      return 'Vui lòng nhập $label';
    }
    if (value.contains('0') ||
        value.contains('1') ||
        value.contains('2') ||
        value.contains('3') ||
        value.contains('4') ||
        value.contains('5') ||
        value.contains('6') ||
        value.contains('7') ||
        value.contains('8') ||
        value.contains('9')) {
      return '$label không được nhập số';
    }
    final RegExp specialChars = RegExp(r'[!@#\$%^&*()?":{}|<>~,./]');
    if (specialChars.hasMatch(value) || _containsEmoji(value)) {
      return '$label không được chứa kí tự đặc biệt';
    }
    return null;
  }

  static String? specialCharactersAndEmpty(
    String? value,
    String label, {
    bool isCanEmpty = false,
  }) {
    if (!isCanEmpty) {
      if (value == null || value.trim().isEmpty) {
        return 'Vui lòng nhập $label';
      }
    }

    // Kiểm tra xem chuỗi có chứa ký tự đặc biệt không
    final RegExp specialChars = RegExp(r'[!@#\$%^&*()?":{}|<>~_;+]');
    if (specialChars.hasMatch(value ?? '') || _containsEmoji(value ?? '')) {
      return '$label không được chứa kí tự đặc biệt';
    }

    return null;
  }

  static bool _containsEmoji(String value) {
    // Biểu thức chính quy để kiểm tra emoji
    final regex = RegExp(
        r'[\u203C-\u3299]|[\uD83C-\uDBFF\uDC00-\uDFFF]|[\u20D0-\u20FF\uFE0F]');

    return regex.hasMatch(value);
  }

  static String? taxCode(String? value, String label) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Vui lòng nhập $label';
    }
    if (value.length > 13 || value.length < 10) {
      return 'Mã số thuế không hợp lệ';
    }

    // Kiểm tra xem chuỗi có chứa ký tự đặc biệt không
    final RegExp specialChars = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
    if (specialChars.hasMatch(value)) {
      return 'Mã số thuế không hợp lệ';
    }

    return null;
  }

  static String? validateId(String? value, String label, {bool? isAvailable}) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập $label';
    }
    if (value.length != 12 || isAvailable == false) {
      return 'Mã đại lý không hợp lệ';
    }

    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Vui lòng nhập email';
    }

    if (!emailRegex.hasMatch(value)) {
      return 'Email không hợp lệ';
    }

    final String domain = value.split('@').last;
    final String tld = domain.split('.').last.toLowerCase();

    final Set<String> validTlds = {
      'com',
      'org',
      'net',
      'edu',
      'gov',
      'vn',
      'co',
      'biz',
      'info',
      'me',
      'io',
      'uk',
      'de',
      'fr',
      'jp',
      'cn',
      'au',
      'ca',
      'us',
      'ru',
      'br',
      'in',
    };

    if (!validTlds.contains(tld)) {
      return 'Email không hợp lệ';
    }

    if (value.length > 255) {
      return 'Email không hợp lệ';
    }

    return null;
  }

  static String? Function(String? value) notMatchAny(
    List<String> values, {
    required String label,
  }) =>
      (String? value) {
        final newValues = values.where((element) => element.isNotEmpty);

        if (newValues.contains(value)) {
          return 'Tên không hợp lệ';
        }
        return null;
      };

  // Validation Fullname
  // Allow only letters and spaces
  // Not allow special characters and numbers
  static String? characterOnly(String? value, String label) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Vui lòng nhập $label';
    }
    if (value.length < 2) {
      return 'Tên không hợp lệ';
    }

    // Kiểm tra xem chuỗi có chứa ký tự đặc biệt và số không
    if (
        //!characterOnlyRegex.hasMatch(value) ||
        _containsEmoji(value)) {
      return '$label không được chứa kí tự đặc biệt và số';
    }

    return null;
  }

  static String? characterNotEmoji(String? value, String label) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Vui lòng nhập $label';
    }

    // Kiểm tra xem chuỗi có chứa ký tự đặc biệt và số không
    if (_containsEmoji(value)) {
      return '$label không được chứa kí tự đặc biệt';
    }

    return null;
  }
}
