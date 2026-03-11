import 'package:ordo_test/constants/theme.dart';
import 'package:ordo_test/model/banner_model.dart';

List<BannerModel> bannerList = [
  BannerModel(
    discount: '20%',
    title: 'American House',
    startDate: DateTime(2023, 9, 16),
    endDate: DateTime(2023, 12, 15),
    image: "assets/images/house_1.png",
    color: ColorSystem.darkGreen,
  ),
  BannerModel(
    discount: '20%',
    title: 'American House',
    startDate: DateTime(2023, 9, 16),
    endDate: DateTime(2023, 12, 15),
    image: "assets/images/house_2.png",
    color: ColorSystem.lightGreen,
  ),
];
