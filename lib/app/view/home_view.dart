import 'package:conversor/app/components/currency_box.dart';
import 'package:conversor/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController to = TextEditingController();

  final TextEditingController from = TextEditingController();

  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController(fromText: from, toText: to);
  }

  @override
  Widget build(BuildContext context) {
    const SizedBox divisorVertical = SizedBox(height: 10);

    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 150,
                    height: 150,
                  ),
                  CurrencyBox(
                    items: controller.currencies,
                    onChanged: (model) {
                      setState(() {
                        controller.toCurrency = model!;
                      });
                    },
                    controller: controller.toText,
                    selectedItem: controller.toCurrency,
                  ),
                  divisorVertical,
                  CurrencyBox(
                      items: controller.currencies,
                      onChanged: (model) {
                        setState(() {
                          controller.fromCurrency = model!;
                        });
                      },
                      controller: controller.fromText,
                      selectedItem: controller.fromCurrency),
                  divisorVertical,
                  ElevatedButton(
                    onPressed: () {
                      controller.convert();
                    },
                    child: const Text('CONVERTER'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.amber)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
