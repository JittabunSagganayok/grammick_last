import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/base/base_module.dart';
import 'package:we_link/feature/booking/ui/cancel/booking_cancel_order_viewmodel.dart';
import 'package:we_link/feature/booking/ui/confirmation/booking_confirmation_viewmodel.dart';
import 'package:we_link/feature/booking/ui/summary/booking_summary_viewmodel.dart';
import 'package:we_link/feature/booking/ui/main/booking_viewmodel.dart';
import 'package:we_link/feature/booking/ui/table/booking_table_viewmodel.dart';

import '../domain/repository/booking_repository.dart';
import '../domain/usecase/booking_usecase.dart';
import '../ui/checkin/booking_checkin_viewmodel.dart';

class BookingModule extends BaseModule {
  @override
  void provideModule() {
    appModule.registerFactory(() => BookingViewModel(appModule.get()));
    appModule.registerFactory(() => BookingSummaryViewModel(appModule.get()));
    appModule.registerFactory(() => BookingCheckInViewModel());
    appModule.registerFactory(() => BookingConfirmationViewModel());
    appModule.registerFactory(() => BookingCancelOrderViewModel());
    appModule.registerFactory(() => BookingTableViewModel(appModule.get()));

    appModule.registerFactory(() => BookingRepositoryImpl(appModule.get()));
    appModule.registerFactory(() => BookingUseCase(appModule.get()));
  }
}
