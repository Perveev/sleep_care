import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaskInputFormatter implements TextInputFormatter {
  static const _defaultDigitMaskSymbol = '#';
  static const _defaultNonDigitMaskSymbol = 'A';

  static final _digitsRegExp = RegExp(r'[0-9]');
  static final _notDigitsRegExp = RegExp(r'[^0-9]');

  String mask;
  Map<String, RegExp>? filters;

  late List<String> _maskSymbols;
  late int _maskLength;

  late String _resultMaskedText;
  final _resultSymbolArray = _TextMatcher();

  MaskInputFormatter({required this.mask, this.filters}) {
    filters ??= {
      _defaultDigitMaskSymbol: _digitsRegExp,
      _defaultNonDigitMaskSymbol: _notDigitsRegExp,
    };
    _maskSymbols = filters!.keys.toList(growable: false);

    _maskLength = 0;
    for (var i = 0; i < mask.length; i++) {
      if (_maskSymbols.contains(mask[i])) {
        _maskLength++;
      }
    }
    _resultMaskedText = '';
  }

  String get maskedText => _resultMaskedText;

  String get unmaskedText => _resultSymbolArray.toString();

  bool get isFilled => _resultSymbolArray.length == _maskLength;

  String maskText(String text) => _formatInitialText(text).maskedText;

  String unmaskText(String text) => _formatInitialText(text).unmaskedText;

  MaskInputFormatter _formatInitialText(String text) {
    return MaskInputFormatter(mask: mask, filters: filters)
      ..formatEditUpdate(
        const TextEditingValue(),
        TextEditingValue(text: text),
      );
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (mask.isEmpty) {
      _resultMaskedText = newValue.text;
      _resultSymbolArray.set(newValue.text);
      return newValue;
    } else if (newValue.text.length > mask.length) {
      return oldValue;
    } else {
      return _format(oldValue, newValue);
    }
  }

  TextEditingValue _format(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final oldText = oldValue.text;
    final newText = newValue.text;

    final oldSelection = oldValue.selection;
    final newSelection = newValue.selection;

    final oldSelectionStart = newSelection.isValid
        ? oldSelection.isValid
            ? oldSelection.start
            : 0
        : 0;
    final oldSelectionLength = newSelection.isValid
        ? oldSelection.isValid
            ? oldSelection.end - oldSelection.start
            : 0
        : oldValue.text.length;

    final lengthDifference =
        newText.length - (oldText.length - oldSelectionLength);
    final lengthRemoved = lengthDifference < 0 ? lengthDifference.abs() : 0;
    final lengthAdded = lengthDifference > 0 ? lengthDifference : 0;

    final newChangeStart = max(0, oldSelectionStart - lengthRemoved);
    final newChangeEnd = max(0, newChangeStart + lengthAdded);

    final oldReplaceStart = max(0, oldSelectionStart - lengthRemoved);
    final oldReplaceLength = oldSelectionLength + lengthRemoved;

    final oldResultTextLength = _resultSymbolArray.length;

    var currentResultTextLength = _resultSymbolArray.length;
    var currentResultSelectionStart = 0;
    var currentResultSelectionLength = 0;

    for (var i = 0;
        i < min(oldReplaceStart + oldReplaceLength, mask.length);
        i++) {
      if (_maskSymbols.contains(mask[i]) && currentResultTextLength > 0) {
        currentResultTextLength -= 1;
        if (i < oldReplaceStart) {
          currentResultSelectionStart += 1;
        }
        if (i >= oldReplaceStart) {
          currentResultSelectionLength += 1;
        }
      }
    }

    final replacementText = newText.substring(newChangeStart, newChangeEnd);
    var targetCursorPosition = currentResultSelectionStart;
    if (replacementText.isEmpty) {
      _resultSymbolArray.removeRange(currentResultSelectionStart,
          currentResultSelectionStart + currentResultSelectionLength);
    } else {
      if (currentResultSelectionLength > 0) {
        _resultSymbolArray.removeRange(currentResultSelectionStart,
            currentResultSelectionStart + currentResultSelectionLength);
      }
      _resultSymbolArray.insert(currentResultSelectionStart, replacementText);
      targetCursorPosition += replacementText.length;
    }

    if (oldResultTextLength == 0 && _resultSymbolArray.length > 1) {
      for (var i = 0; i < mask.length; i++) {
        if (_maskSymbols.contains(mask[i])) {
          final resultPrefix = _resultSymbolArray._symbolArray.take(i).toList();
          for (var j = 0; j < resultPrefix.length; j++) {
            if (_resultSymbolArray.length <= j ||
                (mask[j] != resultPrefix[j] ||
                    (mask[j] == resultPrefix[j] &&
                        j == resultPrefix.length - 1))) {
              _resultSymbolArray.removeRange(0, j);
              break;
            }
          }
          break;
        }
      }
    }

    _resultMaskedText = '';
    var currentTextPosition = 0;
    var maskPosition = 0;
    var cursorPosition = -1;
    var nonMaskedCount = 0;

    while (maskPosition < mask.length) {
      final currentMaskChar = mask[maskPosition];
      final isMaskChar = _maskSymbols.contains(currentMaskChar);

      var currentTextInRange = currentTextPosition < _resultSymbolArray.length;

      String? currentTextChar;
      if (isMaskChar && currentTextInRange) {
        while (currentTextChar == null && currentTextInRange) {
          final potentialTextChar = _resultSymbolArray[currentTextPosition];
          if (filters?[currentMaskChar]?.hasMatch(potentialTextChar) == true) {
            currentTextChar = potentialTextChar;
          } else {
            _resultSymbolArray.removeAt(currentTextPosition);
            currentTextInRange =
                currentTextPosition < _resultSymbolArray.length;
            if (currentTextPosition <= targetCursorPosition) {
              targetCursorPosition -= 1;
            }
          }
        }
      }

      if (isMaskChar && currentTextInRange && currentTextChar != null) {
        _resultMaskedText += currentTextChar;
        if (currentTextPosition == targetCursorPosition &&
            cursorPosition == -1) {
          cursorPosition = maskPosition - nonMaskedCount;
        }
        nonMaskedCount = 0;
        currentTextPosition += 1;
      } else {
        if (currentTextPosition == targetCursorPosition &&
            cursorPosition == -1 &&
            !currentTextInRange) {
          cursorPosition = maskPosition;
        }
        if (!currentTextInRange) {
          break;
        } else {
          _resultMaskedText += mask[maskPosition];
        }
        nonMaskedCount++;
      }
      maskPosition += 1;
    }

    if (nonMaskedCount > 0) {
      _resultMaskedText = _resultMaskedText.substring(
        0,
        _resultMaskedText.length - nonMaskedCount,
      );
      cursorPosition -= nonMaskedCount;
    }

    if (_resultSymbolArray.length > _maskLength) {
      _resultSymbolArray.removeRange(_maskLength, _resultSymbolArray.length);
    }

    final finalCursorPosition =
        cursorPosition < 0 ? _resultMaskedText.length : cursorPosition;

    return TextEditingValue(
      text: _resultMaskedText,
      selection: TextSelection(
        baseOffset: finalCursorPosition,
        extentOffset: finalCursorPosition,
        affinity: newValue.selection.affinity,
        isDirectional: newValue.selection.isDirectional,
      ),
    );
  }
}

class _TextMatcher {
  final List<String> _symbolArray = <String>[];

  int get length => _symbolArray.fold(0, (prev, match) => prev + match.length);

  bool get isEmpty => _symbolArray.isEmpty;

  String operator [](int index) => _symbolArray[index];

  void insert(int start, String substring) {
    for (var i = 0; i < substring.length; i++) {
      _symbolArray.insert(start + i, substring[i]);
    }
  }

  void set(String text) {
    _symbolArray.clear();
    for (var i = 0; i < text.length; i++) {
      _symbolArray.add(text[i]);
    }
  }

  void removeRange(int start, int end) => _symbolArray.removeRange(start, end);

  void removeAt(int index) => _symbolArray.removeAt(index);

  void clear() => _symbolArray.clear();

  @override
  String toString() => _symbolArray.join();
}
