import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/feature/payment/ui/payment_method_viewmodel.dart';
import 'package:we_link/shared/appbar/we_app_bar.dart';
import 'package:we_link/shared/button/app_button_bar.dart';

import '../../../constant/stylesConstants.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState
    extends AppState<PaymentMethodScreen, PaymentMethodViewModel> {
  @override
  Widget onCreateView(BuildContext context, PaymentMethodViewModel viewModel) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      bottomNavigationBar: AppButtonBar(
        title: 'Confirm',
        backgroundColor: Colors.black,
        textColor: Colors.white,
        onClicked: () {},
      ),
      body: CustomScrollView(
        slivers: [
          WeAppBar(
              title: 'Payment method',
              showCloseIcon: true,
              onBackPressed: () {
                navigator?.pop();
              }),
          SliverFillRemaining(
            child: Obx(() => ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  itemCount: viewModel.paymentItem.length,
                  separatorBuilder: (BuildContext context, int index) => Divider(
                    height: 16,
                    color: Colors.transparent,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final item = viewModel.paymentItem[index];
                    final color = item.checked ? item.colorActive : item.colorDefault;
                    return InkWell(
                      onTap: () {
                        viewModel.setPaymentMethodSelected(item);
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: color,
                          boxShadow: [payMentShadow],
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: SvgPicture.asset(
                                item.icon,
                              ),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: appBackgroundColor,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      item.title,
                                      style: GoogleFonts.kanit(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Builder(builder: (context) {
                                      if (item.type ==
                                          PaymentMethodType.WALLET) {
                                        return Text(
                                          '${item.price ?? ""} THB',
                                          style: GoogleFonts.kanit(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff189B58),
                                          ),
                                        );
                                      } else if (item.type ==
                                          PaymentMethodType.CREDIT_CARD) {
                                        return Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/icon_visa.svg'),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            SvgPicture.asset(
                                                'assets/icon_mastercard.svg'),
                                          ],
                                        );
                                      } else {
                                        return SizedBox(
                                          height: 0,
                                        );
                                      }
                                    }),
                                  ],
                                ),
                              ),
                            ),
                            if (item.checked) ...[
                              Container(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 12,
                                ),
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff189B58),
                                ),
                              ),
                            ]
                          ],
                        ),
                      ),
                    );
                  },
                )),
          )
        ],
      ),
    );
  }

  @override
  PaymentMethodViewModel initViewModel(
      PaymentMethodViewModel viewModel) {
    return viewModel;
  }
}
