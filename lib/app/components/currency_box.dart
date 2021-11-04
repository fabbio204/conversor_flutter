import 'package:conversor/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final TextEditingController? controller;
  final List<CurrencyModel> items;
  final Function(CurrencyModel? model)? onChanged;
  final CurrencyModel? selectedItem;
  const CurrencyBox(
      {Key? key,
      required this.controller,
      required this.items,
      required this.onChanged,
      this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 10,
          child: SizedBox(
            height: 51,
            child: DropdownButton<CurrencyModel>(
              value: selectedItem,
              iconEnabledColor: Colors.amber,
              underline: Container(
                height: 1,
                color: Colors.amber,
              ),
              hint: const Text('Selecione'),
              items: items
                  .map((e) => DropdownMenuItem(
                        child: Text(e.name),
                        value: e,
                      ))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        Expanded(
          flex: 25,
          child: SizedBox(
            height: 42,
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                  hintText: 'Digite o valor',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber))),
            ),
          ),
        ),
      ],
    );
  }
}
