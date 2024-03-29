import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/page/signup/Wigdet/button_confirm.dart';
import 'package:web_booking/page/signup/Wigdet/company_information_wigdet.dart';
import 'package:web_booking/page/signup/Wigdet/condition_term_wigdet.dart';
import 'package:web_booking/page/signup/Wigdet/user_infor_widget.dart';

// ignore: must_be_immutable
class AccountPage extends StatelessWidget {
  final ScrollController horizontalScroll = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.fromLTRB(30, 20, 0, 30),
        decoration: BoxDecoration(
            color: contentColor, borderRadius: BorderRadius.circular(10)),
        width: 780,
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 60),
        child: Column(
          children: [
            UserInforWidget(),
            SizedBox(
              height: 30,
            ),
            CompanyInforWidget(),
            SizedBox(
              height: 30,
            ),
            ConditionTermWidget(),
            SizedBox(
              height: 30,
            ),
            ButtonConfirm(),
          ],
        ),
      ),
    );
  }
}
