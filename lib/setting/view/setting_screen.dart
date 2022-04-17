import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roofa/language/view/language_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("الإعدادات"),
          centerTitle: true,
          leading: Icon(Icons.arrow_back_ios),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildItem(
                  title: "الخصوصية والسياسة",
                  onTap: () {},
                ),
                Divider(thickness: 0.5),
                _buildItem(
                  title: "أسئلة وأجوبة",
                  onTap: () {},
                ),
                Divider(thickness: 0.5),
                _buildItem(
                  title: "من نحن",
                  onTap: () {},
                ),
                Divider(thickness: 0.5),
                _buildItem(
                  title: "اللغة",
                  onTap: () {
                    Get.off(()=>LanguageScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _buildItem extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const _buildItem({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xFF447A78),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF447A78),
            ),
          ],
        ),
      ),
    );
  }
}
