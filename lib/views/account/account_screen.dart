import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast_order_app/constants/color.dart';
import 'package:toast_order_app/extensions/context_extension.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#f6f6f6"),
      body: ListView(
        children: [
          SizedBox(
            height: context.dynamicHeight(0.02),
          ),
          _buildButton(context, Icons.person_2_outlined, "Profilim"),
          _buildButton(context, Icons.password, "Şifre Değiştir"),
          _buildButton(context, Icons.shopping_bag_outlined, "Siparişlerim"),
          _buildButton(context, Icons.location_on_outlined, "Adreslerim"),
          _buildButton(context, Icons.edit_note_outlined, "Notlarım"),
          _buildButton(context, Icons.phone, "İletişim Bilgilerim"),
          _buildButton(context, Icons.settings, "Ayarlar"),
          _buildButton(context, Icons.phone_in_talk, "Restoran İletişim"),
          _buildButton(context, Icons.help, "Yardım"),
          _buildExitButton(context),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, IconData icon, String text) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: context.dynamicWidth(0.05),
          vertical: context.dynamicHeight(0.001)),
      decoration: BoxDecoration(
          color: HexColor(white),
          border: Border.all(color: HexColor("f6f6f6"), width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(
          icon,
          color: HexColor(grey),
        ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: context.dynamicHeight(0.015),
            color: HexColor("#333333"),
          ),
        ),
        onTap: () {
          print("$text tıklandı");
        },
      ),
    );
  }

  Widget _buildExitButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: context.dynamicWidth(0.05),
          vertical: context.dynamicHeight(0.001)),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(context.dynamicHeight(0.01)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Çıkış Yap",
                style: TextStyle(
                  fontSize: context.dynamicHeight(0.015),
                  color: HexColor(red),
                ),
              ),
              SizedBox(
                width: context.dynamicWidth(0.03),
              ),
              Icon(
                Icons.exit_to_app_rounded,
                color: HexColor(red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
