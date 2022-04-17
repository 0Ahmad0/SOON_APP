import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:roofa/const/const_color.dart';
import '/technical/achievement/controller/achevmebt_controller.dart';

import '../../../const/text_app.dart';
import '../../../higher_management/statistic_ticket/view/statistic_screen.dart';
import '../../../widgets/dialog_date_time.dart';
import '../../../widgets/material_text.dart';

class AchivementTScreen extends StatelessWidget {
  final controller = Get.put(AchivementTController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'عرض تقارير التذاكر',
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Obx(
                        ()=>Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              padding: EdgeInsets.all(5.r),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20.w
                              ),
                              width: 235.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.r),
                                  boxShadow: [
                                    BoxShadow(
                                        color: colorShadowSearch.withOpacity(.23),
                                        blurRadius: 10,
                                        offset: Offset(0, 4))
                                  ]),
                              child:  Row(
                                children: [
                                  Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.onClickButton(0);
                                        },
                                        child: AnimatedContainer(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: controller.index.value == 0
                                                  ? mainColor
                                                  : Colors.white,
                                              borderRadius: BorderRadius.circular(50.r)),
                                          child: Text(
                                            'أسبوعي',
                                            style: TextStyle(
                                              color: controller.index.value == 0
                                                  ? controller.textButtonActive
                                                  : mainColor,
                                            ),
                                          ),
                                          duration: Duration(milliseconds: 800),
                                        ),
                                      )),
                                  Expanded(
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
                Obx(()=>Stack(
                  alignment: Alignment.center,
                  children: [

                    Positioned(
                      left: 15.w,
                      top: 5.h,
                      child: GestureDetector(
                        onTap: (){
                          Get.dialog(Center(
                            child: Container(
                              width: Get.width,
                              height: Get.width / 4,
                              color: Colors.white,
                              child: MaterialText(text: 'الأرشيف',fontSize: 50.sp,textAlign: TextAlign.center,),
                            ),
                          ),
                          );
                          Timer(
                              Duration(milliseconds: 800),
                                  ()=>Get.back()
                          );
                        },
                        child: SvgPicture.asset('images/download.svg'),
                      ),
                    ),
                    Column(
                      children: [
                        SvgPicture.asset('images/user-circle.svg'),
                        Text(controller.selectName.value,style: TextStyle(
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
                                        text:'إجمالي التذاكر : ',
                                        num:userTicket[0].numAllTicket,
                                        color: Colors.green
                                    ),
                                    _buildTicketText(
                                        text:'التذاكر المغلقة : ',
                                        num:userTicket[0].numClosedTicket,
                                        color: Colors.red
                                    ),
                                    _buildTicketText(
                                        text:'التذاكر المتأخرة : ',
                                        num:userTicket[0].numLateTicket,
                                        color: Colors.pinkAccent
                                    ),
                                    _buildTicketText(
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
                                        text:' التذاكر المعلقة : ',
                                        num:userTicket[0].numPendingTicket,
                                        color: Colors.grey
                                    ),
                                    _buildTicketText(
                                        text:'التذاكر المعتمدة : ',
                                        num:userTicket[0].numAcceptableTicket,
                                        color: Colors.orange
                                    ),
                                    _buildTicketText(
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
                      child: LayoutBuilder(
                        builder: (context, constrains) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                    data: data,
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
  Widget _buildTicketText({text,num,color}) => Expanded(child: Text('$text ${num}',style: TextStyle(
      color: color,
      fontWeight: FontWeight.bold
  ),),);
}
