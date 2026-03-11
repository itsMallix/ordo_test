import 'package:intl/intl.dart';

class SliderModel {
  String id;
  String title;
  String address;
  DateTime timestamp;
  int price;
  String image;
  String type;

  SliderModel({
    required this.id,
    required this.title,
    required this.address,
    required this.timestamp,
    required this.price,
    required this.image,
    required this.type,
  });

  String get formattedDate {
    final formatter = DateFormat("dd/MM/yyyy, HH:mm", 'id_ID');
    return formatter.format(timestamp);
  }

  String get formattedPrice {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    return formatter.format(price);
  }
}
