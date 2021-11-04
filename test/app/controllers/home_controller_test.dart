import 'package:conversor/app/controllers/home_controller.dart';
import 'package:conversor/app/models/currency_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final TextEditingController from = TextEditingController();
  final TextEditingController to = TextEditingController();
  final HomeController homeController =
      HomeController(fromText: from, toText: to);

  test('Deve converter de real para dolar com vírgula', () {
    to.text = '2,0';
    homeController.convert();
    expect(from.text, '0.36');
  });
  test('Deve converter de real para dolar com ponto', () {
    to.text = '2.0';
    homeController.convert();
    expect(from.text, '0.36');
  });

  test('Deve converter de dolar para real', () {
    to.text = '1.0';

    homeController.toCurrency = CurrencyModel(
        name: 'Dolar', real: 5.65, dolar: 1, euro: .85, bitcoin: .000088);

    homeController.fromCurrency = CurrencyModel(
        name: 'Real', real: 1, dolar: .18, euro: .15, bitcoin: .000016);

    homeController.convert();

    expect(from.text, '5.65');
  });
}
