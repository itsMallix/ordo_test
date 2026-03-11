import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordo_test/model/submenu_model.dart';

class PhaseBottomSheet extends StatelessWidget {
  final SubmenuModel phase;

  const PhaseBottomSheet({super.key, required this.phase});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
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

          // Header
          Row(
            children: [
              Image.asset(phase.image, height: 60.h, fit: BoxFit.contain),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tahap",
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  ),
                  Text(
                    phase.title,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Progress bar
          Text(
            "Progress",
            style: TextStyle(fontSize: 13.sp, color: Colors.grey),
          ),
          SizedBox(height: 8.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: LinearProgressIndicator(
              value: phase.progress / 100,
              minHeight: 10.h,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF2D5A3D),
              ),
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            phase.formattedProgress,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2D5A3D),
            ),
          ),
          SizedBox(height: 16.h),

          // Description
          Text(
            phase.id,
            style: TextStyle(fontSize: 13.sp, color: Colors.black87),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
