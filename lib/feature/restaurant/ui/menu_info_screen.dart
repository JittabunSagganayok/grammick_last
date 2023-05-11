import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/we_service/restaurant/menu_category_response.dart';
import '../../../shared/button/app_button_bar.dart';
import '../../../shared/loading/loading_fullscreen.dart';
import '../../base/base_we_state.dart';
import 'menu_info_viewmodel.dart';
import 'restaurant_detail_viewmodel.dart';

class MenuDetailArguments {
  MenuData? itemMenu;
  MenuCategoryDetailData? menuCategory;

  MenuDetailArguments({
    this.itemMenu,
    this.menuCategory,
  });
}

class MenuInfoScreen extends StatefulWidget {
  @override
  State<MenuInfoScreen> createState() => _MenuInfoScreenState();
}

class _MenuInfoScreenState extends AppState<MenuInfoScreen, MenuInfoViewModel> {
  @override
  MenuInfoViewModel initViewModel(MenuInfoViewModel viewModel) {
    if (Get.arguments is MenuDetailArguments) {
      viewModel.setArguments(Get.arguments);
    }

    viewModel.init();

    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, MenuInfoViewModel viewModel) {
    return Obx(() {
      if (viewModel.loading.isTrue) {
        return LoadingFullscreen();
      }

      return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: SvgPicture.asset('assets/icon_close_sheet.svg'),
                onPressed: () {
                  navigator?.pop();
                },
              ),
              toolbarHeight: 56,
              collapsedHeight: 56,
              expandedHeight: 256,
              flexibleSpace: ExtendedImage.network(
                viewModel.menuDetail!.image!,
                height: 280,
                fit: BoxFit.cover,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: viewModel.menuDetail?.name ?? '-',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Kanit',
                            ),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '${viewModel.menuDetail?.price ?? '-'} ฿',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Kanit',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          viewModel.menuDetail?.description ?? '-',
                          style: GoogleFonts.kanit(
                            color: const Color(0xff7A7A7A),
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Text(
                        viewModel.menuDetail?.price ?? '-',
                        style: GoogleFonts.kanit(
                          color: const Color(0xffD52E2F),
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  color: const Color(0xffF8F8F8),
                  height: 8,
                ),

                /// Optional Header
                ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  itemCount: viewModel.menuDetail!.menuOptionalData!.length,
                  shrinkWrap: true,
                  primary: false,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    color: Color(0xffF8F8F8),
                    height: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final options =
                        viewModel.menuDetail!.menuOptionalData![index];

                    return Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              options.name ?? '-',
                              style: GoogleFonts.kanit(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff132150),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              options.isMultiple!
                                  ? '( Choose more than 1 )'
                                  : '( 1 Choose )',
                              style: GoogleFonts.kanit(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xffCBCBCB),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              options.isNecessary! ? '( Require )' : '',
                              style: GoogleFonts.kanit(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xffCBCBCB),
                              ),
                            ),
                          ],
                        ),

                        /// Options List
                        ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          itemCount: options.optional!.length,
                          shrinkWrap: true,
                          primary: false,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(
                            color: Color(0xffF8F8F8),
                            height: 1,
                            indent: 16,
                            endIndent: 16,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            final itemOption = options.optional![index];

                            return ListTile(
                              onTap: () => viewModel.chooseOption(
                                menuOptionalData: options,
                                option: itemOption,
                              ),
                              leading: Container(
                                width: 24,
                                height: 24,
                                decoration: options.isMultiple!
                                    ? BoxDecoration(
                                        border: Border.all(
                                          color: const Color(
                                            0xffE1E1E1,
                                          ),
                                          width: 2,
                                        ),
                                      )
                                    : BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(
                                            0xffE1E1E1,
                                          ),
                                          width: 2,
                                        ),
                                      ),
                                child: Container(
                                  width: 12,
                                  margin: const EdgeInsets.all(4),
                                  height: 12,
                                  decoration: BoxDecoration(
                                    shape: options.isMultiple!
                                        ? BoxShape.rectangle
                                        : BoxShape.circle,
                                    color: itemOption.selected
                                        ? const Color(
                                            0xffFDCD03,
                                          )
                                        : null,
                                  ),
                                ),
                              ),
                              title: Text(
                                itemOption.name ?? '-',
                                style: GoogleFonts.kanit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xff000000),
                                ),
                              ),
                              trailing: Text(
                                '${itemOption.price ?? '-'} ฿',
                                style: GoogleFonts.kanit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),

                Container(
                  margin: const EdgeInsets.only(top: 16),
                  color: const Color(0xffF8F8F8),
                  height: 8,
                ),

                /// Note
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Advice to service providers',
                    style: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff132150)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: viewModel.noteController,
                    style: GoogleFonts.kanit(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        hintText: 'Ex : lorempsaki llaksdo sdkiow',
                        hintStyle: GoogleFonts.kanit(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xffBEBEBE)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xffFDCD03),
                              width: 1,
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xffC9C9C9)))),
                  ),
                ),
                const SizedBox(height: 64)
              ]),
            ),
          ],
        ),
        bottomNavigationBar: AppButtonBar.withLeftIcon(
          title: viewModel.getSumPriceText(),
          onClicked: () async {
            if (viewModel.quantity > 0) {
              Get.dialog(LoadingFullscreen(
                backgroundColor: Colors.black54,
              ));
              await viewModel.addItemToCartBooking();
              navigator?.pop(true);
              navigator?.pop(true);
            }
          },
          leadingWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Remove
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffF3F3F3),
                  ),
                  child: const Icon(Icons.remove),
                ),
                onPressed: () {
                  viewModel.removeQuantity();
                },
              ),

              /// Quantity
              SizedBox(
                width: 48,
                child: Text(
                  '${viewModel.quantity}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),

              /// Add
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffCEFFCD),
                  ),
                  child: const Icon(Icons.add),
                ),
                onPressed: () {
                  viewModel.addQuantity();
                },
              ),
              const SizedBox(
                width: 16,
              )
            ],
          ),
        ),
      );
    });
  }
}
