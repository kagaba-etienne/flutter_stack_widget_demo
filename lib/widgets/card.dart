import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class CreditCard extends StatefulWidget {
  final String colorName;
  final double cardAmount;
  const CreditCard({
    super.key,
    required this.colorName,
    required this.cardAmount,
  });

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  final Map<String, Color> colorMap = const {
    "red": Color(0xFFA6070C),
    "green": Color(0xFF007140),
    "orange": Color(0xFFE84F1D),
    "yellow": Color(0xFFFAAF18),
  };

  final Map<String, String> imageMap = const {
    "yellow": "assets/EZZE Design Image.png",
    "orange": "assets/EZZE Design Image-1.png",
    "red": "assets/EZZE Design Image-2.png",
    "green": "assets/EZZE Design Image-3.png",
  };

  final creditCardIcons = const [
    FontAwesomeIcons.ccAmazonPay,
    FontAwesomeIcons.ccApplePay,
    FontAwesomeIcons.ccMastercard,
    FontAwesomeIcons.ccVisa,
    FontAwesomeIcons.ccDiscover,
    FontAwesomeIcons.ccPaypal,
    FontAwesomeIcons.ccStripe,
  ];

  int randomIcon = Random().nextInt(7);

  @override
  Widget build(BuildContext context) {
    Color selectedColor = colorMap[widget.colorName] ?? Color(0xFFA6070C);
    String selectedImagePath = imageMap[widget.colorName] ?? "red";

    return Stack(
      children: [
        Container(
          width: 350,
          height: 210,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(selectedImagePath),
              fit: BoxFit.cover,
            ),
            color: selectedColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: FaIcon(
            creditCardIcons[randomIcon],
            color: Colors.white,
            size: 50,
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Text(
            "**** **** **** 1234",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Text(
            "\$${widget.cardAmount.toStringAsFixed(2)}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
