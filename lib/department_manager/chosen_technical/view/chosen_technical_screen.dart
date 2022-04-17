import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roofa/department_manager/chosen_techinical_for_ticket/view/chosen_technical_for_ticket.dart';
import 'package:roofa/department_manager/chosen_technical/controller/chosen_technical_controller.dart';
import 'package:select_dialog/select_dialog.dart';

import '../../../const/const_color.dart';
import '../../../const/text_app.dart';
import '../../../widgets/dialog_date_time.dart';
import '../../home_page/view/home_page.dart';
import 'package:intl/intl.dart' as intl;

class ChosenTechnicalDMScreen extends StatelessWidget {
  final controller = Get.put(ChosenTechnicalDMController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("تعيين الفنيين"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.off(() => HomeScreenDM());
                },
                icon: Icon(
                  Icons.home,
                  size: 30.r,
                ))
          ],
        ),
        body: Column(
          children: [
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
                  padding: EdgeInsets.zero,
                  itemCount: chosenTechnicalSortDM.length,
                  itemBuilder: (context, index) {
                    List c = chosenTechnicalSortDM[index]['type_sort_name']
                    ['type_sort_value'];
                    return GetBuilder<ChosenTechnicalDMController>(
                      builder: (_) {
                        return  ListTile(
                          textColor: mainColor,
                          trailing: Icon(
                            Icons.keyboard_arrow_down,size: 25.r,),
                          title: Text(
                            '${chosenTechnicalSortDM[index]['type_sort_name']['name']}',
                            style:
                            TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onTap: (){
                            SelectDialog.showModal(
                              context,
                              label: "${controller.selectedText}",
                              selectedValue: '${controller.selectedText.value}',
                              items: c,
                              onChange: (selected) {
                                controller.selectedText.value = selected.toString();
                                controller.update();
                              },
                            );
                          },

                        );
                      },
                    );
                  },
                )),
            Expanded(
              child: ListView.builder(
                itemCount: ticketSelectionTechnical.length,
                itemBuilder: (_,index)=>GestureDetector(
                  onTap: (){
                    Get.to(()=>ChosenTechnicalForTicketDMScreen(
                      map: ticketSelectionTechnical[index],
                    ));
                  },
                  child: Container(
                    height: Get.width * 0.4,
                    margin: EdgeInsets.all(8.r),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: [
                        BoxShadow(
                          color: colorShadowSearch.withOpacity(.34),
                          offset: Offset(0,4),
                          blurRadius: 10
                        )
                      ]
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color:  ticketSelectionTechnical
                              [index]['report_status']
                                  ?Color(0xff30D852).withOpacity(.5)
                                :Color(0xffBFBFBF),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15.r),
                                bottomRight: Radius.circular(15.r),
                              )
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 18,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                   Row(
                                     children: [
                                       Text('رقم البلاغ : ',style: TextStyle(
                                           color: mainColor,
                                           fontSize: 15.sp,
                                           fontWeight: FontWeight.bold
                                       ),),
                                       Text('${ticketSelectionTechnical
                                       [index]['report_number']}',style: TextStyle(
                                           color: mainColor
                                       ),),
                                     ],
                                   ),
                                    Text('${
                                        intl.DateFormat
                                            .yMEd()
                                            .add_jm()
                                            .format(
                                            ticketSelectionTechnical
                                            [index]['report_date_time']
                                        )
                                    }',style: TextStyle(
                                      color: colorShadowSearch
                                    ),),
                                  ],
                                ),
                                Row(
                                  children: [
                                   Text('الجهة : ',style: TextStyle(
                                       color: mainColor,
                                       fontSize: 15.sp,
                                       fontWeight: FontWeight.bold
                                   ),),
                                   Text('${ticketSelectionTechnical
                                   [index]['report_target']}',style: TextStyle(
                                       color: mainColor
                                   ),),
                                  ],
                                ),
                                Row(
                                  children: [
                                   Text('المقر : ',style: TextStyle(
                                       color: mainColor,
                                       fontSize: 15.sp,
                                       fontWeight: FontWeight.bold
                                   ),),
                                   Text('${ticketSelectionTechnical
                                   [index]['report_position']}',style: TextStyle(
                                       color: mainColor
                                   ),),
                                  ],
                                ),
                                ticketSelectionTechnical
                                [index]['report_status']?
                                SizedBox() :
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        Get.to(()=>ChosenTechnicalForTicketDMScreen(
                                          map: ticketSelectionTechnical[index],
                                        ));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: Get.width * 0.35,
                                        height: Get.width* 0.1,
                                        decoration: BoxDecoration(
                                          color: mainColor,
                                          borderRadius: BorderRadius.circular(50.r),
                                        ),
                                        child: Text('تعيين فني',style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp
                                        ),),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
