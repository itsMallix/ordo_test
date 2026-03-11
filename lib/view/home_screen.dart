import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ordo_test/controller/home_controller.dart';
import 'package:ordo_test/components/home_comp/banner_widget.dart';
import 'package:ordo_test/components/home_comp/prograss_bar_widget.dart';
import 'package:ordo_test/components/home_comp/slider_widget.dart';
import 'package:ordo_test/components/home_comp/empty_widget.dart';
import 'package:ordo_test/components/sub_menu/progress_card.dart';
import 'package:ordo_test/constants/theme.dart';
import 'package:ordo_test/data/submenu_data.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller
    Get.put(HomeController());

    return Scaffold(
      backgroundColor: ColorSystem.bgColor,
      appBar: AppBar(
        toolbarHeight: 100.h,
        leading: Padding(
          padding: EdgeInsets.only(left: 12.0.w),
          child: CircleAvatar(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Image.asset("assets/images/ava.png"),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Temukan \nHunian Anda",
              style: TextSystem.h2.copyWith(
                color: ColorSystem.darkGreen,
              ),
            ),
            Text(
              "Agen Properti Terbaik",
              style: TextSystem.b1.copyWith(
                color: ColorSystem.gray200,
              ),
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 12.0.w),
                child: CircleAvatar(
                  backgroundColor: ColorSystem.white,
                  child: Icon(
                    Icons.notifications,
                  ),
                ),
              ),
              Positioned(
                right: 10.w,
                child: CircleAvatar(
                  radius: 10.r,
                  backgroundColor: ColorSystem.lightRed,
                  child: Text(
                    "3",
                    style: TextSystem.b1.copyWith(
                      color: ColorSystem.white,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: ResponsiveSystem.desktopMaxWidth,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.0.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BannerWidget(),
                  SizedBox(height: 10.h),
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pesanan Terbaru",
                                style: TextSystem.h2.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Daftar pesanan terbaru anda",
                                style: TextSystem.b1.copyWith(
                                  color: ColorSystem.gray200,
                                ),
                              ),
                            ],
                          ),
                          if (!controller.isEmpty)
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: ColorSystem.darkGreen,
                              size: 24.sp,
                            ),
                        ],
                      )),
                  SizedBox(height: 10.h),
                  Obx(() {
                    if (controller.isEmpty) {
                      return emptyWidget(
                        onExplore: () {
                          controller.setEmpty(false);
                        },
                      );
                    } else {
                      return Column(
                        children: [
                          progressBar(currentStep: 2),
                          SizedBox(height: 10.h),
                          SliderWidget(),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Menu",
                                    style: TextSystem.s1.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Daftar menu transaksi",
                                    style: TextSystem.b1.copyWith(
                                      color: ColorSystem.gray200,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.auto_awesome_mosaic_rounded,
                                color: ColorSystem.darkGreen,
                                size: 24.sp,
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: ResponsiveSystem.isDesktop(context)
                                  ? 6
                                  : ResponsiveSystem.isTablet(context)
                                      ? 4
                                      : 2,
                              mainAxisSpacing: 15.h,
                              crossAxisSpacing: 15.w,
                              childAspectRatio:
                                  ResponsiveSystem.isMobile(context)
                                      ? 0.85
                                      : 1.1,
                            ),
                            itemBuilder: (context, index) {
                              return ProgressCard(phase: submenuList[index]);
                            },
                          ),
                        ],
                      );
                    }
                  }),
                  SafeArea(
                    child: SizedBox(height: 30.h),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorSystem.white,
        selectedItemColor: ColorSystem.darkGreen,
        unselectedItemColor: ColorSystem.gray200,
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        iconSize: 24.sp,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_work_outlined),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner_outlined),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Checkout",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
