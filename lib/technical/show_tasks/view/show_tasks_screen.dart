import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:roofa/customer/details_ticket/view/details_ticket.dart';
import 'package:roofa/technical/show_tasks/controller/show_task_controller.dart';
import 'package:select_dialog/select_dialog.dart';

import '../../../const/const_color.dart';
import '../../../const/text_app.dart';
import 'package:intl/intl.dart' as intl;

import '../../../widgets/dialog_date_time.dart';
import '../../ticket_details/view/ticket_details_screen.dart';

class ShowTasksTScreen extends StatelessWidget {
  final controller = Get.put(ShowTasksTController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text("عرض المهام"),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: (){
                Get.back();
              },
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
                  itemCount: statusSortTechnical.length,
                  itemBuilder: (ctx,index){
                    List c = statusSortTechnical[index]['type_sort_name']
                    ['type_sort_value'];
                    return ListTile(
                      textColor: mainColor,
                      trailing: Icon(Icons.arrow_drop_down),
                      title: Text(
                        '${statusSortTechnical[index]['type_sort_name']['name']}',
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
                  itemCount: allreportsTechnical.length,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(()=>DetailsTicketTScreen(
                          map: mapDetailsT,
                        ),transition: Transition.downToUp);
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Container(
                                  height: Get.width * 0.5,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
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
                                          Text(
                                            'إحالة إلى مركز الصيانة ',
                                            style: TextStyle(
                                                color: mainColor,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 15.sp),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              '${
                                              intl.DateFormat.yMd().
                                              add_j().format(
                                                  allreportsTechnical
                                                  [index]
                                                  ['report_date']
                                              )
                                                 }',
                                              style: TextStyle(
                                                  color: mainColor,
                                                  height: 1.5),
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor: Colors.grey,
                                                  radius:  5.r,
                                                ),
                                                Text('${
                                                allreportsTechnical[index]['report_status']
                                                }'),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text('رقم البلاغ : ',style: TextStyle(
                                                      color: mainColor,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15.sp
                                                    ),),
                                                    Text('${
                                                    allreportsTechnical[index]['report_number']
                                                    }',style: TextStyle(
                                                      color: mainColor
                                                    ),)
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text('الجهة : ',style: TextStyle(
                                                      color: mainColor,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15.sp
                                                    ),),
                                                    Text('${
                                                    allreportsTechnical
                                                    [index]
                                                    ['report_direction']
                                                    }',
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                      color: mainColor
                                                    ),)
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Text('الإنجاز من',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                color: Colors.grey
                                              ),),
                                              Row(
                                                children: [
                                                  Text('${
                                             intl.DateFormat.yMd().format( allreportsTechnical[index][
                                             'report_done_from'
                                             ])
                                                  }',
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 10.sp
                                                  ),),
                                                  Text('إلى',style: TextStyle(
                                                      color: Colors.grey
                                                  ),),
                                                  Text('${
                                                      intl.DateFormat.yMd().format( allreportsTechnical[index][
                                                      'report_done_to'
                                                      ])
                                                  }',style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 10.sp
                                                  ),),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'المقر : ',
                                            style: TextStyle(
                                                color: mainColor,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 15.sp),
                                          ),
                                          Text('${
                                              allreportsTechnical[index]
                                              ['report_position']
                                          }',style: TextStyle(
                                            color: mainColor
                                          ),)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'الفني المسؤول : ',
                                            style: TextStyle(
                                                color: mainColor,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 15.sp),
                                          ),
                                          Text('${
                                              allreportsTechnical[index]
                                              ['technical_name']
                                          }',style: TextStyle(
                                            color: mainColor
                                          ),)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'الفنيي المساعدين : ',
                                            style: TextStyle(
                                                color: mainColor,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 15.sp),
                                          ),
                                          Text('${
                                              allreportsTechnical[index]
                                              ['helper_technical_name']
                                          }',style: TextStyle(
                                            color: mainColor
                                          ),)
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ],
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
