import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/import_stock/model_import_stock.dart';
// import 'package:easy_localization/easy_localization.dart';

class ImportStockPage extends StatefulWidget {
  @override
  State<ImportStockPage> createState() => _ImportStockPageState();
}

class _ImportStockPageState extends State<ImportStockPage> {
  ImportStock stockImport = ImportStock();
  FilePickerResult? resultPickedFileStock;
  PlatformFile? pickedFiles;
  String? filename;
  final TextEditingController _input_tudong = TextEditingController();
  final TextEditingController _input_dendong = TextEditingController();
  bool showloading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight(context),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: deviceWidth(context),
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 16),
                child: Text(
                  'Import File Excel Container Stock',
                  style: style_title_page,
                ),
              ),
              Divider(),
              Container(
                height: 350,
                width: 430,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 32, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Từ dòng',
                                style: style_text_detail,
                              ),
                              Container(
                                height: 50,
                                width: 200,
                                margin: EdgeInsets.only(top: 10),
                                child: TextField(
                                  controller: _input_tudong,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Đến dòng',
                                style: style_text_detail,
                              ),
                              Container(
                                height: 50,
                                width: 200,
                                margin: EdgeInsets.only(top: 10),
                                child: TextField(
                                  controller: _input_dendong,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    ImportFile(),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    pickedFiles == null
                        ? const SizedBox()
                        : InkWell(
                            onTap: () {
                              setState(() {
                                if ((_input_tudong.text != '') &&
                                    (_input_dendong.text != '')) {
                                  stockImport.UploadFileImport(
                                      _input_tudong.text,
                                      _input_dendong.text,
                                      pickedFiles!);
                                  showloading = true;
                                  print('not null');
                                } else {
                                  print('null');
                                }
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: haian,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Text(
                                'Import Excel',
                                style: style_text_button_detail,
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 30,
                    ),
                    showloading == true
                        ? const CircularProgressIndicator()
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future ImportExcelStock() async {
    try {
      resultPickedFileStock = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx', 'xls'],
        allowMultiple: false,
      );
      if (resultPickedFileStock != null) {
        setState(() {
          // change FilePickerResult to List<PlatformFile> to PlatformFile
          pickedFiles = resultPickedFileStock!.files.first;
          filename = pickedFiles!.name;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  ImportFile() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            ImportExcelStock();
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: haian, borderRadius: BorderRadius.circular(7)),
            child: Text(
              'Choose File',
              style: style_text_button_detail,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(filename ??= 'No file choose'),
      ],
    );
  }
}
