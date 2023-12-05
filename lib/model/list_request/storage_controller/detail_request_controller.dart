import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

final DataDetailRequestController dataDetailRequestController =
    Get.put(DataDetailRequestController());

class DataDetailRequestController extends GetxController {
  RxInt id = 0.obs;
  var tenYeuCau = ''.obs;
  var noiDung = ''.obs;
  var cntrno = ''.obs;
  var sizeType = ''.obs;
  var trangThaiYc = ''.obs;
  var noteHangTau = ''.obs;
  var updateTime = ''.obs;

  void updateDetailRequestController(
      {@required id,
      @required tenYeuCau,
      @required noiDung,
      @required cntrno,
      @required sizeType,
      @required trangThaiYc,
      @required noteHangTau,
      @required updateTime}) {
    this.id = id;
    this.tenYeuCau = tenYeuCau;
    this.noiDung = noiDung;
    this.cntrno = cntrno;
    this.sizeType = sizeType;
    this.trangThaiYc = trangThaiYc;
    this.noteHangTau = noteHangTau;
    this.updateTime = updateTime;
  }
}
