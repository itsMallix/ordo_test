// models/phase_model.dart

import 'package:ordo_test/model/submenu_model.dart';

class PhaseModel {
  final String id;
  final String title;
  final String description;
  final double progress;
  final String image;
  final bool isActive;
  final List<SubmenuModel> submenus;

  PhaseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.progress,
    required this.image,
    required this.isActive,
    required this.submenus,
  });

  String get formattedProgress => "${progress.toInt()}%";
}
