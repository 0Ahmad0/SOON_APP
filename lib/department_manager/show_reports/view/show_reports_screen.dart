import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roofa/department_manager/show_reports/controller/show_reports_controller.dart';
import 'package:select_dialog/select_dialog.dart';

import '../../../Customer/details_problem/controller/details_problem_controller.dart';
import '../../../Customer/supervise_reports/controller/supervise_controller.dart';
import '../../../const/const_color.dart';
import '../../../const/text_app.dart';

class ShowReportsDMScreen extends StatelessWidget {
  final controller = Get.put(ShowReportsDMController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'عرض التقارير',
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: Get.width / 2,
              child: Text(
                  'قم بإختيار الشهر والمقر لتحميل التقرير',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: grayColor
              ),
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
                  itemCount: showReportsList.length,
                  itemBuilder: (context, index) {
                    List c = showReportsList[index]['type_sort_name']
                    ['type_sort_value'];
                    return GetBuilder<ShowReportsDMController>(
                      builder: (_) {
                        return  ListTile(
                          textColor: mainColor,
                          trailing: Icon(
                              Icons.keyboard_arrow_down,color: mainColor,
                          size: 25.sp,),
                          title: Text(
                            '${showReportsList[index]['type_sort_name']['name']}',
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
            GestureDetector(
              onTap: (){
                Get.toNamed('/DM_report_screen');
              },
              child: Container(
                alignment: AlignmentDirectional.center,
                margin: EdgeInsets.all(Get.width / 10.w),
                height: Get.width / 5.w,
                decoration: BoxDecoration(
                    color: mainColor,
                  borderRadius: BorderRadius.circular(
                    40.r
                  ),
                ),
                child: Text('عرض التقارير',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp

                ),)

              ),
            )

          ],
        ),
      ),
    );
  }
}
