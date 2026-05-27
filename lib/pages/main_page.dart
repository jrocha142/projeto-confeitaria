import 'package:confeitaria/models/order.dart';
import 'package:confeitaria/models/product.dart';
import 'package:confeitaria/pages/finances_page.dart';
import 'package:confeitaria/pages/orders_page.dart';
import 'package:confeitaria/pages/performance_page.dart';
import 'package:confeitaria/pages/products_page.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_nav_bar.dart';

class MainPage extends StatefulWidget {

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;

  final List<Product> products = [
    Product(
      name: 'Bolo de Chocolate',
      price: 120,
      imagePath: 'assets/images/chocolate_cake.jpg',
      ingredients: [
        'Farinha',
        'Chocolate',
        'Leite',
        'Ovos',
      ],
    ),

    Product(
      name: 'Cupcake de Morango',
      price: 80,
      imagePath: 'assets/images/strawberry_cupcake.jpg',
      ingredients: [
        'Farinha',
        'Chocolate',
        'Manteiga',
      ],
    ),
  ];

  void addProduct(Product product) {

    setState(() {

      products.add(product);

    });
  }
  
  List<Order> orders = [
    Order(
      name: 'Bolo de Chocolate',
      price: 120,
      deliveryDate: '12/05/2026', 
      quantity: 1,
    ),

    Order(
      name: 'Cupcakes',
      price: 160,
      deliveryDate: '15/05/2026',
      quantity: 2
    ),

  ];

  double totalIncome = 0;
  
  List<Widget> get pages => [
    OrdersPage(
      orders: orders,
      onCompleteOrder: completeOrder,
      products: products,
    ),

    ProductsPage(products: products, onAddProduct: addProduct),

    FinancesPage(
      totalIncome: totalIncome,
    ),

    const PerformancePage(),
  ];

  void completeOrder(int index) {
    setState(() {
      totalIncome += orders[index].price;
      orders.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavBar(

        currentIndex: currentIndex,

        onTap: (index) {

          setState(() {
            currentIndex = index;
          });

        },
      ),
    );
  }
}