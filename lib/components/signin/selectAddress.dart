import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_link/components/signin/addAddress.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/core/data/search_place_repository.dart';
import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/helper/app_helper.dart';
import 'package:we_link/models/address/my_address_response.dart';

class SearchAddressScreen extends StatefulWidget {
  SearchAddressScreen({Key? key, this.keyword}) : super(key: key);
  String? keyword;

  @override
  State<SearchAddressScreen> createState() => _SearchAddressScreenState();
}

class _SearchAddressScreenState
    extends AppState<SearchAddressScreen, SearchAddressVieModel> {
  UnfocusDisposition disposition = UnfocusDisposition.scope;
  FocusNode focusSearch = new FocusNode();

  var _searchview = TextEditingController()..text = '';

  @override
  void dispose() {
    super.dispose();
    focusSearch.dispose();
  }

  @override
  SearchAddressVieModel initViewModel(SearchAddressVieModel viewModel) {
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, SearchAddressVieModel viewModel) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
            backgroundColor: blackColor,
            automaticallyImplyLeading: false,
            elevation: 0,
            centerTitle: false,
            leading: Container(
              margin: EdgeInsets.only(left: 5),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    primaryFocus!.unfocus(disposition: disposition);
                  });
                  widget.keyword == 'searchAddress'
                      ? Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SearchAddressScreen()),
                          ModalRoute.withName('/'))
                      : Navigator.pop(context);
                },
                icon: Image.asset('assets/images/goBack.png'),
              ),
            ),
            title: Container(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                      height: 43,
                      child: TextFormField(
                        autofocus: false,
                        focusNode: focusSearch,
                        controller: _searchview,
                        onFieldSubmitted: (text){
                          if (text.isEmpty) {
                            viewModel.clearAddress();
                          } else if (text.length > 2) {
                            widget.keyword = text;
                            viewModel.searchAddress(text);
                          }
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Select Address',
                          fillColor: Colors.white,
                          filled: true,
                          hintStyle: hintTextStyle,
                          contentPadding: fieldPadding,
                          enabledBorder: searchBoder,
                          focusedBorder: searchBoder,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: _searchview.text.isNotEmpty
                                ? Image.asset(
                                    'assets/images/loca4.png',
                                    fit: BoxFit.contain,
                                    height: 10,
                                    width: 10,
                                  )
                                : Image.asset(
                                    'assets/images/loca5.png',
                                    fit: BoxFit.contain,
                                    height: 10,
                                    width: 10,
                                  ),
                          ),
                          suffixIcon: _searchview.text.isNotEmpty
                              ? GestureDetector(
                                  child: Padding(
                                    padding: const EdgeInsets.all(13.0),
                                    child: Image.asset(
                                      'assets/images/close.png',
                                      fit: BoxFit.contain,
                                      height: 10,
                                      width: 10,
                                    ),
                                  ),
                                  onTap: () {
                                    _searchview.clear();
                                    viewModel.clearAddress();
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                  },
                                )
                              : null,
                        ),
                      )),
                )
              ],
            )),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                    child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Obx(() => Column(
                        children: [
                          for (var i = 0; i < viewModel.addressList.length; i++)
                            Column(children: [
                              GestureDetector(
                                onTap: () async {
                                  // await Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           AddNewAddressScreen(
                                  //               keyword: widget.keyword,
                                  //               currentAddress:
                                  //                   viewModel.addressList[i])),
                                  // );

                                  Navigator.of(context).pop(
                                      AddNewAddressArguments(
                                          keyword:
                                              viewModel.addressList[i].name,
                                          currentAddress:
                                              viewModel.addressList[i]));
                                },
                                child: Container(
                                  margin: EdgeInsets.all(10),
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
                                              child: Text.rich(
                                                TextSpan(
                                                  text: viewModel
                                                      .addressList[i].name,
                                                  // text: "Grens Greecas",
                                                  style: TextStyle(
                                                      color: Color(0xFF212B32),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: 'Kanit'),
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Container(
                                              child: Text.rich(
                                                TextSpan(
                                                  text: viewModel
                                                      .addressList[i].address,
                                                  style: TextStyle(
                                                      color: Color(0xFF979797),
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Kanit'),
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Divider(
                                color: Color(0xFFEEEEEE),
                                thickness: 1,
                              ),
                              SizedBox(width: 10),
                            ]),
                        ],
                      )),
                )),
              ),
              // twoButtonBackground(searchAddress: widget.searchAddress)
            ],
          ),
        ));
  }
}

class SearchAddressVieModel extends GetxController {
  var addressList = <AddressResponse>[].obs;

  SearchPlaceRepository searchPlaceRepository;

  LatLng? location;

  SearchAddressVieModel(this.searchPlaceRepository);

  @override
  void onInit() {
    super.onInit();
    getMyLocation().then((value){
      location = value;
    });
  }

  Future searchAddress(
    String keyword,
  ) async {
    addressList.clear();

    var response = await searchPlaceRepository.searchByPlace(
      keyword,
      LatLng(location?.latitude ?? 0, location?.longitude ?? 0),
    );

    addressList.addAll(response);
  }

  void clearAddress() {
    addressList.clear();
  }
}
