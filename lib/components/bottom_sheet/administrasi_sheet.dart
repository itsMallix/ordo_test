import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordo_test/constants/theme.dart';

class AdministrasiSheet extends StatelessWidget {
  const AdministrasiSheet({super.key});

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
          Text("Tahap Administrasi", style: TextSystem.h2),
          SizedBox(height: 4.h),
          Text(
            "Daftar menu tahap administrasi",
            style: TextSystem.b1.copyWith(color: ColorSystem.gray200),
          ),
          Divider(height: 28.h, color: Colors.grey.shade200),
          OrientationBuilder(
            builder: (context, orientation) {
              final bool isLandscape = orientation == Orientation.landscape;
              return GridView.count(
                crossAxisCount: isLandscape ? 6 : 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: isLandscape ? 1.0 : 0.85,
                children: [
                  _AdminMenuItem(
                    icon: Icons.description_outlined,
                    label: "SPS",
                    category: "Tahap",
                    badge: "1",
                    isActive: true,
                  ),
                  _AdminMenuItem(
                    icon: Icons.edit_document,
                    label: "SPR",
                    category: "Tahap",
                  ),
                  _AdminMenuItem(
                    icon: Icons.file_copy_outlined,
                    label: "PPJB",
                    category: "Tahap",
                  ),
                  _AdminMenuItem(
                    icon: Icons.folder_outlined,
                    label: "Dokumen",
                    category: "Daftar",
                  ),
                  _AdminMenuItem(
                    icon: Icons.assignment_outlined,
                    label: "SP3K",
                    category: "Tahap",
                  ),
                  _AdminMenuItem(
                    icon: Icons.payments_outlined,
                    label: "Angsuran",
                    category: "Bayar",
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 20.h),
          const SafeArea(child: SizedBox.shrink()),
        ],
      ),
    );
  }
}

class _AdminMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String category;
  final String? badge;
  final bool isActive;

  const _AdminMenuItem({
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
                  size: 28.sp,
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
                        style: TextStyle(
                          color: ColorSystem.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
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
              fontSize: 11.sp,
              color: isActive ? ColorSystem.white : null,
            ),
          ),
        ],
      ),
    );
  }
}
