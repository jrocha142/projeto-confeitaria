import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {

  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(

      currentIndex: currentIndex,
      onTap: onTap,

      type: BottomNavigationBarType.fixed,

      items: const [

        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long),
          label: 'Pedidos',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.cake),
          label: 'Produtos',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money),
          label: 'Finanças',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Performance',
        ),

      ],
    );
  }
}