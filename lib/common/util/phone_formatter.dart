class PhoneFormatter {
  PhoneFormatter._();

  static const _phoneMask = '**** ** *** ** **';
  static const _maskSymbol = '*';

  static const phonePrefix = '+380 ';

  static const codes = <String>[
    '39',
    '50',
    '63',
    '66',
    '67',
    '68',
    '73',
    '89',
    '91',
    '92',
    '93',
    '94',
    '95',
    '96',
    '97',
    '98',
    '99',
  ];

  static String addPhonePrefix(String phone) => '$phonePrefix$phone';

  static String simplifyPhone(String phone) =>
      '${phonePrefix.trim()}${phone.replaceAll(' ', '')}';

  static String formatPhone(String phone) {
    final symbols = phone.split('');
    final result = <String>[];
    for (var i = 0, index = 0; i < _phoneMask.length; i++) {
      if (index >= symbols.length) break;
      final symbol = symbols[index];
      if (_phoneMask[i] == _maskSymbol) {
        result.add(symbol);
        index++;
      } else {
        result.add(_phoneMask[i]);
      }
    }
    return result.join();
  }

  static bool isOperatorValid(String phone) {
    if (phone.length > 3) {
      return codes.contains(phone.substring(0, 2));
    } else {
      return false;
    }
  }
}
