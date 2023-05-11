import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/confirmCallCar.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/address/my_address_response.dart';
import 'package:we_link/models/distance/cost_by_distance_response.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';

class ConfirmLocationScreen extends StatefulWidget {
  ConfirmLocationScreen({
    Key? key,
    this.twoLoca,
    this.requiredText,
    required this.pickUpAddress,
    required this.destinationAddress,
    this.bookingAdvance,
  }) : super(key: key);

  final bool? twoLoca;
  final String? requiredText;
  final AddressResponse? pickUpAddress;
  List<AddressResponse> destinationAddress = [];
  DateTime? bookingAdvance;

  @override
  State<ConfirmLocationScreen> createState() => _ConfirmLocationScreenState();
}

class _ConfirmLocationScreenState
    extends AppState<ConfirmLocationScreen, ConfirmLocationViewModel> {
  GoogleMapController? mapController;
  bool show = true;
  var RequestToDriver;
  var notedText = TextEditingController();

  void requestToDriver(BuildContext context) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            constraints: maxHeightContain,
            decoration: requestDriverDecoration,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 24, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Image.asset(
                            'assets/images/Article.png',
                            fit: BoxFit.fill,
                            color: Colors.black,
                            height: 22,
                            width: 22,
                          ),
                        ),
                        Container(
                          child:
                              Text('Request to Driver', style: priceTotalText),
                        ),
                      ],
                    ),
                    SizedBox(height: 21),
                    Container(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        maxLines: 4,
                        style: requestDriverText,
                        controller: notedText,
                        decoration: InputDecoration(
                          counterText: '',
                          hintText:
                              'Write your request on an additional description...',
                          fillColor: Color(0xFFEEEEEE),
                          filled: true,
                          hintStyle: requestDriverTextHint,
                          enabledBorder: searchBoder,
                          focusedBorder: searchBoder,
                        ),
                      ),
                    ),
                    SizedBox(height: 21),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      child: OutlinedButton(
                        style: yellowButtonStyle,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Confirm',
                          style: selectsCarTextButton,
                        ),
                      ),
                    ),
                    SizedBox(height: 21),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _googleMap(BuildContext context) {
    return GoogleMap(
      zoomGesturesEnabled: true,
      myLocationButtonEnabled: false,
      initialCameraPosition: CameraPosition(
        target: viewModel.destinationLatLng,
        zoom: 16.2,
      ),
      markers: viewModel.markers,
      mapType: MapType.normal,
      onMapCreated: (controller) {
        setState(() {
          mapController = controller;
        });
      },
    );
  }

  @override
  ConfirmLocationViewModel initViewModel(ConfirmLocationViewModel viewModel) {
    viewModel.mappingLocationPickup(
      widget.pickUpAddress!,
      widget.destinationAddress,
      widget.bookingAdvance,
    );
    return viewModel;
  }

  @override
  Widget onCreateView(
      BuildContext context, ConfirmLocationViewModel viewModel) {
    return Obx(() {
      if (viewModel.loading.value) {
        return LoadingFullscreen();
      } else {
        return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              elevation: 0,
              shape: appbarBorder,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  child: Image.asset(
                    'assets/images/goback4.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                    child: Stack(
                  children: [_googleMap(context)],
                )),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Confirm location',
                        style: titleHomeText,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        itemCount: viewModel.destinationAddress?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          final item = viewModel.destinationAddress?[index];
                          return Container(
                              decoration: confirmLoDecoration,
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Container(
                                    child: Image.asset(
                                      'assets/images/loca2.png',
                                      fit: BoxFit.fill,
                                      height: 29,
                                      width: 19,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            item?.name ?? "",
                                            style: dataListTitleText,
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            item?.address ?? "",
                                            style: dataListSubTitleText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    child: Image.asset(
                                      'assets/images/check1.png',
                                      fit: BoxFit.fill,
                                      height: 18,
                                      width: 18,
                                    ),
                                  ),
                                ],
                              ));
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(
                          height: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          requestToDriver(context);
                        },
                        child: Container(
                          constraints: maxHeightContain,
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                          decoration: requestDecoration,
                          child: Text.rich(
                            TextSpan(
                                text: "Request to Driver",
                                style: requestDriTitleText,
                                children: [
                                  if (notedText.text.isNotEmpty) ...[
                                    TextSpan(
                                      text: " :  ",
                                      style: requestDriTitleText,
                                    ),
                                    TextSpan(
                                      text: notedText.text,
                                      style: requestDriSubTitleText,
                                    )
                                  ]
                                ]),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 1,
                        margin: EdgeInsets.symmetric(vertical: 16),
                        child: OutlinedButton(
                          style: yellowButtonStyle,
                          onPressed: () async {
                            var costByDistance = await viewModel.getCostByDistance();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ConfirmCallCarScreen(
                                  pickup: viewModel.pickUpAddress,
                                  destination: viewModel.destinationAddress ?? [],
                                  noted: notedText.text,
                                  bookingAdvance: viewModel.bookingAdvance,
                                  costByDistanceResponse: costByDistance,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Confirm',
                            style: selectsCarTextButton,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ));
      }
    });
  }
}

class ConfirmLocationViewModel extends GetxController {
  GetCostByDistanceRepository repository;

  ConfirmLocationViewModel(this.repository);

  var loading = false.obs;

  Set<Marker> markers = Set();

  LatLng destinationLatLng = LatLng(13.723704251848764, 100.50685786419545);

  AddressResponse? pickUpAddress;
  List<AddressResponse>? destinationAddress;
  DateTime? bookingAdvance;

  Future mappingLocationPickup(
    AddressResponse pickUpAddress,
    List<AddressResponse> destinationAddress,
    DateTime? bookingAdvance,
  ) async {
    loading.value = true;

    this.bookingAdvance = bookingAdvance;

    this.pickUpAddress = pickUpAddress;
    this.destinationAddress = destinationAddress;

    BitmapDescriptor markerstart = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/lo2.png",
    );

    destinationLatLng =
        LatLng(pickUpAddress?.lat ?? 0, pickUpAddress?.lng ?? 0);

    markers.add(Marker(
      markerId: MarkerId(pickUpAddress.toString()),
      position: LatLng(pickUpAddress?.lat ?? 0, pickUpAddress?.lng ?? 0),
      icon: markerstart,
    ));

    loading.value = false;
  }

  Future getCostByDistance() async => await repository.getCostByDistance(
      pickUpAddress ?? AddressResponse(), destinationAddress ?? []);
}

class DestinationLatLngModel {
  num lat;
  num lng;

  DestinationLatLngModel(this.lat, this.lng);
}

class GetCostByDistanceRepository {
  Dio dio;

  GetCostByDistanceRepository(this.dio);

  Future<CostByDistanceResponse> getCostByDistance(
    AddressResponse pickUpAddress,
    List<AddressResponse> destinationAddress,
  ) async {
    var destinationList = <DestinationLatLngModel>[];

    destinationAddress.forEach((element) {
      destinationList
          .add(DestinationLatLngModel(element.lat ?? 0, element.lng ?? 0));
    });

    var destinationToJson = jsonEncode(destinationAddress);

    var response = await dio.get('activities/distant/cost', queryParameters: {
      "customerPoint": "${pickUpAddress.lat ?? 0}, ${pickUpAddress.lng ?? 0}",
      "destinations": destinationToJson
    });

    return CostByDistanceResponse.fromJson(response.data);
  }
}
