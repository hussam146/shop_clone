
// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class DeliveryTimeScreen extends StatefulWidget {
  const DeliveryTimeScreen({super.key});

  @override
  State<DeliveryTimeScreen> createState() => _DeliveryTimeScreenState();
}

class _DeliveryTimeScreenState extends State<DeliveryTimeScreen> {
  Choose choose = Choose.StandardDelivery;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioListTile(
          value: Choose.StandardDelivery,
          groupValue: choose,
          onChanged: (value)
          {
            setState(() {
              choose = value!;
            });
          },
          title: const Text(
            'Standard Delivery',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0
            ),
          ),
          subtitle: const Text(
            'Orders will be delivered between 3 - 5 business days',
            style: TextStyle(
                fontSize: 15.0
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        RadioListTile(
          value: Choose.NextDayDelivery,
          groupValue: choose,
          onChanged: (value)
          {
            setState(() {
              choose = value!;
            });
          },
          title: const Text(
            'Next Day Delivery',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0
            ),
          ),
          subtitle: const Text(
            'Place your order before 6pm and your items will be delivered the next day',
            style: TextStyle(
                fontSize: 15.0
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        RadioListTile(
          value: Choose.NominatedDelivery,
          groupValue: choose,
          onChanged: (value)
          {
            setState(() {
              choose = value!;
            });
          },
          title: const Text(
            'Nominated Delivery',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0
            ),
          ),
          subtitle: const Text(
            'Pick a particular date from the calendar and order will be delivered on selected date',
            style: TextStyle(
                fontSize: 15.0
            ),
          ),
        ),
      ],
    );
  }
}

enum Choose{
  StandardDelivery,
  NextDayDelivery,
  NominatedDelivery
}