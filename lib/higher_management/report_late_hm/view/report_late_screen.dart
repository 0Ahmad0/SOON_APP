import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:roofa/const/const_color.dart';
import 'package:roofa/const/text_app.dart';
import 'package:roofa/higher_management/details_ticket/view/details_ticket.dart';
import 'package:roofa/higher_management/report_late_hm/controller/report_late_hm_controller.dart';
import 'package:roofa/widgets/dialog_date_time.dart';
import 'package:select_dialog/select_dialog.dart';
import 'package:intl/intl.dart' as intl;

class ReportLateHMScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text("البلاغات المتأخرة"),
            centerTitle: true,
            leading: Icon(Icons.arrow_back_ios),
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
                    left: 2,
                    top: 2,
                    child: CircleAvatar(
                      radius: 10.r,
                      backgroundColor: Colors.red,
                      child: Text(
                        '4',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.all(12.r),
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50.r),
                              boxShadow: [
                                BoxShadow(
                                    color:
                                    colorShadowSearch.withOpacity(.16),
                                    blurRadius: 10,
                                    offset: Offset(0, 9))
                              ]),
                          child: TextFormField(
                            cursorColor: mainColor,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.r),
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0),
                                ),
                                hintText: 'البحث برقم البلاغ',
                                hintStyle: TextStyle(color: mainColor),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: mainColor,
                                )),
                          ),
                        )),
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
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                decoration:
                BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: colorShadowSearch.withOpacity(.56),
                      blurRadius: 10,
                      offset: Offset(0, 4))
                ]),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: statusSort.length,
                  itemBuilder: (ctx,index){
                    List c = statusSort[index]['type_sort_name']
                    ['type_sort_value'];
                    return ListTile(
                      textColor: mainColor,
                      trailing: Icon(Icons.arrow_drop_down),
                      title: Text(
                        '${statusSort[index]['type_sort_name']['name']}',
                        style:
                        TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: (){
                        SelectDialog.showModal(
                          context,
                          label: 'hello',
                          selectedValue: 'lol',
                          items: c,
                          onChange: (selected) {
                          },
                        );
                      },

                    );
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: allreports.length,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(()=>DetailsTicketHMPage());
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
                                          color: colorpurple,
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
                                                        '${allreports[index]['report_num']}',
                                                        style: TextStyle(
                                                            color: mainColor,
                                                            height: 1.5),
                                                      ),
                                                    ],
                                                  )),
                                              Expanded(
                                                  child: Text(
                                                    '${intl.DateFormat.yMEd().add_jm().format(allreports[index]['report_date_time'])}',
                                                    style: TextStyle(
                                                        color: colorShadowSearch),
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
                                                        'الجهة: ',
                                                        style: TextStyle(
                                                            color: mainColor,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 15.sp),
                                                      ),
                                                      Text(
                                                        '${allreports[index]['report_sender']}',
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
                                                          '${allreports[index]['report_position']}',
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
                                                          '${allreports[index]['reporter_name']}',
                                                          style: TextStyle(
                                                              color: mainColor,
                                                              height: 1.5),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    CircleAvatar(
                                                        radius: 6.r,
                                                        backgroundColor: colorpurple
                                                    ),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    Text(
                                                      'متأخرة',
                                                      style: TextStyle(
                                                          color: colorpurple
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
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
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
