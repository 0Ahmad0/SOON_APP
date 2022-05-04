import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roofa/const/const_color.dart';
import 'package:roofa/department_manager/home_page/controller/home_page_controller.dart';
import 'package:roofa/setting/view/setting_screen.dart';
import 'package:roofa/user_profile/view/user_profile_screen.dart';
import 'package:roofa/widgets/home_screen_actions.dart';
import 'package:roofa/const/text_app.dart';

import '../../../user_profile/view/user_profile_screen.dart';

class HomeScreenDM extends StatefulWidget {  @override
  State<HomeScreenDM> createState() => _HomeScreenDMState();
}

class _HomeScreenDMState extends State<HomeScreenDM> {
//كلاس في فلاتر الواجهة فيه جامدة لا تتحدث البانات
  final controller = Get.put(HomePageDMController());
// كونترولر لفصل البيانات عن الواجهة أضع فيه التوابع والمتغيرات وهو من الستيت مانجمنت getx
  @override
  Widget build(BuildContext context) {//تابع بناء كل واجهة واسمه ال build من هنا يبدأ رسم كل واجهة
    return Directionality( // من أجل ظهور التنسيق باللغة العربية (من اليمين لليسار)
      textDirection: TextDirection.rtl,
      child: Scaffold(// هنا أبدا بالرسم في الواجهة مثل الحاضنة للصفحة وما بداخلها

        appBar: AppBar(  // الجزء العلوي من الصفحة يكون فيه نص يعبر عن عنوان الصفحة و أزرار رجوع أو اشعارات
          title: Text( // هذا عنوان الصفحة
            'الصفحة الرئيسية',
          ),
          centerTitle: true,  // مشان يجي العنوان يالمنتصف
          leading: GestureDetector( // هذه ويدجت تخليني أقدر أكبس على أي شيء يكون ابنها
            onTap: () {  // فانكشن عند الضغط
              Get.to(()=>SettingScreen());
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
            Stack( // نفس ال column وال row لكن الفرق أن هنا العناصر تتوضع فوق بعضها البعض مو تحت أو بجانب بعض
              alignment: Alignment.topLeft, // توضع العناصر أحتاجهم في أعلى اليسار
              children: [
                GestureDetector(
                  onTap: () {
                    Get.dialog(  // من الستيت مانجمنت getx موجود الديالوغ جاهز وهو مثل مربع يظهر فوق الشاشة
                        SingleChildScrollView( // لكي تكون الشاشة سكرول الى الاعلى واللاسفل
                          child: Column(  // من أجل وضع أكثر من ويدجت فوق بعض وبشكل عمودي
                            // هنا هذه الاشعارات بشكل يدوي لكن عند الربط ستتغير شكلها وسيكون الاشعار بشكل فعلي
                              children: List.generate(4, (index) =>
                                  Container(// حاضنة يوضع بداخلها شيء
                                padding: EdgeInsets.all(10.0),  // يعطي بعد عن الحافة للشيء لكن من الداخل
                                margin: // يعطي بعد عن الحافة للشيء لكن من الخارج عن حدود الشاشة مثلا
                                EdgeInsets.only(top: 15.h, right: 12.w, left: 12.w),
                                width: Get.width,
                                height: 90.h,
                                decoration: BoxDecoration( // للتحكم بخصائص الكونتينر لون شكل حوافه
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.r)),
                                child: Row(  // مثل العمود لكن العناصر تتوضع هنا بشكل أفقي
                                  children: [
                                    Expanded( // من أجل توزيع المسافة بالتساوي بين العناصر الموضوعة حصرا داخل row أو column حصرااااااا ولو شاهدنا flex فيعني...
                                        flex: 4, // هنا أعطي لهذه ال expanded أربع أضعاف حجم باقي ال Expanded
                                        child: Material(// مشان يظهر النص بتنسيق نظامي لو شلنا الماتيريال رح يطلع بكشل بشع وتحته خطوط
                                          color: Colors.transparent,
                                          child: Text(
                                            'يوجد لديك  ${index+2} بلاغات متأخرة',
                                            textDirection: TextDirection.rtl,// اتجاه النص
                                            style: TextStyle( // ستايل النص  حجم الخط اللون الغمق ....الخ
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
                                    Expanded(
                                        child: SvgPicture.asset( // ويدجت جاهزة لتعرض الصور بأفضل دقة ممكنة وهي تنسيق SVG
                                          'images/logo.svg',
                                          fit: BoxFit.cover,// هنا يعني أن تأخذ الصورة كامل الحجم للشيء الموضوع فيه
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
                      'images/notifications.svg',
                      width: 23.w,
                      height: 23.h,
                    ),
                  ),
                ),
                Positioned(//استطيع من خلالها تحريك العنصر اللي محطوطة عليه في أربع اتجاهات وحصرا تستخدم مع ال Stack
                  left: 0,
                  top: 0,
                  child: CircleAvatar(// ويدجت تعطي شكل دائري
                    radius: 10.r,// حجمها
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

        body:FutureBuilder( // هذا لجلب البيانات من الفاير بيز مستر أحمد بيشرح عنه أكثر بس يخلص لكم
        future: controller.fetchDataProfile(),
        builder: (context,snapShot){
        if(!snapShot.hasData){//اذا الداتا لسى ما اجت من الفاير بيز
          // اعرض لي الدائرة اللي تخبرني انو في شيء قاعد يحمل
        return Center(child: CircularProgressIndicator());
        //هون يعني البيانات أجت
        }else{
          return Column(
            //اعرضي column
            children: [
              Container(
                width: double.infinity,
                height: 133.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(//من أجل الظل اللي بين على حواف الشيء
                          color: Color(0xffA2A2A2).withOpacity(.16),
                          offset: Offset(0, 9),
                          blurRadius: 10)
                    ],
                ),
                child: ListView(// هاي مثل الكولوم والرو ولكن ايش زيادة تيجي بسكرول جاهز ما تحتاج أحط لها سكرول
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(()=>UserProfileScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child:GestureDetector(
                          onTap: () {
                            Get.to(()=>UserProfileScreen());
                            setState(() {
                            });
                          },
                          child:SvgPicture.asset(
                            'images/user-circle.svg',
                          ),
                        )
                      ),
                    ),
                    Text(
                      // controller.name,
                      'سلطان الحربي',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff447A78)),
                    ),
                    Text(
                      // 'controller.typeUser',
                      'رئيس قسم',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff447A78)),
                    ),
                  ],
                ),
              ),
              SizedBox( // هذه ويدجت تخليني أقدر احط مسافة اما بشكل عمودي او بشكل أفقي
                height: 70.h,
              ),
              Expanded(
                child: GridViewHomeActionScreen(
                  // ويدجت أنا عاملها ترجع لي المربعات اللي في الصفحة الرئيسية وتاخذ شغلتين
                  map: homeScreenGridViewDepartmentManagerText, // ليست من الصور والكتابات والصفحات التي سأنتقل لها
                  numAction: 3, // عدد المربعات التي ستعرض في السطر مثلا 3 سيعرض 3  في السطر الواحد ويكمل وهكذا
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

