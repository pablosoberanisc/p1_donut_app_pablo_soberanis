import 'package:flutter/material.dart';
import '../utils/my_tab.dart';

import '../tab/donut_tab.dart';
import '../tab/burger_tab.dart';
import '../tab/pancake_tab.dart';
import '../tab/smoothie_tab.dart';
import '../tab/pizza_tab.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    const MyTab(iconPath: "lib/icons/donut.png", iconname: "Donuts"),
    const MyTab(iconPath: "lib/icons/burger.png", iconname: "Burger"),
    const MyTab(iconPath: "lib/icons/smoothie.png", iconname: "Smoothie"),
    const MyTab(iconPath: "lib/icons/pancakes.png", iconname: "Pancake"),
    const MyTab(iconPath: "lib/icons/pizza.png", iconname: "Pizza"),
  ];

  //state
  Map<String, int> cartItems = {};
  double totalAmount = 0;

  //add
  void addToCart(String itemName, double itemPrice) {
    setState(() {
      if (cartItems.containsKey(itemName)) {
        cartItems[itemName] = cartItems[itemName]! + 1;
      } else {
        cartItems[itemName] = 1;
      }
      totalAmount += itemPrice;
    });
  }

  //delete
  void removeFromCart(String itemName, double itemPrice) {
    setState(() {
      if (cartItems.containsKey(itemName)) {
        if (cartItems[itemName] == 1) {
          cartItems.remove(itemName);
        } else {
          cartItems[itemName] = cartItems[itemName]! - 1;
        }
        totalAmount -= itemPrice;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Icon(Icons.menu, color: Colors.grey[800]),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.person, color: Colors.grey),
            ),
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text("I want to ", style: TextStyle(fontSize: 24)),
                  Text(
                    "Eat",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: TabBar(
                tabs: myTabs,
                isScrollable: true,
                indicatorColor: Colors.pink,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(addToCart: addToCart, removeFromCart: removeFromCart),
                  BurgerTab(addToCart: addToCart, removeFromCart: removeFromCart),
                  SmoothieTab(addToCart: addToCart, removeFromCart: removeFromCart),
                  PanCakeTab(addToCart: addToCart, removeFromCart: removeFromCart),
                  PizzaTab(addToCart: addToCart, removeFromCart: removeFromCart),
                ],
              ),
            ),
            CartBar(
              itemCount: cartItems.values.fold(0, (a, b) => a + b),
              totalAmount: totalAmount,
              onViewCartPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}