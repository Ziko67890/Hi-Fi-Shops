import 'package:flutter/material.dart';
import 'package:flutter666_tutorial/the_shop.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
               ProductWidget(title: "AKG N700NCM2", categories: "",image: "image1", price: "",),
                  ProductWidget(title: "AKG N700NCM2", categories: "",image: "image2", price: "",),
                ],
              ),
              SizedBox(height: 10),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShopScreen( tag: "",)),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShopScreen(tag: "",)),
                      );
                    },
                    child: Container(
                      height: 150,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Image.asset("asset/iphoneear.png"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: ListTile(
                      title: Text(
                        'AlAlAlA 3.5mm Jack 2m',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '. Available',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListTile(
                      title: Text(
                        'AlAlAlA 3.5mm Jack 1.5m',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '. Unavailable',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '#10,000.00',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "#7,000.00",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
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
class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key,  required this.title,  required this.image,  required this.categories, required this.price});
final String image, title, price, categories;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShopScreen(tag: image,)),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 155,
            width: 180,
            decoration: BoxDecoration(
              color: Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Hero(tag: image,
            flightShuttleBuilder: (context, anim1, direction, context2, context3){
if(direction == HeroFlightDirection.push ){
  return RotationTransition(

      turns: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: anim1, curve: Curves.easeIn)),

     child: context2.widget,);
}else {
  return FadeTransition(
    child: context3.widget,
    opacity:  Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: anim1, curve: Curves.easeIn)),
  );
}

            },
            transitionOnUserGestures: true,
            child: Image.asset("asset/headphone.png")),
          ), SizedBox(height: 10),
          Text(
            'AKG N7OONCM2 Wireless \nHeadphones',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '#25,000.00',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
