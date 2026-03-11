// widgets/phase/phase_progress_circle.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordo_test/constants/theme.dart';

class PhaseProgressCircle extends StatelessWidget {
  final double progress;
  final bool isActive;

  const PhaseProgressCircle({
    super.key,
    required this.progress,
    required this.isActive,
  });

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
              isActive ? ColorSystem.lightRed : ColorSystem.darkGreen,
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
