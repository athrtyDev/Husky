import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:husky/components/my_text.dart';

class HomeBanner extends StatefulWidget {
  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  final List<String> listBanner = [
    "https://studyinchinas.com/wp-content/uploads/2020/02/Study-in-Beijing-min-798x599.jpg",
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
        //_carouselSlider(),
      ],
    );
  }

  // _carouselSlider() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: ResponsiveFlutter.of(context).fontSize(2.5)),
  //     child: Stack(
  //       children: [
  //         SingleChildScrollView(
  //           scrollDirection: Axis.horizontal,
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: map<Widget>(list, (index, url) {
  //               return Container(
  //                 width: ResponsiveFlutter.of(context).fontSize(0.7),
  //                 height: ResponsiveFlutter.of(context).fontSize(0.7),
  //                 margin: EdgeInsets.only(right: ResponsiveFlutter.of(context).fontSize(0.8)),
  //                 decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   color: AppStyles.whiteColor,
  //                 ),
  //               );
  //             }),
  //           ),
  //         ),
  //         AnimatedPositioned(
  //           left: ResponsiveFlutter.of(context).fontSize(1.5) * informationIndex,
  //           duration: Duration(milliseconds: 500),
  //           curve: Curves.bounceOut,
  //           child: Container(
  //             width: ResponsiveFlutter.of(context).fontSize(0.7),
  //             height: ResponsiveFlutter.of(context).fontSize(0.7),
  //             margin: EdgeInsets.only(right: ResponsiveFlutter.of(context).fontSize(0.8)),
  //             decoration: BoxDecoration(
  //               shape: BoxShape.circle,
  //               color: AppStyles.baseColor,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
