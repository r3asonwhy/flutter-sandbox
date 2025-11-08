import 'package:flutter/material.dart';
import 'package:myapp/components/cart_item.dart';
import 'package:myapp/models/cart.dart';
import 'package:myapp/models/shoe.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My cart',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),
            if (value.getCart().isEmpty)
              Container(
                width: 400,
                height: 400,
                color: Colors.transparent,
                child: Center(
                  child: ListTile(
                    title: Text(
                      'Cart is empty!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: value.getCart().length,
                  itemBuilder: (context, index) {
                    Shoe individualShoe = value.getCart()[index];
                    return CartItem(shoe: individualShoe);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
