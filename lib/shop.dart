import 'package:flutter/material.dart';
import 'package:flutter666_tutorial/product.dart';
import 'package:flutter666_tutorial/the_controller.dart';
import 'package:flutter666_tutorial/the_shop.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    super.initState();
    getRandomproducts();
  }

  Future<void> getRandomproducts() async {
    setState(() {});

    Products = await Controller().getRandomproducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //  children: [Icon(Icons.arrow_back_ios), Icon(Icons.search)],
              // ),
              SizedBox(height: 25),
              Text(
                'Hi- Fi Shop & Service',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              Text(
                'Audio shop on Rustaveli Ave 57.',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 9),
              Text(
                'This shop offer both products and services',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 29), //products
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Products',
                    style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Show all',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  First_Products(
                    image: "asset/headphone.png",
                    title: "AKA N700NCMS \n Wireless headphone",
                    price: "S199.00",
                    subtitle: "Subtitle",
                  ),
                  First_Products(
                    image: "asset/headphone.png",
                    title: "AlAlAl TMA-2 Modular \n Headphones",
                    price: "S250.00",
                    subtitle: "Subtitle",
                  ),
                ],
              ),

              SizedBox(height: 29), //Accerioes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Accessories',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Show all',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Accessories(
                    image: "asset/iphoneear.png",
                    title: "AlAlAlA 3.5mm Jack 1.5m",
                    price: "S50.00",
                    subtitle: ". Available",
                  ),
                  Accessories(
                    image: "asset/earphone.png",
                    title: "AlAlAlA 3.5mm Jack 2m",
                    price: "S15.00",
                    subtitle: ". Unavailable",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class First_Products extends StatefulWidget {
  const First_Products({
    super.key,
    required this.image,

    required this.title,
    required this.price,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String price;
  final String subtitle;
  @override
  State<First_Products> createState() => First_ProductsState();
}

class First_ProductsState extends State<First_Products> { V

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShopScreen()),
            );
          },
          child: Container(
            height: 155,
            width: 180,
            decoration: BoxDecoration(
              color: Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Image.asset("asset/headphone.png"),
          ),
        ),
        SizedBox(height: 12),
        Text(
          widget.title,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),

        Text(
          widget.price,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class Accessories extends StatefulWidget {
  const Accessories({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String price;
  final String subtitle;

  @override
  State<Accessories> createState() => _AccessoriesState();
}

class _AccessoriesState extends State<Accessories> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShopScreen()),
            );
          },
          child: Container(
            height: 150,
            width: 180,
            decoration: BoxDecoration(
              color: Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Image.asset("asset/earphone.png"),
          ),
        ),
        SizedBox(height: 12),
        Text(
          widget.title,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        Text(
          widget.subtitle,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        Text(
          widget.price,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
