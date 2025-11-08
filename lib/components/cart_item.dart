import 'package:flutter/material.dart';
import 'package:myapp/models/cart.dart';
import 'package:myapp/models/shoe.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset('lib/assets/${widget.shoe.imagePath}'),
        title: Text(
          widget.shoe.name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '\$${widget.shoe.price}',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        trailing: IconButton(
          onPressed: removeItemFromCart,
          icon: Icon(Icons.delete_forever, color: Colors.white),
          highlightColor: Colors.red,
        ),
      ),
    );
  }

  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.shoe.name} is removed from cart.'),
        duration: const Duration(seconds: 1),
      ),
    );
    return;
  }
}
