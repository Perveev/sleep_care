import 'package:flutter/services.dart';

class InputFormatterFactory {
  static const phoneMask = '+38 (###) ### ## ##';
  static const phoneCountryCode = '+38 ';

  static final _nameRegExp = RegExp('[а-яА-Яa-zA-Z-ієїґёІЄЇҐË’\']');
  static final _twoDigitsRegExp = RegExp(r'^([1-9][0-9]{0,1})$');
  static final onlyDigitsRegExp = RegExp(r'^[0-9]*$');

  static const _defaultMaxLength = 32;
  static const _emailMaxLength = 65;
  static const _maxTextLength = 256;
  static const _maxCertificateLength = 24;
  static const _twoDigitsLength = 2;

  static List<TextInputFormatter> email() {
    return [
      LengthLimitingTextInputFormatter(_emailMaxLength),
    ];
  }

  static List<TextInputFormatter> text() {
    return [
      LengthLimitingTextInputFormatter(_maxTextLength),
    ];
  }

  static List<TextInputFormatter> certificate() {
    return [
      LengthLimitingTextInputFormatter(_maxCertificateLength),
    ];
  }

  static List<TextInputFormatter> digits() {
    return [
      FilteringTextInputFormatter.digitsOnly,
    ];
  }

  static List<TextInputFormatter> twoDigits() {
    return [
      LengthLimitingTextInputFormatter(_twoDigitsLength),
      FilteringTextInputFormatter.allow(_twoDigitsRegExp),
    ];
  }

  static List<TextInputFormatter> name() {
    return [
      FilteringTextInputFormatter.allow(_nameRegExp),
      LengthLimitingTextInputFormatter(_defaultMaxLength),
    ];
  }
}
