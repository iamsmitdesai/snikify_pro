import 'package:flutter/material.dart';

class MostPopular extends StatefulWidget {
  const MostPopular({Key? key}) : super(key: key);

  @override
  State<MostPopular> createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular> {
  String selectedBrand = "All";
  String searchQuery = '';

  void setSelectedBrand(String brand) {
    setState(() {
      selectedBrand = brand;
    });
  }

  void setSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/welcome");
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    "Most Popular",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Expanded(child: SizedBox()),
                  IconButton(
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(setSearchQuery),
                      );
                    },
                    icon: Icon(Icons.search),
                  ),
                ],
              ),
              SizedBox(height: 15),

              // Brand Filters
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    buildBrandContainer("All"),
                    SizedBox(width: 10),
                    buildBrandContainer("nike"),
                    SizedBox(width: 10),
                    buildBrandContainer("Puma"),
                    SizedBox(width: 10),
                    buildBrandContainer("Adidas"),
                    SizedBox(width: 10),
                    buildBrandContainer("Vans"),
                    SizedBox(width: 10),
                    buildBrandContainer("Fila"),
                    SizedBox(width: 10),
                    buildBrandContainer("AR"),
                    SizedBox(width: 10),
                    buildBrandContainer("Red Tape"),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Shoe List
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buildShoesList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBrandContainer(String brand) {
    bool isSelected = selectedBrand == brand;

    return GestureDetector(
      onTap: () {
        setSelectedBrand(brand);
      },
      child: Container(
        height: 30,
        width: 80,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            brand,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }

  List<Widget> buildShoesList() {
    List<Widget> rows = [];

    List<ShoeData> shoesData = [
      ShoeData("Puma", "assets/puma.jpg", "\$10", "Men White & Blue\nColorblocked IDP Sneakers"),
      ShoeData("AR", "assets/shoes4.jpg", "\$13", "Men Black Solid Adivat\nRunning Shoes"),
      ShoeData("nike", "assets/snickers2.webp", "\$15", "Men Green & White\n Tracking Shoes"),
      ShoeData("Fila", "assets/shoes1.webp", "\$16", "Men White Shoes\n For Runners"),
      ShoeData("Adidas", "assets/shoes2.jpg", "\$09", "Blue&White Jorder\nShoes For Men"),
      ShoeData("Red Tape", "assets/shoes3.jpg", "\$17", "Green&White shoes\nFor Athletes"),
      ShoeData("Adidas", "assets/adi1.jpg", "\$11", "Black&White shoes"),
      ShoeData("Adidas", "assets/adi2.jpg", "\$11", "Black&White shoes"),
      ShoeData("Adidas", "assets/adi3.jpg", "\$11", "Black&White shoes"),
      ShoeData("AR", "assets/ar.jpg", "\$11", "Black&White shoes"),
      ShoeData("AR", "assets/ar1.jpg", "\$11", "Black&White shoes"),
      ShoeData("AR", "assets/ar2.jpg", "\$11", "Black&White shoes"),
      ShoeData("Fila", "assets/fila2.jpg", "\$11", "Black&White shoes"),
      ShoeData("Fila", "assets/fila3.jpg", "\$11", "Black&White shoes"),
      ShoeData("Fila", "assets/fila4.jpg", "\$11", "Black&White shoes"),
      ShoeData("nike", "assets/Nike1.jpg", "\$11", "Black&White shoes"),
      ShoeData("nike", "assets/nike2.jpg", "\$11", "Black&White shoes"),
      ShoeData("nike", "assets/nike3.jpg", "\$11", "Black&White shoes"),
      ShoeData("Puma", "assets/puma1.jpg", "\$11", "Black&White shoes"),
      ShoeData("Puma", "assets/puma2.jpg", "\$11", "Black&White shoes"),
      ShoeData("Puma", "assets/puma3.jpg", "\$11", "Black&White shoes"),
      ShoeData("Red Tape", "assets/red.jpg", "\$11", "Black&White shoes"),
      ShoeData("Red Tape", "assets/red1.jpg", "\$11", "Black&White shoes"),
      ShoeData("Red Tape", "assets/red2.jpg", "\$11", "Black&White shoes"),
      ShoeData("Vans", "assets/vans1.jpg", "\$11", "Black&White shoes"),
      ShoeData("Vans", "assets/vans2.jpg", "\$11", "Black&White shoes"),
      ShoeData("Vans", "assets/vans3.webp", "\$11", "Black&White shoes"),
      ShoeData("Vans", "assets/vans4.jpg", "\$11", "Black&White shoes"),
    ];

    for (ShoeData shoe in shoesData) {
      if (shouldIncludeShoe(shoe)) {
        rows.add(buildShoesRow(shoe));
      }
    }

    return rows;
  }

  bool shouldIncludeShoe(ShoeData shoe) {
    if (selectedBrand != "All" && shoe.brand != selectedBrand) {
      return false;
    }

    if (searchQuery.isNotEmpty &&
        !shoe.brand.toLowerCase().contains(searchQuery.toLowerCase())) {
      return false;
    }

    if (searchQuery.isNotEmpty &&
        shoe.brand.toLowerCase() != searchQuery.toLowerCase()) {
      return false;
    }

    return true;
  }

  Widget buildShoesRow(ShoeData shoe) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 10),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(shoe.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shoe.brand,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  shoe.price,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  shoe.color,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final Function setSearchQuery;

  CustomSearchDelegate(this.setSearchQuery);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          setSearchQuery('');
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> searchResults = getSearchResults(query);

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        String result = searchResults[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            close(context, result);
            setSearchQuery(result);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> searchResults = getSearchResults(query);

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        String result = searchResults[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            close(context, result);
            setSearchQuery(result);
          },
        );
      },
    );
  }

  List<String> getSearchResults(String query) {
    List<String> items = [
      "nike",
      "Puma",
      "Adidas",
      "Vans",
      "Fila",
      "AR",
      "Red Tape",
    ];

    return items
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

class ShoeData {
  final String brand;
  final String image;
  final String price;
  final String color;

  ShoeData(this.brand, this.image, this.price, this.color);
}
