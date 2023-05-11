import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/article/article_detail_response.dart';
import 'package:we_link/models/article/article_list_response.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleDetailScreen extends StatefulWidget {
  Article articleDetail;

  ArticleDetailScreen(this.articleDetail);

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState
    extends AppState<ArticleDetailScreen, ArticleDetailViewModel> {
  @override
  ArticleDetailViewModel initViewModel(ArticleDetailViewModel viewModel) {
    viewModel.getArticleDetail(widget.articleDetail.id ?? -1);
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, ArticleDetailViewModel viewModel) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: blackColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          shape: appbarBorder,
          centerTitle: true,
          leading: Container(
            margin: EdgeInsets.only(left: 5),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset('assets/images/goBack.png'),
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (viewModel.loading.value) {
          return LoadingFullscreen();
        } else {
          return SingleChildScrollView(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 95,
                ),
                child: Image.network(
                  viewModel.article?.picture ?? "",
                  fit: BoxFit.fill,
                  height: 233,
                  width: MediaQuery.of(context).size.width * 1,
                ),
              ),
              Container(
                margin: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(viewModel.article?.title ?? "",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF121212),
                            fontFamily: 'Kanit')),
                    Container(
                      margin: EdgeInsets.only(top: 6, bottom: 20),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            child: CircleAvatar(
                              radius: 3,
                              backgroundColor: Color(0xFF706F6F),
                            ),
                          ),
                          Text('${viewModel.article?.readCount}k read',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF121212),
                                  fontFamily: 'Kanit')),
                          Container(
                            margin: EdgeInsets.only(right: 5, left: 5),
                            child: CircleAvatar(
                              radius: 3,
                              backgroundColor: Color(0xFF706F6F),
                            ),
                          ),
                          Text('Post ${timeago.format(DateTime.parse(viewModel.article?.createdDt ?? ""))}',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFABABAB),
                                  fontFamily: 'Kanit')),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Html(data: viewModel.article?.description ?? ""),
                    ),
                  ],
                ),
              )
            ],
          ));
        }
      }),
    );
  }
}

class ArticleDetailViewModel extends GetxController {
  Dio dio;

  ArticleDetailViewModel(this.dio);

  Article? article;
  var loading = false.obs;

  Future getArticleDetail(
    int id,
  ) async {
    loading.value = true;
    var response = await dio.get('articles/$id');
    var data = ArticleDetailResponse.fromJson(response.data);
    article = data.result ?? null;
    loading.value = false;
  }
}
