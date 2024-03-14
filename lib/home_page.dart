import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:polaroid_carousel/polaroid_carousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      custom_card(
        imageUrl:
            "https://images.pexels.com/photos/20065715/pexels-photo-20065715/free-photo-of-the-dune-and-sea.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
      ),
      custom_card(
        imageUrl:
            "https://images.pexels.com/photos/17893690/pexels-photo-17893690/free-photo-of-carrot-flower-on-a-field.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
      ),
      custom_card(
        imageUrl:
            "https://images.pexels.com/photos/17285986/pexels-photo-17285986/free-photo-of-a-red-brick-building-with-a-sign-that-says-the-cafe.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
      ),
      custom_card(
        imageUrl:
            "https://images.pexels.com/photos/20160457/pexels-photo-20160457/free-photo-of-three-people-riding-horses-on-a-bridge-at-sunset.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
      ),
      custom_card(
        imageUrl:
            "https://images.pexels.com/photos/20442701/pexels-photo-20442701/free-photo-of-selective-focus-photo-of-autumnal-leaves.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
      ),
      custom_card(
        imageUrl:
            "https://images.pexels.com/photos/20398872/pexels-photo-20398872/free-photo-of-sunset-embrace-the-canyon-s-glow.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
      ),
      custom_card(
        imageUrl:
            "https://images.pexels.com/photos/20304179/pexels-photo-20304179/free-photo-of-a-woman-in-a-red-shirt-is-in-a-field-of-yellow-flowers.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
      ),
      custom_card(
        imageUrl:
            "https://images.pexels.com/photos/13429385/pexels-photo-13429385.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Carousel Animation"),
      ),
      extendBodyBehindAppBar: true, // Extend body behind app bar
      backgroundColor:
          Colors.transparent, // Set scaffold background to transparent

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.blue.shade600,
              Colors.green.shade300,
              Colors.black
            ], // Change colors as per your requirement
          ),
        ),
        child: Center(
          child: PolaroidCarousel(
            translateFactor: 360,

            duration: const Duration(milliseconds: 800),
            rotate: const Rotate(x: 0.001, y: 0.02, z: 0.001),
            curve: Curves.easeInOut,
            order: Order.frontToBack,
            children: list,
            // translate: Translate.top,
          ),
        ),
      ),
    );
  }
}

class custom_card extends StatelessWidget {
  String imageUrl;
  custom_card({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 200,
        width: 300,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          errorWidget: (context, url, error) {
            return const Icon(Icons.error);
          },
          progressIndicatorBuilder: (context, url, progress) {
            return FadeShimmer(
              baseColor: Colors.grey.shade100,
              highlightColor: Colors.black38,
              width: 200,
              height: 300,
            );
          },
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}
