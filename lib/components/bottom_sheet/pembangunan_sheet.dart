import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordo_test/constants/theme.dart';

class PembangunanSheet extends StatelessWidget {
  const PembangunanSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorSystem.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text("Tahap Pembangunan", style: TextSystem.h2),
          SizedBox(height: 4.h),
          Text(
            "Daftar menu tahap pembangunan rumah",
            style: TextSystem.b1.copyWith(color: ColorSystem.gray200),
          ),
          Divider(height: 28.h, color: Colors.grey.shade200),
          OrientationBuilder(
            builder: (context, orientation) {
              final bool isLandscape = orientation == Orientation.landscape;
              return GridView.count(
                crossAxisCount: isLandscape ? 5 : 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: isLandscape ? 1.0 : 0.75,
                children: [
                  _BuildStageItem(label: "Persiapan", progress: 100),
                  _BuildStageItem(label: "Pondasi & Struktur", progress: 20),
                  _BuildStageItem(label: "Rumah Unfinished", progress: 30),
                  _BuildStageItem(label: "Finishing & Interior", progress: 40),
                  _BuildStageItem(label: "Pembersihan", progress: 0),
                ],
              );
            },
          ),
          SizedBox(height: 20.h),
          SafeArea(child: SizedBox.shrink()),
        ],
      ),
    );
  }
}

class _BuildStageItem extends StatelessWidget {
  final String label;
  final double progress;

  const _BuildStageItem({required this.label, required this.progress});

  @override
  Widget build(BuildContext context) {
    final Color circleColor = progress >= 100
        ? ColorSystem.lightRed
        : ColorSystem.white;

    return Container(
      decoration: BoxDecoration(
        color: ColorSystem.bgColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(50.r),
          bottomLeft: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
        ),
      ),
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 48.w,
                height: 48.w,
                child: CircularProgressIndicator(
                  value: progress / 100,
                  strokeWidth: 4,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation<Color>(circleColor),
                ),
              ),
              Text(
                "${progress.toInt()}%",
                style: TextSystem.b2.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp,
                  color: ColorSystem.darkGreen,
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Text(
            "Tahap",
            style: TextSystem.b2.copyWith(
              color: ColorSystem.darkGreen,
            ),
          ),
          Text(
            label,
            textAlign: TextAlign.left,
            style: TextSystem.b2.copyWith(
              color: ColorSystem.darkGreen,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
