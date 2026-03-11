import 'package:flutter/material.dart';
import 'package:ordo_test/constants/theme.dart';
import 'package:ordo_test/model/submenu_model.dart';

List<SubmenuModel> submenuList = [
  SubmenuModel(
    id: "1",
    title: "Pemesanan",
    progress: 100,
    image: "assets/images/submenu_pemesanan.png",
    isActive: true,
    bgColor: ColorSystem.darkGreen,
    shadeColor: ColorSystem.darkGreenShade,
    subtitle: 'Daftar menu tahap pemesanan',
    icon: Icons.shopping_cart,
  ),
  SubmenuModel(
    id: "2",
    title: "Administrasi",
    progress: 50,
    image: "assets/images/submenu_administrasi.png",
    isActive: false,
    bgColor: ColorSystem.gray300,
    shadeColor: ColorSystem.lightGrayShade,
    subtitle: '',
    icon: Icons.import_contacts,
  ),
  SubmenuModel(
    id: "3",
    title: "Pembangunan",
    progress: 0,
    image: "assets/images/submenu_pembangunan.png",
    isActive: false,
    bgColor: ColorSystem.gray300,
    shadeColor: ColorSystem.lightGrayShade,
    icon: Icons.import_contacts,
    subtitle: '',
  ),
  SubmenuModel(
    id: "4",
    title: "Akad & Serah Terima",
    progress: 0,
    image: "assets/images/submenu_akad.png",
    isActive: false,
    bgColor: ColorSystem.gray300,
    shadeColor: ColorSystem.lightGrayShade,
    icon: Icons.import_contacts,
    subtitle: '',
  ),
];
