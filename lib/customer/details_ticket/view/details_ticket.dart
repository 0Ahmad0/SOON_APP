import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:roofa/Customer/details_ticket/controller/detalis_ticket_controller.dart';
import 'package:roofa/Customer/supervise_reports/view/superviser_report_screen.dart';
import 'package:roofa/const/const_color.dart';
import 'package:roofa/widgets/custom_dialog.dart';
import 'package:roofa/widgets/material_text.dart';
import 'package:roofa/const/text_app.dart';

class DetailsTicketScreen extends StatelessWidget {
  final controller = Get.put(DetailsTicketController());
  Color? color;

  DetailsTicketScreen({this.color});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("تفاصيل التذكرة"),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: (){
                Get.offNamed('/superviser_report_screen');
              },
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home,
                    size: 30.r,
                  ))
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Obx(
                  ()=>Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                      controller.controllerPageView!
                                          .animateToPage(
                                          0,
                                          duration: Duration(milliseconds: 800),
                                          curve: Curves.decelerate
                                      );
                                    },
                                    child: AnimatedContainer(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: controller.index.value == 0
                                              ? mainColor
                                              : Colors.white,
                                          borderRadius: BorderRadius.circular(50.r)),
                                      child: Text(
                                        'تفاصيل التذكرة',
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
                                      controller.controllerPageView!
                                          .animateToPage(
                                          1,
                                          duration: Duration(milliseconds: 800),
                                          curve: Curves.decelerate
                                      );

                                    },
                                    child: AnimatedContainer(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: controller.index.value == 1
                                              ? mainColor
                                              : Colors.white,
                                          borderRadius: BorderRadius.circular(50.r)),
                                      child: Text(
                                        'سجل البلاغ',
                                        style: TextStyle(
                                          color: controller.index.value == 1
                                              ? controller.textButtonActive
                                              : mainColor,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 800),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      controller.index.value==1?
                      Expanded(
                          child: IconButton(
                            icon: Icon(Icons.print,color: colorShadowSearch,),
                            onPressed: (){},
                          )):SizedBox(),

                    ],
                  )
              ),
              Expanded(
                child: PageView(
                  controller: controller.controllerPageView,
                  onPageChanged: (val){
                    controller.index.value = val;
                  },
                  children: [
                    DetailsTicketPage(controller: controller, color: color),
                    ReportsLogPage(color: color),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class DetailsTicketPage extends StatelessWidget {
  const DetailsTicketPage({
    Key? key,
    required this.controller,
    required this.color,
  }) : super(key: key);

  final DetailsTicketController controller;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: Get.height * 0.63,
            margin:
            EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
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
                          decoration: BoxDecoration(
                              color: color??Colors.black,
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
                              ticketInformation['ticket_status']!="مرفوضة"?Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.dialog(Center(
                                        child: Container(
                                          padding: EdgeInsets.all(15.r),
                                          width: Get.width,
                                          height: Get.height / 2.5,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(
                                                15.r),
                                          ),
                                          child: Column(
                                            children: [
                                              MaterialText(
                                                text:
                                                'إضافة رد على التذكرة',
                                                color: mainColor,
                                                fontSize: 20.sp,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                              SizedBox(height: 25.h,),

                                              Expanded(
                                                flex: 5,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Color(
                                                          0xffF3F3F3),
                                                      borderRadius: BorderRadius
                                                          .only(
                                                          bottomRight: Radius
                                                              .circular(
                                                              15.r),
                                                          bottomLeft: Radius
                                                              .circular(
                                                              15.r)),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: colorShadowSearch
                                                                .withOpacity(
                                                                .65),
                                                            blurRadius:
                                                            10,
                                                            offset:
                                                            Offset(0,
                                                                4)),
                                                      ]),
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                          child: Card(
                                                            shadowColor: Colors
                                                                .transparent,
                                                            margin: EdgeInsets
                                                                .zero,
                                                            elevation: 0.0,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                              children: [
                                                                IconButton(
                                                                    onPressed:
                                                                        () {},
                                                                    icon: Icon(
                                                                        Icons
                                                                            .delete_forever_outlined)),
                                                                IconButton(
                                                                    onPressed:
                                                                        () {},
                                                                    icon: Icon(
                                                                        Icons
                                                                            .attach_file_outlined)),
                                                                IconButton(
                                                                    onPressed:
                                                                        () {},
                                                                    icon: Icon(
                                                                        Icons
                                                                            .camera_alt_outlined)),
                                                              ],
                                                            ),
                                                          )),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Card(
                                                          shadowColor: Colors
                                                              .transparent,
                                                          elevation: 0.0,
                                                          color: Colors
                                                              .transparent,
                                                          child: Padding(
                                                            padding:
                                                            EdgeInsets
                                                                .all(10
                                                                .r),
                                                            child:
                                                            TextFormField(
                                                              maxLines: 3,
                                                              textDirection:
                                                              TextDirection
                                                                  .rtl,
                                                              decoration:
                                                              InputDecoration(
                                                                border: InputBorder
                                                                    .none,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 15.h,),
                                              Expanded(
                                                child:
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.back();
                                                    showCustomDialog(
                                                        text: 'تم إضافة رد على التذكرة'
                                                    );
                                                    Timer(Duration(
                                                        seconds: 1),
                                                            (){
                                                          Get.back();
                                                        });
                                                  },
                                                  child:
                                                  Container(
                                                    alignment:
                                                    Alignment
                                                        .center,
                                                    width: 206.w,
                                                    height: 60.h,
                                                    decoration: BoxDecoration(
                                                        color:
                                                        mainColor,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            50.r)),
                                                    child:
                                                    MaterialText(
                                                      text:
                                                      'ارسال',
                                                      fontWeight:
                                                      FontWeight
                                                          .bold,
                                                      fontSize:
                                                      15.sp,
                                                      color: Colors
                                                          .white,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(50.0),
                                          border: Border.all(
                                              color: mainColor)),
                                      child: Text(
                                        'إضافة رد',
                                        style: TextStyle(fontSize: 10.sp),
                                      ),
                                    ),
                                  )
                                ],
                              ):SizedBox(),
                              Text(
                                'بيانات التذكرة',
                                style: TextStyle(
                                    color: mainColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Wrap(
                                        children: [
                                          Text(
                                            'رقم  التذكرة: ',
                                            style: TextStyle(
                                                color: mainColor,
                                                fontWeight: FontWeight
                                                    .bold,
                                                fontSize: 15.sp),
                                          ),
                                          Text(
                                            '${ticketInformation['ticket_id']}',
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
                                      flex: 2,
                                      child: Wrap(
                                        children: [
                                          Text(
                                            'تاريخ التذكرة: ',
                                            style: TextStyle(
                                                color: mainColor,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 15.sp),
                                          ),
                                          Text(
                                            '${intl.DateFormat.yMEd()
                                                .add_jms()
                                                .format(
                                                ticketInformation['ticket_date'])}',
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
                                  Wrap(
                                    children: [
                                      Text(
                                        'الجهة/القسم : ',
                                        style: TextStyle(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp),
                                      ),
                                      Text(
                                        '${ticketInformation['ticket_target']}',
                                        style: TextStyle(
                                            color: mainColor,
                                            height: 1.5),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Wrap(
                                    children: [
                                      Text(
                                        'الحالة: ',
                                        style: TextStyle(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp),
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 6.r,
                                            backgroundColor: color,
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            '${ticketInformation['ticket_status']}',
                                            style: TextStyle(
                                              color: color,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Wrap(
                                    children: [
                                      Text(
                                        'حالة الأهمية : ',
                                        style: TextStyle(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp),
                                      ),
                                      Text(
                                        '${ticketInformation['ticket_priority']}',
                                        style: TextStyle(
                                            color: mainColor,
                                            height: 1.5),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Wrap(
                                    children: [
                                      Text(
                                        'المبنى : ',
                                        style: TextStyle(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp),
                                      ),
                                      Text(
                                        '${ticketInformation['ticket_building']}',
                                        style: TextStyle(
                                            color: mainColor,
                                            height: 1.5),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Wrap(
                                    children: [
                                      Text(
                                        'الطابق : ',
                                        style: TextStyle(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp),
                                      ),
                                      Text(
                                        '${ticketInformation['ticket_floor']}',
                                        style: TextStyle(
                                            color: mainColor,
                                            height: 1.5),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Wrap(
                                    children: [
                                      Text(
                                        'نوع الغرفة : ',
                                        style: TextStyle(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp),
                                      ),
                                      Text(
                                        '${ticketInformation['ticket_room_type']}',
                                        style: TextStyle(
                                            color: mainColor,
                                            height: 1.5),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Wrap(
                                    children: [
                                      Text(
                                        'رقم  الغرفة : ',
                                        style: TextStyle(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp),
                                      ),
                                      Text(
                                        '${ticketInformation['ticket_room_number']}',
                                        style: TextStyle(
                                            color: mainColor,
                                            height: 1.5),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Wrap(
                                    children: [
                                      Text(
                                        'رقم الجوال : ',
                                        style: TextStyle(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp),
                                      ),
                                      Text(
                                        '${ticketInformation['ticket_phone_number']}',
                                        style: TextStyle(
                                            color: mainColor,
                                            height: 1.5),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'وصف المشكلة : ',
                                    style: TextStyle(
                                        color: mainColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp),
                                  ),
                                  Container(
                                    alignment:
                                    AlignmentDirectional.center,
                                    padding: EdgeInsets.all(12.r),
                                    decoration: BoxDecoration(
                                        color: Color(0xffF3F3F3),
                                        borderRadius:
                                        BorderRadius.circular(15.r)),
                                    child: Text(
                                      '${ticketInformation['ticket_problem_description']}',
                                      style: TextStyle(
                                          color: mainColor, height: 1.5),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ],
                );
              },
            ),
          ),
          //هنا يجب أنا تشيك إذا كانت مرفوضة بس يطلع له سبب الرفض واذا كانت غير شي يطلع له الردود
          //ticketInformation['ticket_status']!="مرفوضة"?
          ListView.builder(
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (ctx, index) {
              return Slidable(
                child: Container(
                  margin:
                  EdgeInsets.symmetric(vertical: 11.h, horizontal: 11.w),
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Color(0xffF3F3F3),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Wrap(
                                children: [
                                  Text(
                                    '${intl.DateFormat.yMMMMd()
                                        .add_jms()
                                        .format(DateTime.now())}',
                                    style: TextStyle(
                                        fontSize: 9.sp,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    ' | من قسم',
                                    style: TextStyle(
                                        fontSize: 9.sp,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    ' الصيانة ',
                                    style: TextStyle(
                                        fontSize: 9.sp,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    ' | الحالة',
                                    style: TextStyle(
                                        fontSize: 9.sp,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    ' مغلقة ',
                                    style: TextStyle(
                                        fontSize: 9.sp,
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                'نسعد بتواصلكم معنا عبر التذاكر الالكترونية',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: mainColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'يرجى إنشاء تذكرة طلب صيانة للمستلزمات التعلمية  من ايقونة انشاء بلاغ جديد ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff28A2CF),
                                    fontSize: 8.sp),
                              ),
                              Text(
                                'نسعى لخدمتكم دوماً',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff28A2CF),
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'وحدة خدمة الصيانةً',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xff28A2CF),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Expanded(
                        child: Column(
                          children: [
                            SvgPicture.asset('images/user-circle.svg'),
                            Text(
                              'أحمد بن عفيف',
                              style: TextStyle(
                                  color: mainColor,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                startActionPane: ActionPane(
                  // A motion is a widget used to control how the pane animates.
                  motion: const ScrollMotion(),

                  // A pane can dismiss the Slidable.

                  // All actions are defined in the children parameter.
                  children: const [
                    // A SlidableAction can have an icon and/or a label.
                    SlidableAction(
                      backgroundColor: Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                      onPressed:null,
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class ReportsLogPage extends StatelessWidget {
  final Color? color;

  const ReportsLogPage({Key? key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allreports.length,
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () {
            Get.to(()=>DetailsTicketScreen(color:  statusReport[index]['name'][1],));
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
                          height: constrains.maxWidth/1.8,
                          decoration: BoxDecoration(
                              color: allreports[index]['report_status']
                              [0] !=
                                  statusReport[index]['name']
                                  ? statusReport[index]['name'][1]
                                  : Colors.green,
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
                                            'رقم التذكرة: ',
                                            style: TextStyle(
                                                color: mainColor,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 15.sp),
                                          ),
                                          Text(
                                            '[${allreports[index]
                                            ['report_num']}]',
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
                                      flex: 2,
                                      child: Wrap(
                                        children: [
                                          Text(
                                            'التاريخ: ',
                                            style: TextStyle(
                                                color: mainColor,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 15.sp),
                                          ),
                                          Text(
                                            '${intl.DateFormat.yMEd().add_jm().format(allreports[index]['report_date_time'])}',
                                            style: TextStyle(
                                              height: 1.6,
                                                color: colorShadowSearch),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Wrap(
                                    children: [
                                      Text(
                                        'نوع الحركة: ',
                                        style: TextStyle(
                                            color: mainColor,
                                            fontWeight:
                                            FontWeight
                                                .bold,
                                            fontSize: 15.sp),
                                      ),
                                      Text(
                                        'إحالة لقسم الصيانة',
                                        style: TextStyle(
                                            color: mainColor,
                                            height: 1.5),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                             index.isEven? Row(
                                children: [
                                  Wrap(
                                    direction: Axis.vertical,
                                    children: [
                                      Text(
                                        'الوصف: ',
                                        style: TextStyle(
                                            color: mainColor,
                                            fontWeight:
                                            FontWeight
                                                .bold,
                                            fontSize: 15.sp),
                                      ),
                                      Container(
                                        alignment:
                                        AlignmentDirectional.center,
                                        padding: EdgeInsets.all(12.r),
                                        decoration: BoxDecoration(
                                            color: Color(0xffF3F3F3),
                                            borderRadius:
                                            BorderRadius.circular(15.r)),
                                        child: Text(
                                          '${ticketInformation['ticket_problem_description']}',
                                          style: TextStyle(
                                              color: mainColor, height: 1.5),
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ):SizedBox(),
                              Row(
                                children: [
                                  Wrap(
                                    children: [
                                      Text(
                                        'مدخل التقرير: ',
                                        style: TextStyle(
                                            color: mainColor,
                                            fontWeight:
                                            FontWeight
                                                .bold,
                                            fontSize: 15.sp),
                                      ),
                                      Text(
                                        'عبدالله الزهراني',
                                        style: TextStyle(
                                            color: mainColor,
                                            height: 1.5),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                            ],
                          ),
                        )),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}


