import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabber_app/models/fruitmodel.dart';
import 'package:grabber_app/resources/app_color.dart';

class FruitItem extends StatelessWidget {
  FruitModel fruitModel;
  FruitItem({super.key, required this.fruitModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 160.w,
                  height: 147.h,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            fruitModel.fruitImage,
                          ))),
                ),
                const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.add,
                      size: 18,
                      color: AppColor.baseBlack,
                    ))
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fruitModel.fruitName,
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.textBlack),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/star.png",
                      width: 16.w,
                      height: 16.h,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: fruitModel.fruitRating,
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.textBlack)),
                      TextSpan(
                          text: "(${fruitModel.numOfPeopleRating})",
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.textBlack)),
                    ]))
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "\$${fruitModel.price}",
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.textBlack),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
