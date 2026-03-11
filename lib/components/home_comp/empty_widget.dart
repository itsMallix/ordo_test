import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ordo_test/constants/theme.dart';
import 'package:ordo_test/controller/home_controller.dart';

class emptyWidget extends StatelessWidget {
  final VoidCallback? onExplore;
  const emptyWidget({
    super.key,
    this.onExplore,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/home_empty.png",
            height: 200.h,
            fit: BoxFit.contain,
          ),
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
          Obx(() => ElevatedButton(
                onPressed: controller.isExploring
                    ? null
                    : () {
                        if (onExplore != null) {
                          onExplore!();
                        } else {
                          controller.startExplore();
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorSystem.darkGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                ),
                child: controller.isExploring
                    ? SizedBox(
                        height: 20.w,
                        width: 20.w,
                        child: const CircularProgressIndicator(
                          color: ColorSystem.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.search,
                            color: ColorSystem.white,
                            size: 20.sp,
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
              )),
          Obx(() => controller.isExploring
              ? Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: const CircularProgressIndicator(
                    color: ColorSystem.darkGreen,
                  ),
                )
              : const SizedBox.shrink()),
        ],
      ),
    );
  }
}
