import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:roofa/Customer/connection_customer_services/controller/conection_customer_services_controller.dart';
import 'package:roofa/const/const_color.dart';

class ConectionCustomerServicesScreen extends StatelessWidget {
  final controller = Get.put(ConectionCustomerServiecsController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("التواصل مع خدمة العملاء"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
              Get.back();
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.home,
                  size: 30.r,
                ))
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(12.r),
                  width: Get.width,
                  height: 90.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: colorShadowSearch.withOpacity(.23),
                            blurRadius: 10,
                            offset: Offset(0,9)
                        )
                      ]
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex:4 ,
                          child: Row(
                            children: [ SvgPicture.asset('images/user-circle.svg'),
                              SizedBox(width: 12.w,),
                              Text('خالد بن عفيف',style: TextStyle(
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                              ),),],
                          )),
                      Expanded(child: IconButton(icon: Icon(Icons.call,color: Colors.grey,),onPressed: (){},),)
                    ],
                  ),
                ),
               Obx(
                   ()=> Expanded(
                     child: ListView.builder(
                       itemCount: controller.listMessages.length,
                       itemBuilder: (ctx,index){
                         return Directionality(
                           textDirection: index.isEven
                               ?TextDirection.rtl
                               :TextDirection.ltr,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(8.r),
                                   color: index.isOdd
                                       ?Color(0xffB3EFE1)
                                       :Color(0xffF3F3F3)
                                 ),
                                 padding: EdgeInsets.all(12.r),
                                 margin: EdgeInsets.only(
                                   left: index.isEven?35.w:0,
                                   right: !index.isEven?35.w:0,
                                   top: 8.r,
                                   bottom: 8.r
                                 ),
                                 child: Text('${controller.listMessages[index]}'),
                               ),
                             ],
                           ),
                         );
                       },
                       padding: EdgeInsets.all(34.r),
                     ),
                   )
               ),
                Padding(
                  padding:  EdgeInsets.all(20.r),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.r),
                      boxShadow: [
                        BoxShadow(
                          color: colorShadowSearch.withOpacity(.56),
                          blurRadius: 10,
                          offset: Offset(0,4)
                        )
                      ]
                    ),
                    child: TextFormField(
                      controller: controller.textEditingController,
                      onChanged: (val){
                        if(!val.isEmpty){
                          controller.message.value = val;
                        }else{

                        }
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 5.h
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(Icons.attach_file_rounded),
                          onPressed: (){},
                        ),
                        prefixIcon: IconButton(
                          icon: Icon(Icons.send_outlined),
                          onPressed: (){
                            controller.listMessages.add(controller.message.value);
                            controller.textEditingController.clear();
                            controller.message.value = '';
                          },
                        ),
                        hintText: 'اكتب هنا',
                        hintStyle: TextStyle(
                        color: Colors.grey
                        )
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
