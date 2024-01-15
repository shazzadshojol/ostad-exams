import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Products extends StatefulWidget {
  var productImage;
  var titleText;
  var colorName;
  var sizeName;
  var priceAmount;
  final Function(ShoppingCartProduct) addToCartCallback;

  Products({
    super.key,
    required this.productImage,
    required this.titleText,
    required this.colorName,
    required this.sizeName,
    required this.priceAmount,
    required this.addToCartCallback,
  });

  @override
  State<Products> createState() => _ProductsState();
}

class ShoppingCartProduct {
  final String title;
  int quantity;
  final double price;
  String size;
  final productImage;
  final color;

  ShoppingCartProduct({
    required this.title,
    required this.quantity,
    required this.price,
    this.productImage,
    required this.size,
    this.color,
  });
}

int price = 0;

class _ProductsState extends State<Products> {
  int quantity = 1;
  String titleText = '';
  var unitPrice = 0;

  @override
  void initState() {
    super.initState();

    unitPrice = widget.priceAmount;
  }

  double calculateUnitTotalPrice() {
    return quantity * unitPrice.toDouble();
  }

  void updatePrices() {
    setState(() {
      unitPrice = widget.priceAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth * 0.9;
    var titleStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    var colorText = TextStyle(color: Colors.black38);
    var colorText2 = TextStyle(color: Colors.black);
    var priceColor =
        TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10.0),
      height: 130,
      width: containerWidth,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              widget.productImage,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.titleText, style: titleStyle),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 5),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(text: 'Color : ', style: colorText),
                          TextSpan(text: widget.colorName, style: colorText2),
                        ]),
                      ),
                    ),
                    SizedBox(width: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 10),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(text: 'Size : ', style: colorText),
                          TextSpan(text: widget.sizeName, style: colorText2),
                        ]),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (quantity > 1) {
                                setState(() {
                                  quantity--;
                                  updatePrices();
                                });
                              }
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.remove,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(quantity.toString()),
                          ),
                          InkWell(
                            onTap: () {
                              // Decrease quantity
                              setState(() {
                                quantity++;
                                updatePrices();
                              });
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        '\$${calculateUnitTotalPrice()}'.toString(),
                        style: priceColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
