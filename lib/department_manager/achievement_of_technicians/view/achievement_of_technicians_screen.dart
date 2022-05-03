import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:roofa/department_manager/achievement_of_technicians/controller/achievement_of_technicians_controller.dart';

import '../../../const/const_color.dart';
import '../../../const/text_app.dart';
import '../../../higher_management/statistic_ticket/view/statistic_screen.dart';
import '../../../widgets/dialog_date_time.dart';
import '../../../widgets/material_text.dart';

class AchievementOfTechniciansScreen extends StatelessWidget {
  final controller = Get.put(AchievementOfTechniciansController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'إنجاز الفنيين',
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView( //لكي تكون الشاشة سكرول لأعلى واسفل
          child: Column(//نوضع عناصر تحت بعض بشكل عمودي
            crossAxisAlignment: CrossAxisAlignment.stretch,//خلي العناصر بوضعها الطبعي من حيث الحجم والشكل ومكان التوضع في العمود
            children: [
              Obx( // هذه من ال statemanagment  getX وتفيد في الاستماع إلى التغيرات التي تحدث على أي شيء في الكونترولر وتحدث المنطقة الموضوع بها هذا ال Obx وهذه فائدة من فوائد ال statemanagment
                      ()=>Padding( //عطي العنصر بعدعن الحواف من الداخل
                    padding: const EdgeInsets.all(12.0),//قيمة البعد
                    child: Row( // مثل العمود لكن العناصر تتوضع هنا بشكل أفقي
                      children: [
                        Expanded( //من أجل تساوي البعد بين العناصر وتستعمل فقط(مع ال column و ال Row)
                          flex: 5,//اذا راينا هذه فتعني اعطي هذه الاكسباند حجم 5 مرات حجم الاكسباندات الباقية
                          child: Container(//حافظة او مربع له خصائص
                            padding: EdgeInsets.all(5.r),//بعد داخلي
                            margin: EdgeInsets.symmetric(//بعد خارجي عن الحواف تبع الشاشة أو الشيء الموضوع فيه
                                horizontal: 20.w // قيمة البعد w تعني أنو بعد لي عن الحواف 20 بكسل من عرض الشاشة اللي انت  فيها وهذه تفيد في الريسبونسف والتناسق بين جميع الأجهزة
                            ),
                            width: 235.w,
                            height: 35.h, // h تعني من طول الشاشة التي انت فيها
                            decoration: BoxDecoration(//تنسيق الكونتينر
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.r),//جعل حواف الشكل دائرية نوعا ما
                                boxShadow: [
                                  BoxShadow( // الظل
                                      color: colorShadowSearch.withOpacity(.23),//لون الظل
                                      blurRadius: 10,//قيمة التياعد في الظل أول التشويش مثل الكاميرا
                                      offset: Offset(0, 4)) // بغد الظل عن الشكل (x, y)
                                ]),
                            child:  Row(//عناصر افقية
                              children: [
                                Expanded( //تساوي الحجم
                                    child: GestureDetector(// تخليني أكبس على اي شيئ بداخلها وتأخذ بارمترين تابع للكبس و child
                                      onTap: () {
                                        controller.onClickButton(0);//تابع يجعل لي قيمة الانديكس 0 ويفيد هذا الانديكس بمعرفة مكان الصفحة الموجود فيها من اجل الانتقال بين الصفحتين
                                      },
                                      child: AnimatedContainer( // مثل الكونتينر العادي لكن هذا عند تطبيق التغيرات مثلا عند الكبس عليه سيتغيرلونه فيتغير بأنميشن ملاحظ مما يعطي جودة للشكل والمنظر
                                        alignment: Alignment.center, // توضع العناصر بداخل هذا الكونتينر في المنتصف
                                        decoration: BoxDecoration( // الشكل خواصه
                                            color: controller.index.value == 0 // مقارنة الزر الفعال لانه يوجد لدي زرسن اذا كان 0 الزر لونه أخضر وإلا لونه ابيض
                                                ? mainColor
                                                : Colors.white,
                                            /*
                                            طبعا القيم هذه محطوطة في الكونترولر
                                            controller.index.value == 0
                                            ?mainColor
                                            :Colors.white
                                            ===
                                            if(controller.index.value == 0){
                                            color: mainColor;
                                            }else{
                                            color: Colors.white
                                            }
                                             */
                                            borderRadius: BorderRadius.circular(50.r)),
                                        child: Text(
                                          'أسبوعي',
                                          style: TextStyle( // تنسيق النص
                                            color: controller.index.value == 0 // نفس الشيء مقارنة الانديكس لتلوين النص للزر الفعال
                                                ? controller.textButtonActive
                                                : mainColor,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 800), // هنا قيمة الانميشن التي تطبق على هذا الكونتينر وهو الذي يميزه عن الكونتينر العادي
                                      ),
                                    )),
                                Expanded( // هنا زر أخر نفس الزر اللي سبق شرحناه فقط قيمة الانديكس هنا نجعلها 1 والباقي نفسه
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.onClickButton(1);
                                      },
                                      child: AnimatedContainer(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: controller.index.value == 1
                                                ? mainColor
                                                : Colors.white,
                                            borderRadius: BorderRadius.circular(50.r)),
                                        child: Text(
                                          'شهري',
                                          style: TextStyle(
                                            color: controller.index.value == 1
                                                ? controller.textButtonActive
                                                : mainColor,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 500),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                              onPressed: () {
                                Get.dialog(DalogDateTime());
                              },
                              icon: Icon(
                                Icons.date_range_sharp,
                                color: grayColor,
                              )),
                        ),

                      ],
                    ),
                  )
              ),
              Container(
                width: Get.width, // عرض الشاشة
                height: Get.height / 3.8, // طول الشاشة
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(//ظل
                          color: Color(0xfCBC6C6).withOpacity(.16),
                          offset: Offset(0,9),//بعد الظل عن الشكل (x , y)
                          blurRadius: 10
                      ),
                    ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, // العناصر في الوضع الطبيعي
                  children: [
                    Text('إجمالي عدد التذاكر لكل الفنيين في الفترة المحددة',
                      style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold, // الخط عريض
                        fontSize: 15.sp
                    ),),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _buildTicketText(  // هنا ويدجت أنا عملتها تاخذ 3 بارمترات ال نص واللون وال عددوهي موضوعة في column
                                      text:'إجمالي التذاكر : ',
                                      num: ticketsStatitics[0].numAllTicket,
                                      color: Colors.green
                                  ),
                                  _buildTicketText(
                                      text:'التذاكر المغلقة : ',
                                      num:ticketsStatitics[0].numClosedTicket,
                                      color: Colors.red
                                  ),
                                  _buildTicketText(
                                      text:'التذاكر المتأخرة : ',
                                      num:ticketsStatitics[0].numLateTicket,
                                      color: Colors.pinkAccent
                                  ),
                                  _buildTicketText(
                                      text:'عدد التركيبات : ',
                                      num:ticketsStatitics[0].numCombinations,
                                      color: mainColor
                                  ),
                                  _buildTicketText(
                                      text:' فك / إزالة : ',
                                      num:ticketsStatitics[0].numRemoval,
                                      color: mainColor
                                  ),

                                ],
                              ),
                            ),
                          ),
                          Container(width: 1,height: Get.height,color: mainColor,),//هنا خط رفيع بالطول يفيد فقط بالشكل وجمال المنظر
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _buildTicketText( // نفس الشيء أيضا هنا
                                      text:' التذاكر المعلقة : ',
                                      num:ticketsStatitics[0].numPendingTicket,
                                      color: Colors.grey
                                  ),
                                  _buildTicketText(
                                      text:' التذاكر تحت الإجراء : ',
                                      num:ticketsStatitics[0].numProcedureTicket,
                                      color: Colors.blue
                                  ),
                                  _buildTicketText(
                                      text:' لا تتبع لقسم الصيانة : ',
                                      num:ticketsStatitics[0].numNotMaintenanceSection,
                                      color: Colors.orange
                                  ),
                                  _buildTicketText(
                                      text:' عدد التبديلات : ',
                                      num:ticketsStatitics[0].numChanges,
                                      color: mainColor
                                  ),
                                  _buildTicketText(
                                      text:' عدد الصيانات : ',
                                      num:ticketsStatitics[0].numMaintenance,
                                      color: mainColor
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                    ()=> ExpansionTile( // هذه تخليني اقدر اعرض العناصر بشكل اقدر اختار من متعدد وتكون في الاول مخقفية عند الضغط تزهر العناصر اسفلها
                    key: GlobalKey(), // هذه من أجل فتح واغلاق هذه ال ليست
                    title: Text('اختر الفني الذي تريد عرضه',style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold
                    ),),
                    subtitle: Text('${controller.selectName}'), //هذه النص الذي يكون ظاهر قبل فتح هذه الليست
                    children: controller // هنا ليست من الأطفال وهم نصوص اقدر اختار منهم
                        .customerNames
                        .map((e) => ListTile( // هنا ويدجت تعرض ما داخل الليست اللي فوق بشكل نص كاني واضعه في Row لكن هنا متاحة خصائص أكثر
                      title: Text(
                        e, // هذه ال e من الليست اللي حولتها ل map لاقدر اضع ويدجت وهي تكافي ال forloop
                        style: TextStyle(
                          color: controller // هنا مقارنة من أجل الللون أيضا
                              .selectName
                              .value == e
                              ?mainColor:Colors.black
                      ),),
                      onTap: (){
                        controller.selectName.value = e; // هنا لاختيار الاسم
                      },
                    )).toList()
                ),
              ),
              Obx( // نفس الشي من الستست مانجمينت لتغيير المكان المحدد فقط
                      ()=>Stack( // يوضع العناصر فوق بعضا اليعض
                alignment: Alignment.center,
                children: [
                  Positioned( // إزاحة العناصر عن بعضها داخل ال stack فقط تستخدم هذه الويدجت
                    left: 15.w,
                    top: 5.h,
                    child: GestureDetector( // عند الكبس أظهر ديالوغ
                      onTap: (){
                        Get.dialog( //ديالوغ جاهز من الستست مانجمنت هذا يظهر في منتصف الشاشة ويخير المستخدم بشيء او يحذره من شيء أو يطلب منه ادخال شيء مثلا
                          Center(
                          child: Container(
                            width: Get.width,
                            height: Get.width / 4,
                            color: Colors.white,
                            child: MaterialText( // ويدجت جاهزة تخلي النص بداخل الديالوغ ماتيريال
                              text: 'الأرشيف',
                              fontSize: 50.sp,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        );
                        Timer( // مؤقت لزوال الشيء يعد تنفيذه وهو مذة ظهور الديالوغ واختفاءه
                            Duration(milliseconds: 800), // مدة عرضه أقل من ثانية يعني
                                ()=>Get.back() // عند انتهاء المؤقت اعمل الغاء للديالوغ
                        );
                      },
                      child: SvgPicture.asset('images/download.svg'), // الشيء الذي سأكبس عليه هو هذه الصورة
                    ),
                  ),
                  Column(
                    children: [
                      SvgPicture.asset('images/user-circle.svg'),// صوؤة بصيغة svg من أجل الدقة العالية
                      Text(controller.selectName.value,
                        style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  )
                ],)),
              Container(
                width: Get.width,
                height: Get.height / 4.8,
                margin: EdgeInsets.only(top: 10.0.h),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xfCBC6C6).withOpacity(.16),
                          offset: Offset(0,9),
                          blurRadius: 10
                      ),
                    ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('عدد التذاكر في الفترة الزمنية المحددة',style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp
                    ),),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _buildTicketText(
                                      onTap: (){},
                                      text:'إجمالي التذاكر : ',
                                      num:userTicket[0].numAllTicket,
                                      color: Colors.green
                                  ),
                                  _buildTicketText(
                                      onTap: (){},
                                      text:'التذاكر المغلقة : ',
                                      num:userTicket[0].numClosedTicket,
                                      color: Colors.red
                                  ),
                                  _buildTicketText(
                                      onTap: (){},
                                      text:'التذاكر المتأخرة : ',
                                      num:userTicket[0].numLateTicket,
                                      color: Colors.pinkAccent
                                  ),
                                  _buildTicketText(
                                      onTap: (){},
                                      text:'عدد الزيارات في الشهر : ',
                                      num:userTicket[0].visitedInMonth,
                                      color:Colors.black
                                  ),

                                ],
                              ),
                            ),
                          ),
                          Container(width: 1,height: Get.height,color: mainColor,),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _buildTicketText(
                                      onTap: (){},
                                      text:' التذاكر المعلقة : ',
                                      num:userTicket[0].numPendingTicket,
                                      color: Colors.grey
                                  ),
                                  _buildTicketText(
                                      onTap: (){},
                                      text:'التذاكر المعتمدة : ',
                                      num:userTicket[0].numAcceptableTicket,
                                      color: Colors.orange
                                  ),
                                  _buildTicketText(
                                      onTap: (){},
                                      text:' التذاكر تحت الإجراء : ',
                                      num:userTicket[0].numProcedureTicket,
                                      color: Colors.blue
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: List.generate(2, (index) => GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 12.w, vertical: 10.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                        boxShadow: [
                          BoxShadow(
                            color: colorShadowSearch.withOpacity(.23),
                            blurRadius: 10,
                            offset: Offset(0, 9),
                          )
                        ]),
                    child: LayoutBuilder( // تعطيني طول العنصر اللي موضوع ضمنتها تفيد في تناسق الشاة على مختلف الواجهات وجعل الشكل ريسبونسف أكثر
                      builder: (context, constrains) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // شطل الكونتينر تبع التذكرة اللي فيه شريط ملون
                            Expanded(
                                child: Container(
                                  height: constrains.maxWidth / 2.5,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15.r),
                                        bottomRight: Radius.circular(15.r),
                                      )),
                                )),
                            Expanded(
                                flex: 18,
                                child: Container(
                                  padding: EdgeInsets.all(10.r),
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    children: [
                                      // كل عنصر يحتاج أن اعرضه بجانب بعضه فعندي row بداخلها wrap  مثل الشي ال 2 يوضعون العتاصر بجانب بعضها ويقبلون أكثر من child وهنا فقط عرض بيانات كلها Text بداخل كونتينر
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Wrap(
                                                children: [
                                                  Text(
                                                    'رقم البلاغ: ',
                                                    style: TextStyle(
                                                        color: mainColor,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 15.sp),
                                                  ),
                                                  Text(
                                                    '${allreports[3]['report_num']}',
                                                    style: TextStyle(
                                                        color: mainColor,
                                                        height: 1.5),
                                                  ),
                                                ],
                                              )),
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 6.r,
                                                backgroundColor: Colors.red,
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Text(
                                                '${allreports[3]['report_status']}',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              )
                                            ],
                                          )

                                        ],
                                      ),

                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Wrap(
                                                children: [
                                                  Text(
                                                    'الجهة: ',
                                                    style: TextStyle(
                                                        color: mainColor,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 15.sp),
                                                  ),
                                                  Text(
                                                    '${allreports[3]['report_sender']}',
                                                    style: TextStyle(
                                                        color: mainColor,
                                                        height: 1.5),
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .stretch,
                                              children: [
                                                Wrap(
                                                  children: [
                                                    Text(
                                                      'المقر: ',
                                                      style: TextStyle(
                                                          color: mainColor,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                          fontSize: 15.sp),
                                                    ),
                                                    Text(
                                                      '${allreports[3]['report_position']}',
                                                      style: TextStyle(
                                                          color: mainColor,
                                                          height: 1.5),
                                                    ),
                                                  ],
                                                ),
                                                Wrap(
                                                  children: [
                                                    Text(
                                                      'الاسم: ',
                                                      style: TextStyle(
                                                          color: mainColor,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                          fontSize: 15.sp),
                                                    ),
                                                    Text(
                                                      '${allreports[3]['reporter_name']}',
                                                      style: TextStyle(
                                                          color: mainColor,
                                                          height: 1.5),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        );
                      },
                    ),
                  ),
                )),
              ),
              Container(
                width: Get.width,
                height: Get.height / 1.99,
                child: TicketChartWidget(
                  // هذه ويدجت الChart التي ترسم المخطط تقبل ليست كاملة من ال بيانات وهي تقوم بعرضها
                  data: data,
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
  Widget _buildTicketText( // هاي الويدجت توفر علي عدد أسطر الكود
      {text,num,color,onTap}
      ) => Expanded(child: GestureDetector(
    onTap: onTap,
        child: Text('$text ${num}',style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold
  ),),
      ),);
}
