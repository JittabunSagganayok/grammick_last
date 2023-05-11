import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/assistant/ui/assistant_confirm_order_viewmodel.dart';
import 'package:we_link/feature/assistant/ui/assistant_order_detail_viewmodel.dart';
import 'package:we_link/feature/assistant/ui/assistant_recipient_viewmodel.dart';
import 'package:we_link/feature/assistant/ui/we_assistant_viewmodel.dart';
import 'package:we_link/feature/base/base_module.dart';

class WeAssistantModule extends BaseModule {
  @override
  void provideModule() {
    appModule.registerFactory(() => WeAssistantViewModel(appModule.get()));
    appModule.registerFactory(() => AssistantRecipientViewModel(appModule.get()));
    appModule.registerFactory(() => AssistantOrderDetailViewModel(appModule.get()));
    appModule.registerFactory(() => AssistantConfirmOrderViewModel(appModule.get(),appModule.get(),appModule.get()));
  }
}
