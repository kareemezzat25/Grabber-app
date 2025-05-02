import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabber_app/models/categorymodel.dart';
import 'package:grabber_app/models/fruitmodel.dart';
import 'package:grabber_app/resources/app_assets.dart';
import 'package:grabber_app/resources/app_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:grabber_app/widgets/categorywidget.dart';
import 'package:grabber_app/widgets/fruitItem.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "HomeView";
  List<String> sliders = [
    AppAssets.slider1,
    AppAssets.slider2,
    AppAssets.slider3
  ];
  List<FruitModel> fruits = [
    FruitModel(
        fruitImage: "assets/images/Banana.png",
        fruitName: "Banana",
        fruitRating: "4.8",
        numOfPeopleRating: "287",
        price: "3.99"),
    FruitModel(
        fruitImage: "assets/images/pepper.png",
        fruitName: "Pepper",
        fruitRating: "4.8",
        numOfPeopleRating: "287",
        price: "2.99"),
    FruitModel(
        fruitImage: "assets/images/orange.png",
        fruitName: "Orange",
        fruitRating: "4.8",
        numOfPeopleRating: "287",
        price: "3.99"),
  ];
  List<CategoryModel> categories = [
    CategoryModel(
        categoryImage: AppAssets.fruitsCategory, categoryTitle: "Fruits"),
    CategoryModel(
        categoryImage: AppAssets.milkEggsCategory, categoryTitle: "Milk&Eggs"),
    CategoryModel(
        categoryImage: AppAssets.beveragesCategory, categoryTitle: "Beverages"),
    CategoryModel(
        categoryImage: AppAssets.laundryCategory, categoryTitle: "Laundry"),
    CategoryModel(
        categoryImage: AppAssets.vegetablesCategory,
        categoryTitle: "Vegetables")
  ];
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        title: Row(children: [
          const Icon(Icons.motorcycle),
          SizedBox(
            width: 12.w,
          ),
          Text(
            "61 Hopper street..",
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColor.textBlack),
          ),
          SizedBox(
            width: 16.w,
          ),
          const Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 24,
            color: AppColor.textBlack,
          ),
          Spacer(),
          SvgPicture.asset("assets/images/Icons.svg")
        ]),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: sliders.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return Image.asset(
                  sliders[itemIndex],
                );
              },
              options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 0.8,
                  aspectRatio: 16 / 9,
                  enlargeCenterPage: true),
            ),
            SizedBox(
              height: 18.h,
            ),
            SizedBox(
              height: 100.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryWidget(
                        categoryImage: categories[index].categoryImage,
                        categoryName: categories[index].categoryTitle);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 20.w,
                    );
                  },
                  itemCount: categories.length),
            ),
            SizedBox(
              height: 34.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fruits",
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.baseBlack),
                ),
                Text(
                  "See all",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryColor),
                )
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(fruits.length, (index) {
                return FruitItem(fruitModel: fruits[index]);
              })),
            )
          ],
        ),
      ),
    );
  }
}
