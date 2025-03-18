import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast_order_app/extensions/context_extension.dart';
import 'package:toast_order_app/views/starter/starter.dart';
import 'package:lottie/lottie.dart';
import 'package:toast_order_app/constants/color.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast_order_app/widget/carousel/carousel_slider_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(white),
      appBar: AppBar(
        backgroundColor: HexColor(white),
        centerTitle: true,
        title: Image.asset(
          'assets/logo.png',
          height: 50,
        ),
      ),
      body: Column(
        children: [
          // 📌 Lottie Animasyon
          Flexible(
            child: Lottie.asset(
              'assets/animations/delivery-animation.json',
            ),
          ),

          // 📌 Giriş Yap ve Üye Ol Butonları
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: context.dynamicHeight(0.05),
                horizontal: context.dynamicWidth(0.1)),
            child: Column(
              children: [
                _buildLoginButton(
                    context, "Giriş Yap", HexColor(yellow), _signInWithEmail),
                SizedBox(height: context.dynamicHeight(0.015)),
                _buildLoginButton(
                    context, "Üye Ol", HexColor(black), _signUpWithEmail),
              ],
            ),
          ),

          // 📌 Üye Olmadan Devam Et
          Padding(
            padding:
                EdgeInsets.only(bottom: 10, right: context.dynamicWidth(0.11)),
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () => _continueWithoutLogin(context),
                child: Text(
                  "Üye Olmadan Devam Et",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    // decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context, String text, Color color,
      Function(BuildContext) onTap) {
    return SizedBox(
      width: context.dynamicWidth(0.8),
      height: 40,
      child: ElevatedButton(
        onPressed: () => onTap(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Text(
          text,
          style: TextStyle(color: HexColor(white), fontSize: 15),
        ),
      ),
    );
  }

  // 📌 Firebase Authentication ile Email Giriş Yapma
  void _signInWithEmail(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "omer@example.com",
          password: "123456"); // 📌 Burayı dinamik yap!
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Starter()));
    } catch (e) {
      print("Hata: $e");
    }
  }

  // 📌 Firebase Authentication ile Üye Olma
  void _signUpWithEmail(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: "omer@example.com", password: "123456"); // 📌 Kullanıcıdan al!
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Starter()));
    } catch (e) {
      print("Hata: $e");
    }
  }

  // 📌 Üye Olmadan Devam Et
  void _continueWithoutLogin(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Starter()));
  }
}
