import 'package:flutter/material.dart';
import 'package:myapp/Welcome/offers.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  TextEditingController _searchController = TextEditingController();
  bool _isFilterActive = false;
  List<String> _rupeesFilters = ['Under 100', '100-500', '500-1000', 'Above 1000'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildLogo() {
    return Image.asset(
      "assets/skechers.png",
      height: 60.0,
      width: 150,
    );
  }

  Widget _buildSearchField() {
    return Expanded(
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: Icon(Icons.search),
          suffixIcon: IconButton(
            onPressed: _toggleFilter,
            icon: Icon(Icons.filter_alt_rounded),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterText() {
    return Text(
      _isFilterActive ? 'Filter Active' : 'No Filters',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    );
  }

  Widget _buildFilterChips() {
    return SizedBox(
      height: 50.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _rupeesFilters.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                _rupeesFilters[index],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildImage() {
    return GestureDetector(
      onTap: () {
        // Navigate to a new screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Offers()),
        );
      },
      child: SizedBox(
        height: 200.0,
        child: Image.asset(
          "assets/snickers1.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void _toggleFilter() {
    setState(() {
      _isFilterActive = !_isFilterActive;
    });
  }

  Widget _buildShoeCard(String image, String name, String price, String color) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            color: Colors.grey[400],
            child: Card(
              child: Container(
                height: 150.0,
                width: 150.0,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.black54,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Price: $price',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  'Color: $color',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    _buildLogo(),
                    Expanded(child: SizedBox()),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    _buildSearchField(),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    _buildFilterText(),
                  ],
                ),
                const SizedBox(height: 20.0),
                if (_isFilterActive) _buildFilterChips(),
                const SizedBox(height: 20.0),
                _buildImage(),
                SizedBox(height: 20), // Add spacing between the image and the cards
                SizedBox(
                  height: 100,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(context).pushNamed("/nike"),
                              child: Image(image: AssetImage("assets/nike.png"), height: 60, width: 60),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).pushNamed("/welcome"),
                              child: Image(image: AssetImage("assets/puma.png"), height: 70, width: 100),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).pushNamed("/welcome"),
                              child: Image(image: AssetImage("assets/adidas.png"), height: 60, width: 60),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).pushNamed("/welcome"),
                              child: Image(image: AssetImage("assets/vans.png"), height: 60, width: 60),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("  Nike"),
                            Text("     Puma"),
                            Text(" Adidas"),
                            Text("  Vans"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20), // Add spacing between the rows
                SizedBox(
                  height: 130,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed("/welcome"),
                            child: Image(image: AssetImage("assets/fila.png"), height: 60, width: 60),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed("/welcome"),
                            child: Image(image: AssetImage("assets/underarmour.png"), height: 60, width: 60),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed("/welcome"),
                            child: Image(image: AssetImage("assets/redtape.png"), height: 60, width: 60),
                          ),
                          Icon(Icons.more_horiz_outlined),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("   Fila"),
                          Text("   Under Armour"),
                          Text("  Red Tape"),
                          Text("  See All"),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap:()=> Navigator.of(context).pushNamed("/mostpopular"),
                              child: Text(
                                "Most Popular",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            GestureDetector(
                              onTap: () => Navigator.of(context).pushNamed("/mostpopular"),
                              child: Text(
                                "SEE ALL",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Add spacing between the rows
               Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            color: Colors.grey[400],
            child: Card(
              child: Container(
                height: 150.0,
                width: 150.0,
                child: Image.asset(
                  "assets/puma.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.black54,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Puma",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Price: \$10",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  "Color: white",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
      Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            color: Colors.grey[400],
                            child: Card(
                              child: Container(
                                height: 150.0,
                                width: 150.0,
                                child: Image.asset(
                                "assets/shoes5.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.black54,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "jorden",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Price: \$19",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  "Color: Black",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20), // Add spacing between the rows
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            color: Colors.grey[400],
                            child: Card(
                              child: Container(
                                height: 150.0,
                                width: 150.0,
                                child: Image.asset(
                                  "assets/shoes4.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.black54,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Under Armour",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Price:\$13",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  "Color: black",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            color: Colors.grey[400],
                            child: Card(
                              child: Container(
                                height: 150.0,
                                width: 150.0,
                                child: Image.asset(
                                  "assets/snickers2.webp",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.black54,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "nike",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Price: \$15",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  "Color: green",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20), // Add spacing between the rows
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            color: Colors.grey[400],
                            child: Card(
                              child: Container(
                                height: 150.0,
                                width: 150.0,
                                child: Image.asset(
                                  "assets/shoes1.webp",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.black54,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Fila",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Price: \$16",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  "Color: white",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            color: Colors.grey[400],
                            child: Card(
                              child: Container(
                                height: 150.0,
                                width: 150.0,
                                child: Image.asset(
                                  "assets/shoes2.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.black54,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Adidas",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Price: \$09",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  "Color: blue",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20), // Add spacing between the rows
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            color: Colors.grey[400],
                            child: Card(
                              child: Container(
                                height: 150.0,
                                width: 150.0,
                                child: Image.asset(
                                  "assets/shoes3.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.black54,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Red Tape",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Price: \$17",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  "Color: orange",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            color: Colors.grey[400],
                            child: Card(
                              child: Container(
                                height: 150.0,
                                width: 150.0,
                                child: Image.asset(
                                  "assets/shoes4.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.black54,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Vens",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Price: \$11",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  "Color: Black",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
         bottomNavigationBar: BottomAppBar(
          height: 60,
  color: Colors.teal,
  shape: CircularNotchedRectangle(),
  notchMargin: 8.0,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.home),
        color: Colors.white,
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.shopping_bag_rounded),
        color: Colors.white,
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.shopping_cart),
        color: Colors.white,
      ),
      GestureDetector(
        onTap: () => Navigator.of(context).pushNamed("/profile"),
        child: Icon(Icons.person, color: Colors.white),
      ),
    ],
  ),
),
      ),
    );
  }
}