import 'package:conversor/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  late List<CurrencyModel> currencies;
  late CurrencyModel fromCurrency;
  late CurrencyModel toCurrency;

  final TextEditingController toText;
  final TextEditingController fromText;

  HomeController({required this.toText, required this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String toTextString = toText.text;
    double toTextValue =
        double.tryParse(toTextString.replaceAll(',', '.')) ?? 1;
    double returnValue = 0;
    if (fromCurrency.name == 'Real') {
      returnValue = toTextValue * toCurrency.real!;
    } else if (fromCurrency.name == 'Dolar') {
      returnValue = toTextValue * toCurrency.dolar!;
    } else if (fromCurrency.name == 'Euro') {
      returnValue = toTextValue * toCurrency.euro!;
    } else if (fromCurrency.name == 'Bitcoin') {
      returnValue = toTextValue * toCurrency.bitcoin!;
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}
