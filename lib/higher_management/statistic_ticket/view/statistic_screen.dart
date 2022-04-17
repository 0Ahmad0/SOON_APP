import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:roofa/const/const_color.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:roofa/higher_management/homepage/view/home_screen.dart';
import 'package:roofa/higher_management/statistic_ticket/user_ticket.dart';
import 'package:roofa/widgets/material_text.dart';
import '../../../const/text_app.dart';
import '../../../widgets/dialog_date_time.dart';
import '../controller/statistic_controller.dart';
import '../ticket.dart';
import '../ticket_chart.dart';
import 'package:intl/intl.dart' as intl;

class StatisticScreen extends StatelessWidget {
  final controller = Get.put(StatisticController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("احصائيات التذاكر"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            IconButton(onPressed: (){
              Get.off(()=>HomeScreenHM());
            }, icon: Icon(Icons.home))
          ],
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
              Container(
                width: Get.width,
                height: Get.height / 3.8,
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
                    Text('إجمالي عدد التذاكر لكل الفنيين في الفترة المحددة',style: TextStyle(
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
                                    num:ticketsStatitics[0].numAllTicket,
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
                          Container(width: 1,height: Get.height,color: mainColor,),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _buildTicketText(
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
                 ()=> ExpansionTile(
                     key: GlobalKey(),
                   title: Text('اختر الفني الذي تريد عرضه',style: TextStyle(
                     color: mainColor,
                     fontWeight: FontWeight.bold
                   ),),
                   subtitle: Text('${controller.selectName}'),
                   children: controller
                       .customerNames
                       .map((e) => ListTile(
                     title: Text(e,style: TextStyle(
                       color: controller
                             .selectName
                             .value == e
                           ?mainColor:Colors.black
                     ),),
                     onTap: (){
                       controller.selectName.value = e;
                     },
                   )).toList()
                 ),
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
        ),
      ),
    );
  }

  Widget _buildTicketText({text,num,color}) => Expanded(child: Text('$text ${num}',style: TextStyle(
    color: color,
    fontWeight: FontWeight.bold
  ),),);
}
class TicketChartWidget extends StatelessWidget {
  final List<TicketChart> data;
  TicketChartWidget({required this.data});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<TicketChart, String>> series = [
      charts.Series(
          id: "Soon",
          data: data,
          domainFn: (TicketChart series, _) => series.numX,
          measureFn: (TicketChart series, _) => int.parse(series.numX),
          colorFn: (TicketChart series, _) => series.barColor
      )
    ];
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: charts.BarChart(
                series,
                animate: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
List<TicketChart> data = [
  TicketChart(
    numX: "40",
    numY: 1200,
    barColor: charts.ColorUtil.fromDartColor(Colors.green),
  ),
  TicketChart(
    numX: "35",
    numY: 1000,
    barColor: charts.ColorUtil.fromDartColor(Colors.orange),
  ),
  TicketChart(
    numX: "30",
    numY: 800,
    barColor: charts.ColorUtil.fromDartColor(Colors.blue),
  ),
  TicketChart(
    numX: "25",
    numY: 600,
    barColor: charts.ColorUtil.fromDartColor(Colors.red),
  ),
  TicketChart(
    numX: "20",
    numY: 400,
    barColor: charts.ColorUtil.fromDartColor(Colors.grey),
  ),
  TicketChart(
    numX: "15",
    numY: 200,
    barColor: charts.ColorUtil.fromDartColor(Colors.pink),
  ),
];