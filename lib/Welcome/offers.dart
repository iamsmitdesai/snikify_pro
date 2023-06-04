import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  bool isLiked = false;
  Color selectedColor = Colors.red;

  Map<Color, String> colorToImagePath = {
    Colors.red: "assets/RedShoes.jpg",
    Colors.blue: "assets/BlueShoes.jpg",
    Colors.green: "assets/GreenShoes.jpg",
    Colors.white: "assets/WhiteShoes.jpg",
  };

  bool isAddedToCart = false;

  void addToCart() {
    // Add your cart functionality here
    setState(() {
      isAddedToCart = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed("/welcome"),
                      child: Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      "Nike",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                      child: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : null,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      colorToImagePath[selectedColor]!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Nike Air Max",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  "The Nike Air Max is a popular athletic shoe known for its sleek design and excellent cushioning. It features a black colorway that adds a touch of sophistication to your sporty look. The shoes are built with high-quality materials to ensure durability and comfort. With its iconic Air Max technology, it provides maximum impact absorption and support for your feet.",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 30.0),
                Center(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = Colors.red;
                          });
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            border: selectedColor == Colors.red
                                ? Border.all(
                              color: Colors.black,
                              width: 2.0,
                            )
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = Colors.blue;
                          });
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                            border: selectedColor == Colors.blue
                                ? Border.all(
                              color: Colors.black,
                              width: 2.0,
                            )
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = Colors.green;
                          });
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: selectedColor == Colors.green
                                ? Border.all(
                              color: Colors.black,
                              width: 2.0,
                            )
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = Colors.white;
                          });
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                            border: selectedColor == Colors.white
                                ? Border.all(
                              color: Colors.black,
                              width: 2.0,
                            )
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 120.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 160,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your action here
                        },
                        child: Text(
                          "Price : \$99",
                          style: TextStyle(fontSize: 16.0),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.teal,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 160,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          addToCart();
                        },
                        icon: Icon(Icons.shopping_cart),
                        label: Text(isAddedToCart ? "Added to Cart" : "Add to Cart"),
                        style: ElevatedButton.styleFrom(
                          primary: isAddedToCart ? Colors.grey : Colors.teal,
                          textStyle: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
