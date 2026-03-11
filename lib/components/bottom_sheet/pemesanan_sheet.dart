import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordo_test/constants/theme.dart';

class PemesananSheet extends StatelessWidget {
  const PemesananSheet({super.key});

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
          Text(
            "Tahap Pemesanan",
            style: TextSystem.h2,
          ),
          SizedBox(height: 4.h),
          Text(
            "Daftar menu tahap pemesanan",
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
                childAspectRatio: isLandscape ? 1.0 : 0.85,
                children: [
                  _SheetMenuItem(
                    icon: Icons.monetization_on_outlined,
                    label: "Fee",
                    category: "Booking",
                    badge: "3",
                    isActive: true,
                  ),
                  _SheetMenuItem(
                    icon: Icons.receipt_long_outlined,
                    label: "Belum Bayar",
                    category: "Pesanan",
                    isActive: false,
                  ),
                  _SheetMenuItem(
                    icon: Icons.history_outlined,
                    label: "Pemesanan",
                    category: "Riwayat",
                    isActive: false,
                  ),
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

class _SheetMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String category;
  final String? badge;
  final bool isActive;

  const _SheetMenuItem({
    required this.icon,
    required this.label,
    required this.category,
    this.badge,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? ColorSystem.darkGreen : ColorSystem.bgColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(60.r),
          bottomLeft: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
        ),
      ),
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: isActive
                      ? ColorSystem.white.withAlpha(85)
                      : ColorSystem.white,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Icon(
                  icon,
                  color: isActive ? ColorSystem.white : ColorSystem.gray200,
                  size: 25.sp,
                ),
              ),
              if (badge != null)
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    width: 18.w,
                    height: 18.w,
                    decoration: BoxDecoration(
                      color: ColorSystem.lightRed,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        badge!,
                        style: TextSystem.b2.copyWith(
                          color: ColorSystem.white,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 6.h),
          Text(
            category,
            style: TextSystem.b2.copyWith(
              color: isActive ? Colors.white70 : ColorSystem.gray200,
            ),
          ),
          Text(
            label,
            textAlign: TextAlign.start,
            style: TextSystem.b2.copyWith(
              fontWeight: FontWeight.bold,
              color: isActive ? ColorSystem.white : null,
            ),
          ),
        ],
      ),
    );
  }
}
