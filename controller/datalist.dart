import 'dart:async';

import 'package:api_call/modal/data.dart';

class DataListBloc {
  List<DataModal> dataList = [];

  // Sending value to Stream
  final StreamController<List<DataModal>?> _DataListController =
      StreamController<List<DataModal>?>();

  // Expose value to StreamBuilder
  Stream<List<DataModal>?> get DataListStream => _DataListController.stream;

  incrementDataList(List<DataModal>? value) {
    dataList.addAll(value!);
    print(dataList.length);
    _DataListController.sink.add(dataList);
  }

  // clearList() {
  //   DataList = [];
  // _DataListController.sink.add(DataList);
  // }

  void dispose() {
    _DataListController.close();
  }
}
