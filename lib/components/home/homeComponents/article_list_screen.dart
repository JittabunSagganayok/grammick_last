import 'package:flutter/material.dart';
import 'package:we_link/components/home/homeComponents/article_detail_scren.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/models/article/article_list_response.dart';

class ArticleListScreen extends StatelessWidget {
  List<Article> articleList = [];

  ArticleListScreen(this.articleList);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Row(
          children: [
            Container(
              child: Image.asset(
                'assets/images/Article.png',
                fit: BoxFit.fill,
                height: 20,
                width: 20,
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
                        text: "Article",
                        style: titleHomeText,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    child: Text.rich(
                      TextSpan(
                        text: "Reccommend for you",
                        style: TextStyle(
                            color: Color(0xFF9FA7C5),
                            fontSize: 11,
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
          ],
        ),
      ),
      SizedBox(
        height: 16,
      ),
      Container(
          child: SizedBox(
        height: 120,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: articleList.length,
          itemBuilder: (BuildContext context, int index) {
            final item = articleList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ArticleDetailScreen(item)),
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                width: 163,
                child: Stack(
                  children: [
                    Container(
                      height: 165,
                      width: 163,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(item.picture ?? ''),
                            fit: BoxFit.fill,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          )),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 163,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            )),
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Text.rich(
                                          TextSpan(
                                            text: item.title ?? "",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
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
                                            text: item.description ?? "",
                                            style: TextStyle(
                                                color: Color(0xFFABABAB),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Kanit'),
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ]),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(
            height: 1,
            color: Colors.transparent,
            indent: 8,
          ),
        ),
      ))
    ]));
  }
}
