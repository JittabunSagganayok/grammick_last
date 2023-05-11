import 'package:flutter/material.dart';
import 'package:we_link/constant/stylesConstants.dart';

import '../../../../../models/address/my_address_response.dart';

class bodySearchLo extends StatelessWidget {
  List<AddressResponse> favList = [];
  List<AddressResponse> recentList = [];

  bodySearchLo({
    Key? key,
    this.showMore,
    this.searchAddress,
    required this.favList,
    required this.recentList,
    required this.onClickListener,
    required this.onClickBookmark,
  }) : super(key: key);
  final bool? showMore;
  final String? searchAddress;

  Function(AddressResponse) onClickListener;
  Function(AddressResponse) onClickBookmark;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          /*
          Container(
              constraints: maxHeightContain,
              margin: const EdgeInsets.only(bottom: 15),
              width: MediaQuery.of(context).size.width * 1,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      'Favorites',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          fontFamily: 'Kanit'),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: favList.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        final item = favList[index];
                        return InkWell(
                          onTap: () {
                            onClickListener.call(item!);
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/loca2.png',
                                fit: BoxFit.fill,
                                height: 29,
                                width: 19,
                              ),
                              const SizedBox(
                                width: 13,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        text: item?.name,
                                        style: const TextStyle(
                                            color: Color(0xFF4B4B4B),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Kanit'),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: item?.address,
                                        style: const TextStyle(
                                            color: Color(0xFFACACAC),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Kanit'),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Builder(builder: (context) {
                                var iconBookMark = item.favorite == true
                                    ? 'assets/images/mark.png'
                                    : 'assets/images/mark1.png';

                                if (searchAddress == 'searchAddress') {
                                  return Image.asset(
                                    'assets/images/edit1.png',
                                    fit: BoxFit.fill,
                                    height: 22,
                                    width: 22,
                                  );
                                } else {
                                  return IconButton(
                                    onPressed: () {
                                      onClickBookmark.call(item!);
                                    },
                                    icon: Image.asset(
                                      'assets/images/mark.png',
                                      fit: BoxFit.fill,
                                      height: 22,
                                      width: 22,
                                    ),
                                  );
                                }
                              }),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                        height: 16,
                        color: Color(0xFFEEEEEE),
                      ),
                    ),
                  ],
                ),
              )
          ),*/
          Container(
              constraints: maxHeightContain,
              margin: const EdgeInsets.only(bottom: 24),
              width: MediaQuery.of(context).size.width * 1,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recent',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          fontFamily: 'Kanit'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    for (var i = 0; i < recentList.length; i++)
                      InkWell(
                        onTap: () {
                          onClickListener.call(recentList[i]);
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Image.asset(
                                    'assets/images/loca2.png',
                                    fit: BoxFit.fill,
                                    height: 29,
                                    width: 19,
                                  ),
                                ),
                                const SizedBox(
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
                                            text: recentList?[i].name ?? "",
                                            style: bottomReviewText,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Container(
                                        child: Text.rich(
                                          TextSpan(
                                            text: recentList?[i].address ?? "",
                                            style: inforLocaText,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                /*
                                const SizedBox(width: 10),
                                Builder(builder: (context) {
                                  var iconBookMark =
                                      recentList?[i].favorite == true
                                          ? 'assets/images/mark.png'
                                          : 'assets/images/mark1.png';

                                  if (searchAddress == 'searchAddress') {
                                    return Container(
                                      child: Image.asset(
                                        'assets/images/edit1.png',
                                        fit: BoxFit.fill,
                                        height: 22,
                                        width: 22,
                                      ),
                                    );
                                  } else {

                                    return IconButton(
                                      icon: Image.asset(
                                        iconBookMark,
                                        fit: BoxFit.fill,
                                        height: 22,
                                        width: 22,
                                      ),
                                      onPressed: () {
                                        onClickBookmark.call(recentList[i]);
                                      },
                                    );
                                  }
                                }),

                                 */
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Divider(
                              color: Color(0xFFEEEEEE),
                              thickness: 1,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    if (searchAddress != 'searchAddress') ...[
                      /*
                      Row(
                        children: [
                          Container(
                            child: Image.asset(
                              'assets/images/add.png',
                              fit: BoxFit.fill,
                              height: 22,
                              width: 22,
                            ),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text.rich(
                                    TextSpan(
                                      text: "New place",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Kanit'),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  child: Text.rich(
                                    TextSpan(
                                      text: "Add your new place",
                                      style: TextStyle(
                                          color: Color(0xFFACACAC),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Kanit'),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),*/
                    ]
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
