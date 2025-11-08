import 'package:flutter/material.dart';
import 'package:myapp/components/shoe_tile.dart';
import 'package:myapp/models/cart.dart';
import 'package:myapp/models/shoe.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCard(Shoe shoe) {
    bool inCart = Provider.of<Cart>(context, listen: false).isItemInCart(shoe);
    if (inCart) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Item is already in cart!'),
          duration: const Duration(seconds: 1),
        ),
      );
      return;
    }

    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${shoe.name} is successfully added to cart.'),
        duration: const Duration(seconds: 1),
      ),
    );
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search',
                  style: TextStyle(color: Colors.deepPurpleAccent),
                ),
                Icon(Icons.search, color: Colors.deepPurpleAccent),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
              'Everyone flies.. some fly longer then others',
              style: TextStyle(color: Colors.deepPurpleAccent),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hot picks 🔥',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: value.getSales().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Shoe shoe = value.getSales()[index];
                return ShoeTile(shoe: shoe, onTap: () => addShoeToCard(shoe));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Divider(color: Colors.transparent),
          ),
        ],
      ),
    );
  }
}
