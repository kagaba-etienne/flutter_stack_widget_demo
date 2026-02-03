import 'package:flutter/material.dart';
import "package:stack_widget_demo/widgets/card.dart";

class StackedCards extends StatefulWidget {
  const StackedCards({super.key});

  @override
  State<StackedCards> createState() => _StackedCardsState();
}

class _StackedCardsState extends State<StackedCards> {
  final List<Map<String, dynamic>> cardsData = const [
    {"colorName": "yellow", "cardAmount": 40.00},
    {"colorName": "orange", "cardAmount": 67.60},
    {"colorName": "red", "cardAmount": 300.00},
    {"colorName": "green", "cardAmount": 90.00},
  ];

  double cardOffset = 20.0;

  void toggleOffset() {
    setState(() {
      cardOffset == 20.0 ? cardOffset = 60.0 : cardOffset = 20.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () => toggleOffset(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 350,
              height: 210 + cardOffset * (cardsData.length - 1),
              curve: Curves.easeInOutBack,
              child: Stack(
                children: cardsData
                    .asMap()
                    .entries
                    .map(
                      (card) => AnimatedPositioned(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOutBack,
                        top: card.key * cardOffset,
                        left: 0,
                        right: 0,
                        child: CreditCard(
                          colorName: card.value["colorName"],
                          cardAmount: card.value["cardAmount"],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
