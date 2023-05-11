import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:we_link/components/home/homeComponents/appBarComponent.dart';
import 'package:we_link/components/home/homeComponents/article_detail_scren.dart';
import 'package:we_link/components/home/search.dart';
import 'package:we_link/components/home/searchAddress.dart';
import 'package:we_link/components/home/weLinkComponents/driveYourCar.dart';
import 'package:we_link/components/home/weLinkComponents/driveYourCarComponents/checkDetails.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/carPending.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/callCar/loadCallCar.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/confirmCallCar.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/confirmLocation.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/paymentCallCar.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLoComponents/promotion.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLoComponents/verhicle/verhicle.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLocation.dart';
import 'package:we_link/components/home/weLinkComponents/weRent.dart';
import 'package:we_link/components/home/weLinkComponents/weRentComponents/driveCarSelect.dart';
import 'package:we_link/components/home/weLinkComponents/weRentComponents/rentPackage.dart';
import 'package:we_link/components/home/weLinkToGo.dart';
import 'package:we_link/components/message/chat.dart';
import 'package:we_link/components/profile/contact.dart';
import 'package:we_link/components/profile/myWalletComponent/scanPayment.dart';
import 'package:we_link/components/profile/myWalletComponent/transfer.dart';
import 'package:we_link/components/profile/profileComponent/poflieMenu.dart';
import 'package:we_link/components/signin/addAddress.dart';
import 'package:we_link/components/signin/location.dart';
import 'package:we_link/components/signin/map.dart';
import 'package:we_link/components/signin/selectAddress.dart';
import 'package:we_link/core/domain/get_link_payment_usecase.dart';
import 'package:we_link/feature/address/di/address_module.dart';
import 'package:we_link/feature/advertise/module/advertise_module.dart';
import 'package:we_link/feature/assistant/module/assistant_module.dart';
import 'package:we_link/feature/booking/module/booking_module.dart';
import 'package:we_link/feature/favorite/module/my_favourite_module.dart';
import 'package:we_link/feature/hotel/di/hotel_module.dart';
import 'package:we_link/feature/order/module/choose_your_order_module.dart';
import 'package:we_link/feature/payment/module/payment_method_module.dart';
import 'package:we_link/feature/report_order/report_problem_screen.dart';
import 'package:we_link/feature/restaurant/module/restaurant_main_module.dart';
import 'package:we_link/feature/review/module/customer_review_module.dart';
import 'package:we_link/feature/search/module/search_hotel_module.dart';
import 'package:we_link/feature/service_reserve/module/service_reserve_module.dart';
import 'package:we_link/feature/term/module/term_module.dart';
import 'package:we_link/feature/we_service/di/we_service_module.dart';
import 'package:we_link/models/address/my_address_response.dart';
import 'package:we_link/views/auth/forgotPassword.dart';
import 'package:we_link/views/auth/introduction_screen.dart';
import 'package:we_link/views/auth/signin_screen.dart';
import 'package:we_link/views/auth/signup_screen.dart';
import 'package:we_link/views/auth/splash_screen.dart';
import 'package:we_link/views/auth/verify_otp_screen.dart';
import 'package:we_link/views/chat/message_viewmodel.dart';
import 'package:we_link/views/content/web_content_screen.dart';
import 'package:we_link/views/home_screen.dart';
import 'package:we_link/views/main_screen.dart';
import 'package:we_link/views/my_activity_screen.dart';
import 'package:we_link/views/my_profile_screen.dart';

import '../components/activity/bookComponent/myBooking.dart';
import '../components/home/weLinkComponents/rideComponents/callCar/review.dart';
import '../components/profile/myWalletComponent/qr_payment.dart';
import '../components/profile/myWalletComponent/receipt.dart';
import '../core/api/api_manager.dart';
import '../core/data/search_place_repository.dart';
import '../models/profile/user_profile_response.dart';
import '../models/we_ride/create_we_ride_order_response.dart';
import '../views/account-management/account_management_screen.dart';
import '../views/auth/createProfile.dart';
import '../views/auth/term_cond_screen.dart';

var appModule = GetIt.instance;
var appStorage = appModule.get<GetStorage>();

Socket? socket;
OrderDetail? weRideOrderResponse;
String? driverRoom;
LatLng? driverLocation;
AddressResponse? homeAddress;

String? paymentTransactionId;
Profile? userProfileTemp;

class AppModule {
  Future<void> provideModule() async {
    appModule.registerLazySingleton(() => GetStorage());

    var dio = ApiManager().initial();
    appModule.registerLazySingleton(() => dio);

    appModule
        .registerLazySingleton(() => SearchPlaceRepository(appModule.get()));

    appModule.registerFactory(() => MainViewModel(appModule.get()));
    appModule.registerFactory(() => IntroductionViewModel());
    appModule.registerFactory(() => ActivityReviewViewModel(appModule.get()));
    appModule.registerFactory(() => SignUpViewModel());
    appModule.registerFactory(() => VerifyOtpViewModel());
    appModule.registerFactory(() => SignInViewModel());
    appModule.registerFactory(() => CreateProfileViewModel());
    appModule.registerFactory(() => HomeViewModel(appModule.get()));
    appModule.registerFactory(() => ArticleDetailViewModel(appModule.get()));
    appModule.registerFactory(() => SplashViewModel(appModule.get()));
    appModule.registerFactory(() => MyProfileViewModel(appModule.get()));
    appModule.registerFactory(() => LocationViewModel());
    appModule.registerFactory(() => AppBarViewModel());
    appModule.registerFactory(() => SearchAddressVieModel(appModule.get()));
    appModule.registerFactory(() => AddNewAddressViewModel(appModule.get()));
    appModule.registerFactory(() => WeLinkToGoViewModel(appModule.get()));
    appModule.registerFactory(
        () => SearchLocationViewModel(appModule.get(), appModule.get()));
    appModule.registerFactory(() => ConfirmLocationViewModel(appModule.get()));
    appModule
        .registerFactory(() => GetCostByDistanceRepository(appModule.get()));

    appModule.registerFactory(() => TermConditionController(appModule.get()));
    appModule.registerFactory(() => PendingDriverAcceptViewModel(appModule.get()));
    appModule.registerFactory(() => ConfirmCarViewModel(appModule.get()));
    appModule.registerFactory(() => SelectVehicleViewModel(appModule.get(),appModule.get()));
    appModule.registerFactory(() => PaymentMethodViewModel(appModule.get()));
    appModule.registerFactory(() => WeRentViewModel(appModule.get()));
    appModule.registerFactory(() => RentPackageViewModel(appModule.get()));
    appModule.registerFactory(() => ConfirmWeRentViewModel(appModule.get(),appModule.get()));
    appModule.registerFactory(() => QrPaymentViewModel(appModule.get()));
    appModule.registerFactory(() => ScanPaymentViewModel());
    appModule.registerFactory(() => GetLinkPaymentUseCaseImpl(appModule.get()));
    appModule.registerFactory(() => HomeSearchViewModel(
          appModule.get(),
          appModule.get(),
        ));
    appModule.registerFactory(() => SelectAddressViewModel(
          appModule.get(),
          appModule.get(),
          appModule.get(),
        ));

    appModule.registerFactory(() => ChooseLocationByMapViewModel(
          appModule.get(),
          appModule.get(),
        ));
    appModule
        .registerFactory(() => PendingCarArrivedViewModel(appModule.get()));
    appModule.registerFactory(() => ReportOrderViewModel(appModule.get()));
    appModule.registerFactory(() => MyActivityViewModel(appModule.get()));
    appModule.registerFactory(() => DriveYourCarViewModel(appModule.get()));
    appModule.registerFactory(
        () => DriverYourCarDetailViewModel(appModule.get(), appModule.get(), appModule.get()));
    appModule.registerFactory(() => TransferViewModel(appModule.get()));
    appModule.registerFactory(() => ReceiptDetailViewModel(appModule.get()));
    appModule.registerFactory(() => MessageViewModel(appModule.get()));
    appModule.registerFactory(() => ChatListViewModel(appModule.get()));
    appModule.registerFactory(() => PromotionViewModel(appModule.get()));
    appModule.registerFactory(() => WebContentViewModel());
    appModule.registerFactory(() => ContactUsViewModel(appModule.get()));
    appModule.registerFactory(() => ProfileMenuViewModel(appModule.get()));
    appModule.registerFactory(() => ForgotPasswordViewModel(appModule.get()));
    appModule.registerFactory(() => AccountManagementViewModel());
    appModule.registerFactory(() => MyBookingViewModel(appModule.get()));

    WeServiceModule().provideModule();
    HotelModule().provideModule();
    BookingModule().provideModule();
    AdvertiseModule().provideModule();
    SearchHotelModule().provideModule();
    MyFavouriteModule().provideModule();
    CustomerReviewModule().provideModule();
    PaymentMethodModule().provideModule();
    RestaurantMainModule().provideModule();
    ChooseYourOrderModule().provideModule();
    TermModule().provideModule();
    ServiceReserveModule().provideModule();
    AddressModule().provideModule();
    WeAssistantModule().provideModule();
  }
}
