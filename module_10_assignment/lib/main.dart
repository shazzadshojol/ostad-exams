import 'package:flutter/material.dart';

import 'cart_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CartPage(),
    );
  }
}

class CartPage extends StatefulWidget {
  CartPage({
    super.key,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalPrice = 0;

  var amountColor = TextStyle(color: Colors.black38);
  var priceColor = TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
  List<ShoppingCartProduct> cartProducts = [];

  void calculateTotalPrice() {
    setState(() {
      totalPrice = 0;
      for (var product in cartProducts) {
        totalPrice += product.price;
      }
    });
  }

  void addToCart(ShoppingCartProduct product) {
    setState(() {
      cartProducts.add(product);
    });

    calculateTotalPrice(); // Move this outside setState

    // Check if the user has selected 5 products
    if (cartProducts.length == 5) {
      String uniqueTitle = cartProducts[0]
          .title; // Assuming the titles are the same, change this logic if needed
      showAlertDialog(uniqueTitle);
    }
  }
  // void addToCart(ShoppingCartProduct product) {
  //   setState(() {
  //     cartProducts.add(product);
  //     uniqueProductTitles.add(product.title);
  //   });

  //   calculateTotalPrice(); // Move this outside setState

  //   // Check if the user has selected 5 products
  //   if (uniqueProductTitles.length == 5) {
  //     showAlertDialog(
  //         'You have selected 5 products with the title: ${product.title}');
  //   }
  // }

  Set<String> uniqueProductTitles = Set<String>();

  Future<void> showAlertDialog(String productTitle) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            title: Text('Congratulations!'),
            content:
                Text('You have selected\n 5 \n$productTitle(s) in your bag.'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(right: 15.0, top: 5),
                child: Icon(
                  Icons.search,
                  size: 40,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'My Bag',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Column(
                children: [
                  Products(
                    productImage: 'assets/photo-1.jpg',
                    titleText: 'Pullover',
                    colorName: 'Black',
                    sizeName: 'L',
                    priceAmount: 51,
                    addToCartCallback: addToCart,
                  ),
                  Products(
                    productImage: 'assets/photo-2.jpg',
                    titleText: 'T-Shirt',
                    colorName: 'Gray',
                    sizeName: 'L',
                    priceAmount: 30,
                    addToCartCallback: addToCart,
                  ),
                  Products(
                    productImage: 'assets/photo-3.jpg',
                    titleText: 'Sports Dress',
                    colorName: 'Black',
                    sizeName: 'M',
                    priceAmount: 43,
                    addToCartCallback: addToCart,
                  ),
                ],
              ),
              SizedBox(height: 100),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount',
                          style: amountColor,
                        ),
                        Text(
                          '\$${totalPrice.toString()}',
                          style: priceColor,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      height: 40,
                      width: 380,
                      child: ElevatedButton(
                          onPressed: () {
                            final snackBar = SnackBar(
                              content:
                                  Text('Congratulations! Checkout successful.'),
                              backgroundColor:
                                  Colors.green, // Customize color if needed
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                          child: Text('CHECK OUT')),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
