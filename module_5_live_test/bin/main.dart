void main() {
  List fruits = [
    {'Name': 'Apple', 'Color': 'Red', 'price': 2.5},
    {'Name': 'Banana', 'Color': 'Yellow', 'price': 1.0},
    {'Name': 'Grapes', 'Color': 'Purple', 'price': 3.0},
  ];
  print('Original Fruit Details before Discount:');
  displayFruitDetails(fruits);

  print('Fruit Details After Applying 10% Discount:');
  priceDiscount(fruits, 10);

  print("\nFruit Details After Applying 10% Discount:");
  displayFruitDetails(fruits);
}

void displayFruitDetails(List fruitsList) {
  for (var i = 0; i < fruitsList.length; i++) {
    var fruit1 = fruitsList[i];
    print(
        "Name: ${fruit1['Name']},Color: ${fruit1['Color']},Price: ${fruit1['price']}");
  }
}

void priceDiscount(List fruit2, double discount) {
  for (var i = 0; i < fruit2.length; i++) {
    fruit2[i]['price'] =
        fruit2[i]['price'] - (fruit2[i]['price'] * discount / 100);
  }
}
