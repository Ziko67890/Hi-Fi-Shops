import 'package:flutter/material.dart';
import 'package:flutter666_tutorial/controller.dart';
import 'package:flutter666_tutorial/the_shopping.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key, required this.tag
  });
  final String tag;
  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  void initState() {
    // Controller().getAProduct(id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffF5F5F5)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xffF5F5F5),
            ),
            child: Hero(
                tag: widget.tag,
                transitionOnUserGestures: true,
                flightShuttleBuilder: (context, anim1, direction, context2, context3){
                  if(direction == HeroFlightDirection.push ){
                    return RotationTransition(
                        child: context2.widget,
                        turns: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: anim1, curve: Curves.easeIn)));
                  }
                  return context3.widget;
                },
                child: Image.asset('asset/headphone.png')),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.shopping_cart_checkout_outlined,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Shopping',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'AKG N7OONCM2',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.link, color: Colors.blue),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  'Hi-Fi Shop & Service Rustaveli Ave 57.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'This shop offers both products and services',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 12,
                      width: 12,
                      color: Colors.white,
                      child: Icon(Icons.location_pin, color: Colors.blue),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rustaveli Ave 57,',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '17-001, Batumi',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  '#199.00',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text('Tax Rate 2%-#4.00 (~#195.00)'),
                SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoppingScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      'ADD TO CART',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
