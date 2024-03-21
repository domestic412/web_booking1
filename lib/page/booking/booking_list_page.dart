import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/utils.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/booking/model_booking_list.dart';
import 'package:web_booking/model/booking/storage_controller/booking_list_controller.dart';
import 'package:web_booking/model/list_user/storage_controller/user_controller.dart';
import 'package:web_booking/model/schedule/model_voyage.dart';
import 'package:web_booking/model/schedule/storage_controller/route_controller.dart';
import 'package:web_booking/page/booking/widgets/voyage_list.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';

class BookingListPage extends StatefulWidget {
  @override
  State<BookingListPage> createState() => _BookingListPageState();
}

class _BookingListPageState extends State<BookingListPage> {
  @override
  void initState() {
    super.initState();
    routeController.date_select.value.text =
        DateFormat('dd/MM/yyyy').format(DateTime.now());
    routeController.dateSelect.value =
        DateFormat('MM/dd/yyyy').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    DateTime? pickeddate1 = DateTime.now();
    DateTime? pickeddate2 = DateTime.now();

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              appbar(),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 40),
                decoration: BoxDecoration(
                    color: contentColor,
                    borderRadius: BorderRadius.circular(10)),
                width: 1004,
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Column(
                  children: [
                    SelectableText(
                      'Booking List',
                      style: style_title_page,
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 250,
                            child: TextField(
                              controller:
                                  bookingListController.fromDate_select.value,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text(
                                  'Từ ngày',
                                  style: TextStyle(fontSize: 14),
                                ),
                                icon: Icon(Icons.calendar_month),
                              ),
                              onTap: () async {
                                pickeddate1 = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2223));
                                if (pickeddate1 != null) {
                                  setState(() {
                                    bookingListController
                                            .fromDate_select.value.text =
                                        DateFormat('dd/MM/yyyy')
                                            .format(pickeddate1!);
                                    bookingListController.fromDate.value =
                                        DateFormat('MM/dd/yyyy')
                                            .format(pickeddate1!);
                                    // print(dateSelect);
                                  });
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            height: 50,
                            width: 220,
                            child: TextField(
                              controller:
                                  bookingListController.toDate_select.value,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text(
                                  'Đến ngày',
                                  style: TextStyle(fontSize: 14),
                                ),
                                // icon: Icon(Icons.calendar_month),
                              ),
                              onTap: () async {
                                pickeddate2 = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2223));
                                if (pickeddate2 != null) {
                                  setState(() {
                                    bookingListController
                                            .toDate_select.value.text =
                                        DateFormat('dd/MM/yyyy')
                                            .format(pickeddate2!);
                                    bookingListController.toDate.value =
                                        DateFormat('MM/dd/yyyy')
                                            .format(pickeddate2!);
                                    // print(dateSelect);
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 930,
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF09227e),
                              minimumSize: const Size(180, 45),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)))),
                          onPressed: () {
                            if (pickeddate1!.compareTo(pickeddate2!) > 0) {
                            } else {
                              BookingList().fetchBookingList(
                                  shipperId:
                                      inforUserController.shipperId.value,
                                  fromDate:
                                      bookingListController.fromDate.value,
                                  toDate: bookingListController.toDate.value);
                            }
                          },
                          child: Text(
                            'Search',
                            style: style_text_button_detail,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    VoyageList(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
