import 'package:get/get.dart';

class ResultSearchViewModel extends GetxController {

  var filterList = <FilterSearchItem>[].obs;

  @override
  void onInit() {
    super.onInit();

    filterList.add(FilterSearchItem(label: 'Reccomend',checked: true));
    filterList.add(FilterSearchItem(label: 'Price Range',));
    filterList.add(FilterSearchItem(label: 'All Filter',));
  }
}

class FilterSearchItem {
  String label;
  bool checked;

  FilterSearchItem({
    required this.label,
    this.checked = false,
  });
}
