import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class BannerModel {
  String discount;
  String title;
  DateTime startDate;
  DateTime endDate;
  String image;
  Color color;

  BannerModel({
    required this.discount,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.image,
    required this.color,
  });

  String get datePeriode {
    final formatter = DateFormat("d MMM yyy, 'id_ID");
    return "${formatter.format(startDate)} s/d ${formatter.format(endDate)}";
  }
}
