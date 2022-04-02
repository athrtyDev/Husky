import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:husky/components/my_text.dart';
import 'package:husky/global/style.dart';

class HomeBanner extends StatefulWidget {
  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  final List<String> listBanner = [
    "https://studyinchinas.com/wp-content/uploads/2020/02/Study-in-Beijing-min-798x599.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU7adimEWjO8NMlVfBl4_Cez1BlKr2Z51gTTqK_Spicbw4eqnQl0ltiMOiwWfVi4o7I3k&usqp=CAU",
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
            autoPlay: false,
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
              for (var item in listBanner)
                Container(
                  width: 8,
                  height: 8,
                  margin: EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Styles.whiteColor,
                    border: Border.all(color: Styles.textColor30, width: 1.5),
                  ),
                ),
            ]),
          ),
          AnimatedPositioned(
            left: (15 * bannerIndex).toDouble(),
            duration: Duration(milliseconds: 500),
            curve: Curves.bounceOut,
            child: Container(
              width: 8,
              height: 8,
              margin: EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Styles.baseColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
