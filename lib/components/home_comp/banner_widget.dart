import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordo_test/constants/theme.dart';
import 'package:ordo_test/data/banner_data.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        scrollDirection: Axis.horizontal,
        itemCount: bannerList.length,
        itemBuilder: (context, index) {
          final banner = bannerList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120.h,
              width: 330.w,
              padding: const EdgeInsets.fromLTRB(
                24.0,
                24.0,
                0,
                24.0,
              ).w.r,
              decoration: BoxDecoration(
                color: banner.color,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      banner.image,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "20%",
                              style: TextSystem.s1.copyWith(
                                fontWeight: FontWeight.bold,
                                color: ColorSystem.white,
                              ),
                            ),
                            TextSpan(
                              text: " diskon",
                              style: TextSystem.b1.copyWith(
                                color: ColorSystem.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        banner.title,
                        style: TextSystem.h2.copyWith(
                          color: ColorSystem.white,
                        ),
                      ),

                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: ColorSystem.white,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            banner.datePeriode,
                            style: TextSystem.b1.copyWith(
                              color: ColorSystem.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
