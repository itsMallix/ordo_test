import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ordo_test/constants/theme.dart';
import 'package:ordo_test/controller/home_controller.dart';
import 'package:ordo_test/data/slider_data.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({
    super.key,
  });

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Column(
      children: [
        Obx(() => Stack(
              children: [
                SizedBox(
                  height: (sliderList[_currentIndex].hasDenda &&
                          !controller.isSliderLoading)
                      ? 195.h
                      : 145.h,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: sliderList.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                      controller.triggerSliderLoading();
                    },
                    itemBuilder: (context, index) {
                      final slider = sliderList[index];
                      return Container(
                        margin: EdgeInsets.only(right: 4.w),
                        padding: EdgeInsets.all(12.r),
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
                                        fontSize: 10.sp,
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
                                Expanded(
                                  child: Column(
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
                                          Expanded(
                                            child: Text(
                                              slider.title,
                                              style: TextSystem.b2.copyWith(
                                                color: ColorSystem.darkGreen,
                                              ),
                                              overflow: TextOverflow.ellipsis,
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
                                          Expanded(
                                            child: Text(
                                              slider.address,
                                              style: TextSystem.b2.copyWith(
                                                color: ColorSystem.darkGreen,
                                              ),
                                              overflow: TextOverflow.ellipsis,
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
                                ),
                              ],
                            ),
                            if (slider.hasDenda &&
                                !controller.isSliderLoading &&
                                index == _currentIndex) ...[
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.h),
                                child: Row(
                                  children: List.generate(
                                    30,
                                    (i) => Expanded(
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 2.w),
                                        height: 1.h,
                                        color: ColorSystem.gray200,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.monetization_on_outlined,
                                        color: ColorSystem.darkGreen,
                                        size: 18.sp,
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        "Denda ${slider.formattedDenda}",
                                        style: TextSystem.b1.copyWith(
                                          color: ColorSystem.darkGreen,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 4.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorSystem.darkGreen,
                                      borderRadius: BorderRadius.circular(100.r),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.warning_amber_rounded,
                                          color: ColorSystem.white,
                                          size: 14.sp,
                                        ),
                                        SizedBox(width: 4.w),
                                        Text(
                                          "Terlambat ${slider.lateDays} Hari",
                                          style: TextSystem.b1.copyWith(
                                            color: ColorSystem.white,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  ),
                ),
                if (controller.isSliderLoading)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: ColorSystem.darkGreen,
                        ),
                      ),
                    ),
                  ),
              ],
            )),
        SizedBox(height: 8.h),
        // Page indicator dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            sliderList.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              height: 6.h,
              width: _currentIndex == index ? 20.w : 6.w,
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? ColorSystem.darkGreen
                    : ColorSystem.gray200,
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
