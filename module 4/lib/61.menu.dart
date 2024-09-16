import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:module_4/61.Cart.dart';
import 'package:module_4/61.items.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List hotelName = ["Kinza", "Maman", "Tanuki", "Gastrol", "TGT"];
  List itemName = [
    "All ",
    "Salad",
    "Pizza",
    "Asian",
    "Burger",
    "Dessert",
  ];
  int rating = 0;
  var total = 0;
  List<int> price = [100, 120, 120, 180, 150, 100, 120];

  int selectedHotelIndex = 0;
  int selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Menu',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          Icon(Icons.search_rounded),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.filter_alt)
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [_hotellist(), _listname(), _dishes()],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showOrderSummary(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  _dishes() {
    return GridView.builder(
      itemCount: Menu.length,
      padding: EdgeInsets.only(top: 10),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.65,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        final dish = Menu;
        //  final rat = rating;
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image section with rounded corners
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      dish[index].image, // Replace with your asset path
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                // Title of the item
                Row(
                  children: [
                    Text(dish[index].name,
                        maxLines: 2,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    SizedBox(width: 10),
                    Spacer(),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        '${dish[index].rate}',
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 4),
                // Star rating and review count
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 14),
                    Icon(Icons.star, color: Colors.yellow, size: 14),
                    Icon(Icons.star, color: Colors.yellow, size: 14),
                    Icon(Icons.star, color: Colors.yellow, size: 14),
                    Icon(Icons.star, color: Colors.grey, size: 14),
                    SizedBox(width: 4),
                  ],
                ),
                SizedBox(height: 8),
                // Price and add button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹${dish[index].price}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    // Add button
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: GestureDetector(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: "${Menu[index].name} add",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          if (itemlist.categoryList.isEmpty) {
                            itemlist.finalTotal = 0;
                          }
                          itemlist.categoryList.add(Menu[index]);

                          total = itemlist.finalTotal;
                          total = Menu[index].price + total;
                          print("final total : $index :$total");
                          itemlist.finalTotal = total;

                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _listname() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: itemName.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            splashColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Center(
                child: Text(
                  itemName[index],
                  style:
                      TextStyle(fontSize: 15, backgroundColor: Colors.black12),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _hotellist() {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
          itemCount: hotelName.length,
          // padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                selectedHotelIndex = index;
                setState(() {});
              },
              splashColor: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: selectedHotelIndex == index
                        ? Colors.orangeAccent
                        : Colors.black12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: Center(
                  child: Text(
                    hotelName[index],
                    style: TextStyle(
                        fontSize: selectedHotelIndex == index ? 18 : 16,
                        fontWeight: selectedHotelIndex == index
                            ? FontWeight.bold
                            : FontWeight.w500),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Future _showOrderSummary(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          maxChildSize: 0.5,
          minChildSize: 0.2,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Order',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.grey),
                        onPressed: () {
                          setState(() {
                            itemlist.categoryList = [];
                            itemlist.finalTotal = 0;
                          });
                          // Add delete functionality if needed
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Order Items
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: itemlist.categoryList.length,
                      itemBuilder: (context, index) {
                        final item = itemlist.categoryList[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    itemlist.categoryList[index].name,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    itemlist.categoryList[index].category,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ),
                              Text(
                                '\₹ ${itemlist.categoryList[index].price.toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  // Total and Add to Cart Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\₹${itemlist.finalTotal.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {
                        // Add your cart functionality here
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Cartpage())); // Close the bottom sheet
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
