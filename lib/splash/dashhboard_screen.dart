// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';

class Hotel {
  String? imageUrl;
  String? title;
  String? description;
  int? price;
  double? rating;

  Hotel({this.description, this.imageUrl, this.price, this.rating, this.title});
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'https://randomuser.me/api/portraits/men/21.jpg',
    title: 'Ichha Hotel',
    description: 'A Four Start Hotel in Bara',
    price: 190,
    rating: 4.2,
  ),
  Hotel(
    imageUrl: 'https://randomuser.me/api/portraits/men/42.jpg',
    title: 'Hotel Merriot',
    description: 'A five star Hotelin Kathmandu',
    price: 150,
    rating: 3.5,
  ),
  Hotel(
    imageUrl: 'https://randomuser.me/api/portraits/men/8.jpg',
    title: 'Yak and Yati',
    description: 'A five Star hotel in Kathmandu',
    price: 280,
    rating: 4.8,
  ),
  Hotel(
    imageUrl: 'https://randomuser.me/api/portraits/men/91.jpg',
    title: 'Hotel Star',
    description: 'A Five star hotel in thamel',
    price: 300,
    rating: 5.0,
  )
];

class DashBoardScreen extends StatefulWidget {
  // static const String path = "lib/src/pages/hotel/hotelbooking.dart";
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('DashBoard'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Raghavendra',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Find Your Favourite Hotel',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://randomuser.me/api/portraits/thumb/men/81.jpg'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(0.0, 4),
                          blurRadius: 10.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFEFEDEE),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 10.0),
                      blurRadius: 10.0),
                ],
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(Icons.search, size: 30.0, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: const TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search For Hotel',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                            color: Colors.grey,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Popular Hotel',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
            ),
          ),
          const SizedBox(height: 20.0),
          popularHotels(),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Hotel Packages',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            children: [
              hotelPackages(),
            ],
          )
        ],
      ),
    );
  }

  popularHotels() {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: ListView.builder(
        // padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: hotels.length,
        itemBuilder: (BuildContext context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 240,
            width: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 0.4),
                    blurRadius: 10.0)
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 140.0,
                  width: 170.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(hotels[index].imageUrl ?? ""),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                  child: Text(hotels[index].title ?? ""),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                  child: Text(hotels[index].description ?? ""),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${hotels[index].price} / night',
                        style: const TextStyle(color: Colors.blue),
                      ),
                      Row(
                        children: [
                          Text('${hotels[index].rating}'),
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.blue,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  hotelPackages() {
    return SizedBox(
        height: 130,
        width: double.infinity,
        child: ListView.builder(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
          itemCount: hotels.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 0.4),
                        blurRadius: 10.0,
                      )
                    ]),
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        // padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        height: 150,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image:
                                    NetworkImage(hotels[index].imageUrl ?? ""),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Positioned(
                        top: 15.0,
                        right: 10.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(hotels[index].title ?? ""),
                            const SizedBox(height: 8),
                            Text(hotels[index].description ?? ""),
                            const SizedBox(height: 8),
                            Text('\$${hotels[index].price ?? 0}/ night',
                                style:
                                    const TextStyle(color: Colors.blueAccent)),
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.home,
                                    color: Colors.blueAccent,
                                  ),
                                  Icon(
                                    Icons.search,
                                    color: Colors.blueAccent,
                                  ),
                                  Icon(
                                    Icons.person,
                                    color: Colors.blueAccent,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                ));
            // const SizedBox(height: 16);
          },
        ));
  }
}
