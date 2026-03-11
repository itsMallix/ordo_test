import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordo_test/constants/theme.dart';

class progressBar extends StatelessWidget {
  final int currentStep;
  const progressBar({
    super.key,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    List<String> steps = [
      "Pemesanan",
      "Administrasi",
      "Pembangunan",
      "Serah Terima",
    ];

    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: ColorSystem.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(steps.length, (index) {
          return Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (index != 0)
                      Expanded(
                        child: Container(
                          height: 2.h,
                          color: index <= currentStep
                              ? ColorSystem.darkGreen
                              : Colors.grey.shade300,
                        ),
                      )
                    else
                      const Spacer(),

                    _buildCircle(index),

                    // Garis KANAN
                    if (index != steps.length - 1)
                      Expanded(
                        child: Container(
                          height: 2.h,
                          color: index < currentStep
                              ? ColorSystem.darkGreen
                              : Colors.grey.shade300,
                        ),
                      )
                    else
                      const Spacer(),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  steps[index],
                  style: TextStyle(
                    fontSize: 12,
                    color: index <= currentStep
                        ? ColorSystem.darkGreen
                        : Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCircle(int index) {
    if (index < currentStep) {
      return Container(
        width: 15.w,
        height: 15.h,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: ColorSystem.darkGreen,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.check,
          color: Colors.white,
          size: 12,
        ),
      );
    }

    if (index == currentStep) {
      return Container(
        width: 15.w,
        height: 15.h,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: ColorSystem.darkGreen,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.access_time, color: Colors.white, size: 12),
      );
    }

    return Container(
      width: 15.w,
      height: 15.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.circle, color: Colors.white, size: 5.w),
    );
  }
}
