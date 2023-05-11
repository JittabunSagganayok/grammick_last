import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:we_link/di/app_module.dart';

abstract class AppState<Screen extends StatefulWidget,
T extends GetxController> extends State<Screen> {
  late T viewModel;

  T initViewModel(T viewModel);

  Widget onCreateView(BuildContext context, T viewModel);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
        init: initViewModel(appModule.get<T>()),
        builder: (viewModel) {
          this.viewModel = viewModel;
          return onCreateView(context, viewModel);
        });
  }
}
