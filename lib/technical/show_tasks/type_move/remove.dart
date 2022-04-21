import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' as intl;
import '../../../const/text_app.dart';

import '../../../const/const_color.dart';

class RemoveTReport extends StatelessWidget {
  final controller = Get.put(RemoveController());
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
             'إزالة / فك'
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

            Expanded(
              child:   ListView(
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
            )
          ],
        ),
      ),
    );
  }
}

class RemoveController extends GetxController{
  var index = 0.obs;
  Color buttonActive = mainColor;
  Color textButtonActive = Colors.white;

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