// widgets/phase/phase_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordo_test/components/sub_menu/progress_circle.dart';
import 'package:ordo_test/components/sub_menu/progress_sheet.dart';
import 'package:ordo_test/constants/theme.dart';
import 'package:ordo_test/model/submenu_model.dart';

class ProgressCard extends StatelessWidget {
  final SubmenuModel phase;

  const ProgressCard({super.key, required this.phase});

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (_) => PhaseBottomSheet(phase: phase),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showBottomSheet(context),
      child: Container(
        decoration: BoxDecoration(
          color: phase.isActive ? ColorSystem.darkGreen : ColorSystem.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 0.w, 0.h),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                phase.image,
                height: 100.h,
                fit: BoxFit.contain,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PhaseProgressCircle(
                      progress: phase.progress,
                      isActive: phase.isActive,
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
