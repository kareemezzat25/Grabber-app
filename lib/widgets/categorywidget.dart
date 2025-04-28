import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabber_app/resources/app_color.dart';

class CategoryWidget extends StatelessWidget {
  String categoryName;
  String categoryImage;
  CategoryWidget(
      {super.key, required this.categoryImage, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70.w,
          height: 70.h,
          decoration: BoxDecoration(
              color: Colors.grey.shade300, shape: BoxShape.circle),
          child: Image.asset(
            categoryImage,
            width: 43.w,
            height: 43.h,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Flexible(
          child: Text(
            categoryName,
            style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColor.baseBlack),
          ),
        )
      ],
    );
    ;
  }
}
