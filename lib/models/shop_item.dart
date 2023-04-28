class ShopItem {
  String itemName;
  int amount;

  ShopItem({required this.itemName, required this.amount});

  //create methodes as toMap and fromMap

  Map<String, dynamic> toMap() {
    return {
      'itemName': itemName,
      'amount': amount,
    };
  }

  factory ShopItem.fromMap(Map<String, dynamic> map) {
    return ShopItem(
      itemName: map['itemName'],
      amount: map['amount'],
    );
  }
}
