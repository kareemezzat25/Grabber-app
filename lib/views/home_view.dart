import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabber_app/models/data.dart';
import 'package:grabber_app/models/fruitmodel.dart';
import 'package:grabber_app/resources/app_color.dart';
import 'package:grabber_app/widgets/categorywidget.dart';
import 'package:grabber_app/widgets/fruitItem.dart';
import 'package:grabber_app/widgets/sliders.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "HomeView";

  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<FruitModel> basketsFruits = [];

  void toggleSelection(FruitModel fruit) {
    setState(() {
      if (basketsFruits.contains(fruit)) {
        basketsFruits.remove(fruit);
      } else {
        basketsFruits.add(fruit);
      }
    });
  }

  bool fruitSelected(fruit) {
    return basketsFruits.contains(fruit);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SlidersMove(),
              SizedBox(
                height: 18.h,
              ),
              SizedBox(
                height: 100.h,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryWidget(
                          categoryImage:
                              DataApp.categories[index].categoryImage,
                          categoryName:
                              DataApp.categories[index].categoryTitle);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 20.w,
                      );
                    },
                    itemCount: DataApp.categories.length),
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
                    children: List.generate(DataApp.fruits.length, (index) {
                  return FruitItem(
                    fruitModel: DataApp.fruits[index],
                    onTap: () => toggleSelection(DataApp.fruits[index]),
                    isSelected: fruitSelected(DataApp.fruits[index]),
                  );
                })),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                width: double.infinity,
                height: 70.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColor.primaryColor,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 8.sp),
                            padding: EdgeInsets.all(12.sp),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Image.asset(
                              basketsFruits[index].fruitImage,
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                        itemCount: basketsFruits.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 8.w,
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 70,
                      child: VerticalDivider(
                        color: Colors.white,
                        thickness: 1,
                        indent: 20.h,
                        endIndent: 20.h,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "View Basket",
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Badge(
                      largeSize: 12,
                      label: Text(basketsFruits.length.toString()),
                      child: SvgPicture.asset(
                        "assets/images/Icons.svg",
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
