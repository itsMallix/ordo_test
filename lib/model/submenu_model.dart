// models/submenu_model.dart

import 'package:flutter/material.dart';

class SubmenuModel {
  final String id;
  final String title;
  final String subtitle;
  final double progress;
  final IconData icon;
  final bool isActive;
  final Color bgColor;
  final Color shadeColor;
  final int? badgeCount;
  final String image;

  SubmenuModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.icon,
    required this.isActive,
    required this.bgColor,
    required this.shadeColor,
    this.badgeCount,
    required this.image,
  });

  String get formattedProgress => "${progress.toInt()}%";
}
