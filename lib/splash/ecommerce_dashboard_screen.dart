// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:happy/constanta/constants_images.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';

class EcommerceDasboardSreen extends StatefulWidget {
  const EcommerceDasboardSreen({super.key});

  @override
  State<EcommerceDasboardSreen> createState() => _EcommerceDasboardSreenState();
}

class _EcommerceDasboardSreenState extends State<EcommerceDasboardSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Ecommerce Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            shadowColor: Colors.redAccent,
            flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'Welcone Raghavendra',
                  style: TextStyle(color: Colors.white),
                  selectionColor: Colors.red,
                ),
                background: Image.asset(
                  AllImages().hotelImage,
                  fit: BoxFit.cover,
                )
                // Image.network(
                //   'https://randomuser.me/api/portraits/men/21.jpg',
                //   fit: BoxFit.cover,
                // ),
                ),
          ),
          newArrivalSellAll("NEW ARRIVALS", "SEE ALL"),
          SliverPadding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return newArrivalDetials(context, index);
                  },
                  childCount: 20,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1.0,
                    crossAxisCount: 2)),
          ),
          newArrivalSellAll("FEATURED", "SEE ALL"),
          buildSlider(),
          newArrivalSellAll("RECOMMENDED YOU", ""),
          buildRecommended(),
        ],
      ),
    );
  }

  newArrivalSellAll(String title, String button) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.deepOrange,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text(button,
                    style:
                        const TextStyle(color: Colors.white, fontSize: 20.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  newArrivalDetials(BuildContext context, int index) {
    return SizedBox(
      height: 200,
      child: GestureDetector(
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: 10,
                child: Image.asset('assets/room1.jpg'),
              ),
            ),
            const Text('Kushi Happy'),
            const Text('rs.1200'),
          ],
        ),
      ),
    );
  }

  buildSlider() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(bottom: 0.0),
        height: 200,
        child: Image.asset(
          'assets/room1.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  buildRecommended() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return newRecommendedDetials(context, index);
        },
        childCount: 20,
      ),
    );
  }

  newRecommendedDetials(BuildContext context, int index) {
    return SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
          child: Container(
            padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(160),
                    child: Image.network(
                      'https://randomuser.me/api/portraits/thumb/men/81.jpg',
                      fit: BoxFit.fill,
                      width: 60,
                      height: 60,
                    )),
                const SizedBox(
                  width: 12,
                ),
                // const Center(
                //   child:
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Venkata Raghavendra Mandala',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'rs.2000',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                //),
              ],
            ),
          ),
        ));
  }
}
