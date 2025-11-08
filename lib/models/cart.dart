import 'package:flutter/material.dart';
import 'package:myapp/models/shoe.dart';

class Cart extends ChangeNotifier {
  List<Shoe> sales = [
    Shoe(
      name: 'Air Zoom Rival',
      price: 189,
      description: 'Lightweight speed and firm grip for track or street runs.',
      imagePath: 'shoe-3.png',
    ),
    Shoe(
      name: 'Jordan Lift Off',
      price: 165,
      description: 'High-top comfort with a bold basketball-inspired design.',
      imagePath: 'shoe-1.png',
    ),
    Shoe(
      name: 'React Phantom',
      price: 145,
      description:
          'Slip-on running shoe with responsive React foam cushioning.',
      imagePath: 'shoe-2.png',
    ),
    Shoe(
      name: 'Air Max Motion',
      price: 130,
      description: 'Classic look meets modern air-cushioned comfort.',
      imagePath: 'shoe-1.png',
    ),
    Shoe(
      name: 'Zoom Fly 6',
      price: 199,
      description: 'Engineered for ultimate speed with lightweight precision.',
      imagePath: 'shoe-3.png',
    ),
    Shoe(
      name: 'Air Max Pulse',
      price: 210,
      description: 'Blends soft cushioning with street-ready durability.',
      imagePath: 'shoe-1.png',
    ),
    Shoe(
      name: 'LeBron 21',
      price: 260,
      description:
          'Premium performance built for power and agility on the court.',
      imagePath: 'shoe-2.png',
    ),
    Shoe(
      name: 'Kyrie Infinity',
      price: 185,
      description: 'Designed for quick cuts and smooth transitions.',
      imagePath: 'shoe-3.png',
    ),
    Shoe(
      name: 'Pegasus Trail 4',
      price: 175,
      description: 'Versatile comfort for both road and trail runs.',
      imagePath: 'shoe-1.png',
    ),
    Shoe(
      name: 'Metcon 9',
      price: 160,
      description: 'Stable and strong for the toughest training sessions.',
      imagePath: 'shoe-2.png',
    ),
    Shoe(
      name: 'Air Jordan 1 Retro',
      price: 240,
      description: 'An icon reborn with premium materials and heritage style.',
      imagePath: 'shoe-3.png',
    ),
    Shoe(
      name: 'React Infinity Run',
      price: 195,
      description: 'Soft yet responsive cushioning for long-distance comfort.',
      imagePath: 'shoe-1.png',
    ),
    Shoe(
      name: 'Blazer Mid 77',
      price: 150,
      description: 'Retro hoops style with a modern streetwear twist.',
      imagePath: 'shoe-2.png',
    ),
    Shoe(
      name: 'Phantom GX Elite',
      price: 270,
      description: 'Precision touch and control for the modern footballer.',
      imagePath: 'shoe-3.png',
    ),
    Shoe(
      name: 'Air Force 1 Low',
      price: 155,
      description: 'Classic everyday sneaker that never goes out of style.',
      imagePath: 'shoe-1.png',
    ),
  ];

  List<Shoe> userCart = [];

  List<Shoe> getSales() {
    return sales;
  }

  List<Shoe> getCart() {
    return userCart;
  }

  bool isItemInCart(Shoe shoe) {
    return userCart.any((product) => product.name == shoe.name);
  }

  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
