import 'package:flutter/material.dart';
import '../../utility/extensions.dart';

class AddressAndPhone extends StatelessWidget {
  const AddressAndPhone({super.key, required this.item1, required this.item2});

  final AddressAndPhoneItem item1;
  final AddressAndPhoneItem item2;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade800,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          item1,
          IntrinsicHeight(
            child: Container(
              width: 2,
              height: 25,
              color: Colors.white,
            ),
          ),
          item2
        ],
      ),
    );
  }
}

class AddressAndPhoneItem extends StatelessWidget {
  const AddressAndPhoneItem(
      {super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        4.sizedBoxWidth(),
        Text(label,
            style: 12.regularStyle.copyWith(
                  color: Colors.white,
                ))
      ],
    );
  }
}
