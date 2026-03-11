import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordo_test/constants/theme.dart';

class emptyWidget extends StatelessWidget {
  final VoidCallback? onExplore;
  const emptyWidget({
    super.key,
    this.onExplore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/home_empty.png"),
        SizedBox(height: 5.h),
        Text(
          "Pesanan Kosong",
          style: TextSystem.h2.copyWith(
            color: ColorSystem.darkGreen,
          ),
        ),
        Text(
          "Ayo tambahkan pesanan terbaru",
          style: TextSystem.b1.copyWith(
            color: ColorSystem.gray200,
          ),
        ),
        SizedBox(height: 10.h),
        ElevatedButton(
          onPressed: onExplore ?? () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorSystem.darkGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
          child: SizedBox(
            width: 120.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  color: ColorSystem.white,
                ),
                SizedBox(width: 5.w),
                Text(
                  "Eksplor Properti",
                  style: TextSystem.b1.copyWith(
                    color: ColorSystem.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
