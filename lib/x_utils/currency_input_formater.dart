import 'package:flutter/services.dart';
import 'utilities.dart';

/**
 * createdby Daewu Bintara
 * Tuesday, 20/10/20
 **/
class CurrencyInputFormatter extends TextInputFormatter {

  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String newText = Utilities().rupiahFormater(newValue.text);
    return newValue.copyWith(
        text: newText,
        selection: new TextSelection.collapsed(offset: newText.length));
  }
}