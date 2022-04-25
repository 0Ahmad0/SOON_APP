import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roofa/customer_services/home_page/view/home_page.dart';
import 'package:select_dialog/select_dialog.dart';

import '../../../Firebase/firebase.dart';
import '../../../const/const_color.dart';
import '../../../const/text_app.dart';
import '../../../department_manager/home_page/view/home_page.dart';
import '../../../widgets/dialog_date_time.dart';
import '../../details_ticket/view/details_ticket_screen.dart';
import '../controller/new_report_controller.dart';
import 'package:intl/intl.dart' as intl;

class NewReportCSScreen extends StatefulWidget {
  @override
  State<NewReportCSScreen> createState() => _NewReportCSScreenState();
}

class _NewReportCSScreenState extends State<NewReportCSScreen> {
  final controller = Get.put(NewReportCSController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("البلاغات الجديدة"),
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
                  Get.off(() => HomeScreenCS());
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
                              onChanged: (val) {
                                controller.searchFilter = val;
                                controller.update();
                                setState(() {});
                              }
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
                    return GetBuilder<NewReportCSController>(
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
                                //controller.update();
                                //=======//
                                controller.headquartersFilter="";
                                controller.beneficiaryFilter="";
                                switch("${chosenTechnicalSortDM[index]['type_sort_name']['name']}"){
                                  case "فرز على حسب الجهة":
                                    controller.beneficiaryFilter=selected.toString();
                                    break;
                                  case "فرز على حسب المقر":
                                    controller.headquartersFilter=selected.toString();
                                    print(controller.headquartersFilter);
                                    break;
                                }
                                //await controller.fetchDataReportUser();
                                controller.update();
                                setState((){
                                });
                                //=======
                              },
                            );
                          },

                        );
                      },
                    );
                  },
                )),
            Expanded(
              child: FutureBuilder(
                  future: controller.fetchDataReportUser(),
                  builder: (context,snapShot) {
                    if (!snapShot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        itemCount: controller.listReport.length,
                        itemBuilder: (_,index)=>GestureDetector(
                          onTap: (){
                            Get.to(DetailsTicketCSScreen());
                          },
                          child: Container(
                            height: Get.width * 0.35,
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
                                        color: Colors.grey,
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                Text(
                                                  controller.listReport[index]["رقم البلاغ"],
                                                  //'${ticketForCustomerServices[index]['report_number']}'
                                                  style: TextStyle(
                                                    color: mainColor
                                                ),),
                                              ],
                                            ),
                                            Text(
                                                FirebaseController.formatTimestamp(controller.listReport[index]["Time"]),
                                              /*'${
                                                intl.DateFormat
                                                    .yMEd()
                                                    .add_jm()
                                                    .format(
                                                    ticketForCustomerServices
                                                    [index]['report_date_time']
                                                )}'*/
                                              style: TextStyle(
                                                color: colorShadowSearch,
                                                fontSize: 11,
                                            ),),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Row(
                                                children: [
                                                  Text('الجهة : ',style: TextStyle(
                                                      color: mainColor,
                                                      fontSize: 15.sp,
                                                      fontWeight: FontWeight.bold
                                                  ),),
                                                  Text(
                                                      controller.listReport[index]["الجهة المستفيدة"],
                                                    //'${ticketForCustomerServices[index]['report_target']}',
                                                    style: TextStyle(
                                                      color: mainColor
                                                  ),),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 5.r,
                                                    backgroundColor: Colors.grey,
                                                  ),
                                                  SizedBox(width: 5.w,),
                                                  Text('جديدة',style: TextStyle(
                                                      color: Colors.grey
                                                  ),)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text('المقر : ',style: TextStyle(
                                                color: mainColor,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold
                                            ),),
                                            Text(controller.listReport[index]["المقر"]
                                                //'${ticketForCustomerServices[index]['report_position']}'
                                              ,style: TextStyle(
                                                color: mainColor
                                            ),),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text('الاسم : ',style: TextStyle(
                                                color: mainColor,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold
                                            ),),
                                            Text('${controller.listReport
                                            [index]['الاسم']}',style: TextStyle(
                                                color: mainColor
                                            ),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
