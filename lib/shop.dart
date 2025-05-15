import 'package:flutter/material.dart';
import 'package:flutter666_tutorial/models/allproduct_model.dart';
import 'package:flutter666_tutorial/the_shop.dart';

import 'controller.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
 WidgetsBinding.instance.addPostFrameCallback((t) async {
   allProductModel= await  Controller().getAllProduct();
   setState(() {

   });
 });
    super.initState();
  }
  AllProductModel? allProductModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
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
                Wrap(
            runSpacing: 20,
                  spacing: 5,
                  children: List.generate(allProductModel?.data?["data"].length??0, (index){
                    return  ProductWidget(title: allProductModel?.data?["data"][index]["title"] ?? "AKG N700NCM2", categories: "",image:  "https://cdn2.thecatapi.com/images/NZpO4pU56M.jpg", price: allProductModel?.data?["data"][index]["price"],);

                  })
                  // [
                  //   ProductWidget(title: allProductModel?.data?["data"][0]["title"] ?? "AKG N700NCM2", categories: "",image:  allProductModel?.data?["data"][0]["images"][0]??"", price: allProductModel?.data?["data"][0]["price"],),
                  //   ProductWidget(title:allProductModel?.data?["data"][1]["title"] ?? "AKG N700NCM2", categories: "",image:  allProductModel?.data?["data"][1]["thumbnail"]??'', price: allProductModel?.data?["data"][1]["price"],),
                  //   ProductWidget(title: allProductModel?.data?["data"][0]["title"] ?? "AKG N700NCM2", categories: "",image:  allProductModel?.data?["data"][0]["images"][0]??"", price: allProductModel?.data?["data"][0]["price"],),
                  //   ProductWidget(title:allProductModel?.data?["data"][1]["title"] ?? "AKG N700NCM2", categories: "",image:  allProductModel?.data?["data"][1]["thumbnail"]??'', price: allProductModel?.data?["data"][1]["price"],),
                  //   ProductWidget(title: allProductModel?.data?["data"][0]["title"] ?? "AKG N700NCM2", categories: "",image:  allProductModel?.data?["data"][0]["images"][0]??"", price: allProductModel?.data?["data"][0]["price"],),
                  //   ProductWidget(title:allProductModel?.data?["data"][1]["title"] ?? "AKG N700NCM2", categories: "",image:  allProductModel?.data?["data"][1]["thumbnail"]??'', price: allProductModel?.data?["data"][1]["price"],),
                  //
                  // ],
                ),
                SizedBox(height: 10),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       'Accessories',
                //       style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                //     ),
                //     Text(
                //       'Show all',
                //       style: TextStyle(
                //         fontSize: 20,
                //         fontWeight: FontWeight.w500,
                //         color: Colors.blue,
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 20),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key,  required this.title,  required this.image,  required this.categories, required this.price});
final String image, title, categories;
final int price;
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
            child: Image.network(image)),
          ), SizedBox(height: 10),
          Text(
          title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
           price.toString(),
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
