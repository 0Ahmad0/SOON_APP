import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roofa/const/const_color.dart';
import 'package:roofa/department_manager/home_page/controller/home_page_controller.dart';
import 'package:roofa/widgets/home_screen_actions.dart';
import 'package:roofa/const/text_app.dart';


class HomeScreenDM extends StatelessWidget {
  final controller = Get.put(HomePageDMController());
  //state managment getx
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'الصفحة الرئيسية',
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Get.dialog(
                  SingleChildScrollView(
                    child: Column(
                children: List.generate(15, (index) => Container(
                    padding: EdgeInsets.all(10.0),
                    margin:
                    EdgeInsets.only(top: 15.h, right: 12.w, left: 12.w),
                    width: Get.width,
                    height: 90.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                'يوجد لديك  ${index+2} بلاغات متأخرة',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                    color: mainColor),
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 12.w),
                          width: .5,
                          color: Colors.black.withOpacity(.5),
                        ),
                        Expanded(child: SvgPicture.asset(
                          'images/logo.svg',
                          fit: BoxFit.cover,
                        )),
                      ],
                    ),
                ))
              ),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                'images/settings.svg',
                width: 23.w,
                height: 23.h,
              ),
            ),
          ),
          actions: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      'images/notifications.svg',
                      width: 23.w,
                      height: 23.h,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: CircleAvatar(
                    radius: 10.r,
                    backgroundColor: Colors.red,
                    child: Text(
                      '4',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold
                          ,color: Colors.white
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),

        body:FutureBuilder(
        future: controller.fetchDataProfile(),
        builder: (context,snapShot){
        if(!snapShot.hasData){
        return Center(child: CircularProgressIndicator());
        }else{
          return Column(
            children: [
              Container(
                width: double.infinity,
                height: 133.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xffA2A2A2).withOpacity(.16),
                          offset: Offset(0, 9),
                          blurRadius: 10)
                    ]),
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          'images/user-circle.svg',
                        ),
                      ),
                    ),
                    Text(
                      'controller.name',
                      //'سلطان الحربي',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff447A78)),
                    ),
                    Text(
                      'controller.typeUser',
                      //'رئيس قسم',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff447A78)),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 70.h,
              ),

              Expanded(
                child: GridViewHomeActionScreen(
                  map: homeScreenGridViewDepartmentManagerText,
                  numAction: 3,
                ),
              ),
            ],
          );
        }
        }
        ),
      ),
    );
  }
}

