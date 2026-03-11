import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordo_test/constants/theme.dart';
import 'package:ordo_test/data/slider_data.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145.h,
      // width: double.infinity,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        scrollDirection: Axis.horizontal,
        itemCount: sliderList.length,
        itemBuilder: (context, index) {
          final slider = sliderList[index];
          return Container(
            height: 145.h,
            width: 335.w,
            padding: EdgeInsets.all(12).r.w,
            decoration: BoxDecoration(
              color: ColorSystem.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "#${slider.id}",
                      style: TextSystem.b1.copyWith(
                        color: ColorSystem.darkGreen,
                      ),
                    ),
                    Container(
                      height: 20.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        color: ColorSystem.lightGreen,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Center(
                        child: Text(
                          slider.type,
                          style: TextSystem.b1.copyWith(
                            color: ColorSystem.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                        slider.image,
                        height: 80.h,
                        width: 80.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.home_outlined,
                              color: ColorSystem.darkGreen,
                              size: 20.sp,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              slider.title,
                              style: TextSystem.b2.copyWith(
                                color: ColorSystem.darkGreen,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: ColorSystem.darkGreen,
                              size: 20.sp,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              slider.address,
                              style: TextSystem.b2.copyWith(
                                color: ColorSystem.darkGreen,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              color: ColorSystem.darkGreen,
                              size: 20.sp,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              slider.formattedDate,
                              style: TextSystem.b1.copyWith(
                                color: ColorSystem.darkGreen,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Rp",
                              style: TextSystem.b1.copyWith(
                                color: ColorSystem.darkGreen,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              slider.formattedPrice,
                              style: TextSystem.b1.copyWith(
                                color: ColorSystem.darkGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
