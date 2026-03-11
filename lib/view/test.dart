// widgets/phase_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordo_test/model/submenu_model.dart';

class PhaseCard extends StatelessWidget {
  final SubmenuModel phase;

  const PhaseCard({super.key, required this.phase});

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (_) => _PhaseBottomSheet(phase: phase),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showBottomSheet(context),
      child: Container(
        decoration: BoxDecoration(
          color: phase.isActive
              ? const Color(0xFF2D5A3D)
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              "Tahap",
              style: TextStyle(
                fontSize: 11.sp,
                color: phase.isActive ? Colors.white70 : Colors.grey,
              ),
            ),
            Text(
              phase.title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: phase.isActive ? Colors.white : Colors.black87,
              ),
            ),

            const Spacer(),

            // Bottom row: progress + image
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Progress circle
                _ProgressCircle(
                  progress: phase.progress,
                  isActive: phase.isActive,
                ),

                // Image
                Image.asset(
                  phase.image,
                  height: 70.h,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Progress circle widget
class _ProgressCircle extends StatelessWidget {
  final double progress;
  final bool isActive;

  const _ProgressCircle({required this.progress, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 40.w,
          height: 40.w,
          child: CircularProgressIndicator(
            value: progress / 100,
            strokeWidth: 3,
            backgroundColor: Colors.white24,
            valueColor: AlwaysStoppedAnimation<Color>(
              isActive ? Colors.white : const Color(0xFF2D5A3D),
            ),
          ),
        ),
        Text(
          "${progress.toInt()}%",
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.white : Colors.black87,
          ),
        ),
      ],
    );
  }
}

// Bottom sheet content
class _PhaseBottomSheet extends StatelessWidget {
  final SubmenuModel phase;

  const _PhaseBottomSheet({required this.phase});

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
