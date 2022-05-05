import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/style.dart';

class HomeBanner extends StatefulWidget {
  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  final List<String> listBanner = [
    "https://i.pinimg.com/736x/db/ac/32/dbac32146104c67946de2a6d857a57c0.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU7adimEWjO8NMlVfBl4_Cez1BlKr2Z51gTTqK_Spicbw4eqnQl0ltiMOiwWfVi4o7I3k&usqp=CAU",
    "https://i.pinimg.com/736x/bf/06/3a/bf063a19d01d5fbdf38a8fd72c723815.jpg",
  ];

  int bannerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, bottom: 10, top: 25),
          child: MyText.large("Мэдээлэл"),
        ),
        CarouselSlider.builder(
          itemCount: listBanner.length,
          options: CarouselOptions(
            height: 180,
            viewportFraction: 1,
            initialPage: bannerIndex,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(seconds: 2),
            onPageChanged: (index, reason) {
              setState(() {
                bannerIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, i) {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: InkWell(
                onTap: () {
                  // TODO
                },
                child: CachedNetworkImage(
                  imageUrl: listBanner[bannerIndex],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        _carouselSlider(),
      ],
    );
  }

  _carouselSlider() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              for (int i = 0; i < listBanner.length; i++)
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: bannerIndex == i ? 13 : 9,
                  height: 8,
                  margin: EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: bannerIndex == i ? Styles.baseColor : Styles.textColor30,
                    //border: Border.all(color: Styles.textColor30, width: 1),
                  ),
                ),
            ]),
          ),
        ],
      ),
    );
  }
}
