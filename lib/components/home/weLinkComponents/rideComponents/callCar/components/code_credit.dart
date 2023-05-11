import 'package:flutter/material.dart';
import 'package:we_link/components/home/weLinkComponents/rideComponents/searchLoComponents/promotion.dart';
import 'package:we_link/constant/stylesConstants.dart';

class code_credit extends StatelessWidget {
  const code_credit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width * 1,
              child: OutlinedButton(
                  style: paymentOutlined,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PromotionScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Image.asset(
                          'assets/images/master.png',
                          fit: BoxFit.fill,
                          height: 18,
                          width: 30,
                        ),
                      ),
                      Expanded(
                        child: Container(
                            child: Text.rich(
                          TextSpan(
                            text: "4383",
                            style: paymentText,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                      ),
                    ],
                  )),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width * 1,
              child: OutlinedButton(
                  style: codePromoOutlined,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PromotionScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Image.asset(
                          'assets/images/tag.png',
                          fit: BoxFit.fill,
                          height: 14,
                          width: 22,
                        ),
                      ),
                      Expanded(
                        child: Container(
                            child: Text.rich(
                          TextSpan(
                            text: "ride50Freeiks...",
                            style: codePromoText,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                      ),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
