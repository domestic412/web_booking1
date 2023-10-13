import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';

import 'package:web_booking/page/tracking/widgets/dropdownbox.dart';
import 'package:web_booking/widgets/appbar.dart';

import '../../widgets/footer.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

TextEditingController input = TextEditingController();
final ScrollController horizontalScroll = ScrollController();
double width_20 = 20;

class _TrackingPageState extends State<TrackingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomSheet: Footer(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              appbar(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 40),
                  decoration: BoxDecoration(
                      color: contentColor,
                      borderRadius: BorderRadius.circular(10)),
                  width: 1004,
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SelectableText(
                        'container tracking'.tr(),
                        style: style20_blue,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: normalColor,
                        height: 1,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DropdownButtonSearch(),
                            const SizedBox(width: 20),
                            Container(
                              height: 40,
                              width: 500,
                              child: TextField(
                                  controller: input,
                                  style: style15_black,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder())),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                // setState(() {
                                //     containerTracking = fetchContainerTracking(input.text.toUpperCase());
                                //     bool_data_container = false;
                                // });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: normalColor),
                                child: Text(
                                  'search'.tr(),
                                  style: style15_white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: SelectableText(
                          'note'.tr(),
                          style: style13_black,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // Data_Booking(updateDataContainer),
                      // Container(
                      //   child: bool_data_container ?  Data_Container() : null,
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//   Future<ContainerTracking> fetchContainerTracking(String inputt) async {
//   final url_bk_en = 'http://222.252.166.214:6505/api/Tracking?BookingNo=$inputt&CntrNo=';
//   final url_cntr_en = 'http://222.252.166.214:6505/api/Tracking?BookingNo=&CntrNo=$inputt';
//   // final url_bk = 'http://222.252.166.214:2602/TrackingContainer?CntrNo=&BookingNo=$inputt';
//   // final url_cntr = 'http://222.252.166.214:2602/TrackingContainer?CntrNo=$inputt&BookingNo=';
//   String? url;
//   if (selectedValue == 'bk') {
//     setState(() {
//       url = url_bk_en;
//     });
//   } else {
//     setState(() {
//       url = url_cntr_en;
//     });
//   }

//   final response = await http.get(
//     Uri.parse(url!),
//     headers: {
//       "Access-Control-Allow-Origin": "*",
//       "Access-Control-Allow-Methods": "GET", //use fot http, not use https
//     },
//   );

//   print(response.statusCode);

//   if (response.statusCode == 200) {
//     var body = response.body;
//     if (body == '[]') {
//       return throw Exception();
//     }
//     var dataCntrTracking = jsonDecode(body);
//     return ContainerTracking.fromJson(dataCntrTracking);
//   } else {
//     print('Error');
//     throw Exception('Error');
//   }
// }

  // void updateDataContainer() {
  //   setState(() {
  //     bool_data_container = true;
  //   });
  // }
}
