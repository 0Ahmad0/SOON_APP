import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' as intl;
import '../../../const/text_app.dart';

import '../../../const/const_color.dart';

class AddChangesTReport extends StatelessWidget {
  final controller = Get.put(AddChangesController());
  var deviceName = TextEditingController();
  var deviceType = TextEditingController();
  var deviceSerialNumber = TextEditingController();
  var report = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              'إضافة تركيبات وتبديلات'
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.all(5.r),
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
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
                    child: Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                              onTap: () {
                                controller.onClickButton(0);
                                controller.controllerPageView!.animateToPage(0,
                                    duration: Duration(milliseconds: 800),
                                    curve: Curves.decelerate);
                              },
                              child: AnimatedContainer(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: controller.index.value == 0
                                        ? mainColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(50.r)),
                                child: Text(
                                  'تعبئة التقرير',
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
                                controller.controllerPageView!.animateToPage(1,
                                    duration: Duration(milliseconds: 800),
                                    curve: Curves.decelerate);
                              },
                              child: AnimatedContainer(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: controller.index.value == 1
                                        ? mainColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(50.r)),
                                child: Text(
                                  'عرض التقرير',
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
              ],
            )),
            Expanded(
              child: PageView(
                controller: controller.controllerPageView,
                onPageChanged: (index){
                  controller.index.value = index;
                },
                children: [
                  ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 12.r,
                            right: 12.r,
                            top: 12.r,
                            bottom: 5.r
                        ),
                        child: Row(
                          children: [
                            Text('رقم التذكرة',style: TextStyle(
                                color: mainColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                      ),
                      Container(
                        margin:  EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                            boxShadow:[
                              BoxShadow(
                                  color: colorShadowSearch.withOpacity(.26),
                                  offset: Offset(0,4),
                                  blurRadius: 10.0
                              )
                            ]
                        ),
                        child: TextFormField(
                          readOnly: true,
                          autofocus: true,
                          // controller: ticketNum,
                          decoration: InputDecoration(
                              fillColor: Color(0xffF3F3F3),
                              filled: true,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: '[7AEE00CVF]'
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 12.r,
                            right: 12.r,

                            bottom: 5.r
                        ),
                        child: Row(
                          children: [
                            Text('نوع الإضافة',style: TextStyle(
                                color: mainColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                      ),
                      Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              padding: EdgeInsets.all(5.r),
                              margin: EdgeInsets.symmetric(horizontal: 20.w),
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
                              child: Row(
                                children: [
                                  Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.onClickButton2(0);
                                          controller.typeAdd.value = 'تركيبات';
                                          print(controller.typeAdd.value);
                                        },
                                        child: AnimatedContainer(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: controller.index2.value == 0
                                                  ? mainColor
                                                  : Colors.white,
                                              borderRadius: BorderRadius.circular(50.r)),
                                          child: Text(
                                            'تركيبات',
                                            style: TextStyle(
                                              color: controller.index2.value == 0
                                                  ? controller.textButtonActive2
                                                  : mainColor,
                                            ),
                                          ),
                                          duration: Duration(milliseconds: 800),
                                        ),
                                      )),
                                  Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.onClickButton2(1);
                                          controller.typeAdd.value = 'تبديلات';
                                          print(controller.typeAdd.value);
                                        },
                                        child: AnimatedContainer(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: controller.index2.value == 1
                                                  ? mainColor
                                                  : Colors.white,
                                              borderRadius: BorderRadius.circular(50.r)),
                                          child: Text(
                                            'تبديلات',
                                            style: TextStyle(
                                              color: controller.index2.value == 1
                                                  ? controller.textButtonActive2
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
                        ],
                      )),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 12.r,
                            right: 12.r,
                            top: 12.r,
                            bottom: 5.r
                        ),
                        child: Row(
                          children: [
                            Text('نوع الجهاز',style: TextStyle(
                                color: mainColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                      ),
                      Container(
                        margin:  EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                            boxShadow:[
                              BoxShadow(
                                  color: colorShadowSearch.withOpacity(.26),
                                  offset: Offset(0,4),
                                  blurRadius: 10.0
                              )
                            ]
                        ),
                        child: TextFormField(
                          autofocus: true,
                          controller: deviceType,
                          decoration: InputDecoration(
                            fillColor: Color(0xffF3F3F3),
                            filled: true,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 12.r,
                            right: 12.r,

                            bottom: 5.r
                        ),
                        child: Row(
                          children: [
                            Text('اسم الجهاز',style: TextStyle(
                                color: mainColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                      ),
                      Container(
                        margin:  EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                            boxShadow:[
                              BoxShadow(
                                  color: colorShadowSearch.withOpacity(.26),
                                  offset: Offset(0,4),
                                  blurRadius: 10.0
                              )
                            ]
                        ),
                        child: TextFormField(
                          autofocus: true,
                          controller: deviceName,
                          decoration: InputDecoration(
                            fillColor: Color(0xffF3F3F3),
                            filled: true,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 12.r,
                            right: 12.r,

                            bottom: 5.r
                        ),
                        child: Row(
                          children: [
                            Text('الرقم التسلسلي للجهاز',style: TextStyle(
                                color: mainColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                      ),
                      Container(
                        margin:  EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                            boxShadow:[
                              BoxShadow(
                                  color: colorShadowSearch.withOpacity(.26),
                                  offset: Offset(0,4),
                                  blurRadius: 10.0
                              )
                            ]
                        ),
                        child: TextFormField(
                          autofocus: true,
                          controller: deviceSerialNumber,
                          decoration: InputDecoration(
                            fillColor: Color(0xffF3F3F3),
                            filled: true,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15.r),
                        width: Get.width,
                        height: Get.height / 3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(15.r),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('التقرير',style: TextStyle(
                                    color: mainColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffF3F3F3),
                                    borderRadius:
                                    BorderRadius.only(
                                        bottomRight:
                                        Radius
                                            .circular(
                                            15.r),
                                        bottomLeft: Radius
                                            .circular(
                                            15.r)),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                          colorShadowSearch
                                              .withOpacity(
                                              .65),
                                          blurRadius: 10,
                                          offset:
                                          Offset(0, 4)),
                                    ]),
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Card(
                                          shadowColor:
                                          Colors.transparent,
                                          margin: EdgeInsets.zero,
                                          elevation: 0.0,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceAround,
                                            children: [
                                              IconButton(
                                                  onPressed:
                                                      () {},
                                                  icon: Icon(Icons
                                                      .delete_forever_outlined)),
                                              IconButton(
                                                  onPressed:
                                                      () {},
                                                  icon: Icon(Icons
                                                      .attach_file_outlined)),
                                              IconButton(
                                                  onPressed:
                                                      () {},
                                                  icon: Icon(Icons
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
                                          EdgeInsets.all(
                                              10.r),
                                          child:
                                          TextFormField(
                                            maxLines: 3,
                                            textDirection:
                                            TextDirection
                                                .rtl,
                                            decoration:
                                            InputDecoration(
                                              border:
                                              InputBorder
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
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8.r),
                          margin: EdgeInsets.symmetric(
                            horizontal: Get.width/5,
                            vertical: 15.h,
                          ),
                          decoration: BoxDecoration(
                            color:  mainColor,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Text('تأكيد',style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp
                          ),),
                        ),
                      )

                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: Get.width * 1.1,
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
                                          color: Colors.blue,
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
                                                        backgroundColor: Colors.blue,
                                                      ),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Text(
                                                        '${ticketInformation['ticket_status']}',
                                                        style: TextStyle(
                                                          color: Colors.blue,
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
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddChangesController extends GetxController{
  var index = 0.obs;
  var index2 = 0.obs;
  var typeAdd = 'تركيبات'.obs;
  Color buttonActive = mainColor;
  Color buttonActive2 = mainColor;
  Color textButtonActive = Colors.white;
  Color textButtonActive2 = Colors.white;

  PageController? controllerPageView;

  @override
  void onInit() {
    controllerPageView = PageController(
        initialPage: 0
    );
    super.onInit();
  }
  void onClickButton(val){
    index.value = val;
    print(index);
  }
  void onClickButton2(val){
    index2.value = val;
    print(index2);
  }

  var timeFrom = DateTime.now().obs;
  var timeTo = DateTime.now().obs;


  var technicalName = ''.obs;
  var  helperTechnical = ''.obs;

  var expectedTime = DateTime.now().obs;

  var dayTime = 0.obs;

  void changeDayTime(index){
    index == 0? dayTime.value =0:dayTime.value=1;
  }
}