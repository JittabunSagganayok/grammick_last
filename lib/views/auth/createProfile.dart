import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as http;
import 'package:extended_image/extended_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/di/app_module.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/models/error/error_response.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';
import 'package:we_link/views/auth/term_cond_screen.dart';

import '../../components/signin/location.dart';
import '../../models/other/app_help_center_response.dart';
import '../../models/profile/user_profile_response.dart';
import '../content/web_content_screen.dart';

enum CreateProfileType { CREATE, EDIT }

class CreateProfileScreen extends StatefulWidget {
  CreateProfileType type;

  CreateProfileScreen({
    required this.type,
  });

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState
    extends AppState<CreateProfileScreen, CreateProfileViewModel> {
  final _formKey = GlobalKey<FormState>();

  @override
  CreateProfileViewModel initViewModel(CreateProfileViewModel viewModel) {
    viewModel.isEditProfile = widget.type == CreateProfileType.EDIT;
    viewModel.updateProfileSuccess.listen((success) {
      if (success == true) {
        navigator?.pop();

        if (viewModel.isEditProfile == true) {
          navigator?.pop();
        } else {
          Navigator.push(
            Get.context!,
            MaterialPageRoute(builder: (context) => LocationScreen()),
          );
        }
      }
    });

    viewModel.updateProfileError.listen((message) {
      if (message.isEmpty == true) {
        return;
      }
      navigator?.pop();
      Get.defaultDialog(
        title: 'Error',
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
      );
    });

    viewModel.needToUploadImage.listen((error) {
      if (error == true) {
        Get.defaultDialog(
          title: 'ขออภัย',
          content: const Text(
            'คุณยังไม่ได้เลือกรูป Profile',
            textAlign: TextAlign.center,
          ),
        );
      }
    });

    viewModel.getProfile();
    viewModel.loadTermCondition();
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, CreateProfileViewModel viewModel) {
    final main = Scaffold(
      backgroundColor: blackColor,
      bottomNavigationBar: Obx(() => Container(
            padding: const EdgeInsets.all(16),
            height: 80,
            width: MediaQuery.of(context).size.width * 1,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                backgroundColor: viewModel.isAgreed ? yellowColor : Colors.grey,
                textStyle: const TextStyle(fontSize: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                side: BorderSide(
                  width: 0.0,
                  color: viewModel.isAgreed ? yellowColor : Colors.grey,
                ),
              ),
              onPressed: () async {
                if (viewModel.isAgreed) {
                  if (_formKey.currentState!.validate()) {
                    Get.dialog(
                      LoadingFullscreen(
                        backgroundColor: Colors.black45,
                      ),
                    );

                    await viewModel.updateProfile();
                  }
                }
              },
              child: const Text(
                'Confirm',
                style: TextStyle(
                    color: Color(0xFF363636),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Kanit'),
              ),
            ),
          )),
      appBar: AppBar(
        leading: widget.type == CreateProfileType.EDIT
            ? InkWell(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              )
            : const SizedBox(),
        backgroundColor: blackColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.type == CreateProfileType.EDIT
              ? 'Edit Profile'
              : ' Create Profile',
          style: titleWhiteAppbar,
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.only(left: 36, right: 36),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: InkWell(
                  onTap: () async {
                    var pickFile = await FilePicker.platform
                        .pickFiles(type: FileType.image, allowMultiple: false);

                    if (pickFile != null) {
                      viewModel
                          .setProfileImage(pickFile.files.first.path ?? "");
                    }
                  },
                  child: Obx(() {
                    if (viewModel.profileImage.value.isEmpty) {
                      return Container(
                        margin: const EdgeInsets.only(top: 30, bottom: 40),
                        child: Image.asset(
                          'assets/images/add_image.png',
                          fit: BoxFit.fill,
                          height: 120,
                          width: 120,
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: 120,
                        width: 120,
                        child: Builder(builder: (context) {
                          if (viewModel.profileImage.value.contains('http')) {
                            return CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  NetworkImage(viewModel.profileImage.value),
                            );
                          } else {
                            return ExtendedImage.file(
                              File(viewModel.profileImage.value),
                              fit: BoxFit.fill,
                              shape: BoxShape.circle,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30.0)),
                            );
                          }
                        }),
                      );
                    }
                  }),
                ),
              ),
              Text(
                "Name",
                style: createProfileText,
              ),
              Container(
                  margin: const EdgeInsets.only(top: 11),
                  child: Obx(
                    () => TextFormField(
                      validator: (text) {
                        if (text?.isEmpty == true) {
                          return 'Please Enter Name';
                        }
                      },
                      controller: viewModel.firstnameTextController,
                      style: createProfileTextStyle,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        fillColor: const Color(0xFF505050),
                        filled: true,
                        hintStyle: createProfileHint,
                        enabledBorder: createProfileBorder,
                        focusedBorder: createProfileBorder,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            'assets/images/check.png',
                            width: 20,
                            color: viewModel.firstNameError.value == true
                                ? Colors.grey
                                : Colors.green,
                          ),
                        ),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Last Name",
                style: createProfileText,
              ),
              Container(
                  margin: const EdgeInsets.only(top: 11),
                  child: Obx(
                    () => TextFormField(
                      controller: viewModel.lastnameTextController,
                      style: createProfileTextStyle,
                      validator: (text) {
                        if (text?.isEmpty == true) {
                          return 'Please Enter Last Name';
                        }
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        fillColor: const Color(0xFF505050),
                        filled: true,
                        hintStyle: createProfileHint,
                        enabledBorder: createProfileBorder,
                        focusedBorder: createProfileBorder,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            'assets/images/check.png',
                            width: 20,
                            color: viewModel.lastNameError.value == true
                                ? Colors.grey
                                : Colors.green,
                          ),
                        ),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 24,
              ),
              Container(
                child: Text(
                  "Birthdate",
                  style: createProfileText,
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 11),
                  child: TextFormField(
                    validator: (text) {
                      if (text?.isEmpty == true) {
                        return 'Please Select Birthdate';
                      }
                    },
                    style: createProfileTextStyle,
                    controller: viewModel.birthDateTextController,
                    readOnly: true,
                    keyboardType: TextInputType.text,
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: viewModel.selectedDate.value,
                          firstDate: DateTime(1922, 1),
                          lastDate: DateTime.now());

                      if (picked != null) {
                        viewModel.selectedDate.value = picked;
                        viewModel.newBirthDate = picked;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Select Birthdate',
                      fillColor: const Color(0xFF505050),
                      filled: true,
                      hintStyle: createProfileHint,
                      enabledBorder: createProfileBorder,
                      focusedBorder: createProfileBorder,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          'assets/images/goBack2.png',
                          width: 20,
                        ),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 24,
              ),
              Container(
                child: Text(
                  "Gender",
                  style: createProfileText,
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 11),
                  child: TextFormField(
                    validator: (text) {
                      if (text?.isEmpty == true) {
                        return 'Please Select Gender';
                      }
                    },
                    style: createProfileTextStyle,
                    controller: viewModel.genderTextController,
                    readOnly: true,
                    onTap: () async {
                      var gender = await Get.dialog(Container(
                        margin: const EdgeInsets.all(32),
                        child: Material(
                          child: Container(
                            width: Get.width,
                            child: ListView.builder(
                              itemCount: viewModel.genderList.length,
                              itemBuilder: (BuildContext context, int index) {
                                final item = viewModel.genderList[index];
                                return ListTile(
                                  onTap: () {
                                    navigator?.pop(item);
                                  },
                                  title: Text(
                                    item,
                                    style: GoogleFonts.kanit(
                                      fontSize: 15,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ));
                      if (gender != null) {
                        viewModel.setGender(gender);
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Select Gender',
                      fillColor: const Color(0xFF505050),
                      filled: true,
                      hintStyle: createProfileHint,
                      enabledBorder: createProfileBorder,
                      focusedBorder: createProfileBorder,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          'assets/images/goBack2.png',
                          width: 20,
                        ),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Email",
                style: createProfileText,
              ),
              Container(
                  margin: const EdgeInsets.only(top: 11),
                  child: Obx(
                    () => TextFormField(
                      validator: (email) {
                        if (email?.toString().isNotEmpty == true && GetUtils.isEmail(email.toString()) == false) {
                          return 'Your email incorrect';
                        }
                      },
                      controller: viewModel.emailTextController,
                      style: createProfileTextStyle,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        fillColor: const Color(0xFF505050),
                        filled: true,
                        hintStyle: createProfileHint,
                        enabledBorder: createProfileBorder,
                        focusedBorder: createProfileBorder,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            'assets/images/check.png',
                            width: 20,
                            color: viewModel.emailError.value == true
                                ? Colors.grey
                                : Colors.green,
                          ),
                        ),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 24,
              ),
              if (widget.type == CreateProfileType.CREATE) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() => InkWell(
                        onTap: () => viewModel.agreeToggle(),
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: yellowColor,
                          child: CircleAvatar(
                            radius: 8.5,
                            backgroundColor: blackColor,
                            child: CircleAvatar(
                                radius: 6,
                                backgroundColor: viewModel.isAgreed
                                    ? yellowColor
                                    : blackColor),
                          ),
                        ))),
                    Expanded(
                      child: InkWell(
                        onTap: () {

                          Get.to(WebContentScreen(),
                              arguments: WebContentParams(
                                  title: 'Term & Condition',
                                  textHtml: viewModel?.termAndCondition.value?.description ?? ""));
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(
                            left: 14,
                          ),
                          child: Text.rich(TextSpan(
                              text: "I agree with ",
                              style: regisAgree,
                              children: [
                                TextSpan(
                                  text: "Terms & Condition / Privacy Policy",
                                  style: regisTerm,
                                )
                              ])),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ]
            ],
          ),
        ),
      )),
    );
    return WillPopScope(
      onWillPop: () async => false,
      child: main,
    );
  }
}

class CreateProfileViewModel extends GetxController {
  Dio dio = appModule.get();

  var profileImage = ''.obs;

  final _agree = false.obs;

  bool get isAgreed => _agree.value || isEditProfile;

  void agreeToggle() {
    _agree.value = !_agree.value;
  }

  var firstnameTextController = TextEditingController();
  var lastnameTextController = TextEditingController();
  var birthDateTextController = TextEditingController();
  var emailTextController = TextEditingController();
  var genderTextController = TextEditingController();

  var firstNameError = true.obs;
  var lastNameError = true.obs;
  var emailError = true.obs;

  var selectedDate = DateTime.now().obs;
  DateTime? newBirthDate;

  var genderList = ['MALE', 'FEMALE', 'OTHER'];

  var needToUploadImage = false.obs;
  var updateProfileSuccess = false.obs;
  var updateProfileError = ''.obs;

  var userProfile = Profile().obs;
  bool isEditProfile = false;

  CreateProfileViewModel() {
    firstnameTextController.addListener(() {
      firstNameError.value = firstnameTextController.text.isEmpty;
    });
    lastnameTextController.addListener(() {
      lastNameError.value = lastnameTextController.text.isEmpty;
    });
    emailTextController.addListener(() {
      var email = emailTextController.text;
      if (email.isEmpty == true) {
        emailError.value = true;
      } else {
        emailError.value = GetUtils.isEmail(email) == false;
      }
    });

    selectedDate.listen((date) {
      birthDateTextController.text = DateFormat('dd/MM/yyyy').format(date);
    });
  }

  Future getProfile() async {
    if (isEditProfile == true) {
      var response = await Future.wait([
        dio.get('auth/profile'),
      ]);

      var userProfileResponse = UserProfileResponse.fromJson(response[0].data);
      userProfile.value = userProfileResponse.result!;

      profileImage.value = userProfile.value.picture ?? '';
      firstnameTextController.text = userProfile.value.name ?? "";
      lastnameTextController.text = userProfile.value.lastname ?? "";
      emailTextController.text = userProfile.value.email ?? "";
      genderTextController.text = userProfile.value.gender ?? "";

      if (userProfile.value.birth != null) {
        var date = DateTime.parse(userProfile.value.birth.toString());
        selectedDate.value = date;
      }
    }
  }

  void setGender(String gender) {
    genderTextController.text = gender;
  }

  Future updateProfile() async {
    try {
      needToUploadImage.value = false;
      updateProfileSuccess.value = false;
      updateProfileError.value = '';

      // if (profileImage.value.isEmpty == true) {
      //   needToUploadImage.value = true;
      //   return;
      // }

      UploadImageResult? uploadResult;

      if (profileImage.value.isNotEmpty == true && profileImage.value.contains('http') == false) {
        var image = http.FormData.fromMap({
          'picture': await http.MultipartFile.fromFile(profileImage.value ?? ""),
        });
        var response = await dio.post('upload/one', data: image);
        uploadResult = UploadImageResult.fromJson(response.data);
      }

      var request = {
        "name": firstnameTextController.text,
        "lastname": lastnameTextController.text,
        "email": emailTextController.text,
        "gender": genderTextController.text,
        "birth": newBirthDate != null ? '${newBirthDate?.toIso8601String()}Z' : selectedDate.value.toIso8601String(),
      };

      if (uploadResult != null) {
        request['picture'] = uploadResult?.result ?? "";
      }

      await dio.patch('users', data: request);

      updateProfileSuccess.value = true;
    } on DioError catch (e) {
      var error = ErrorResponse.fromJson(e.response?.data);
      updateProfileError.value = error.message ?? "";
    }
  }

  void setProfileImage(String path) {
    profileImage.value = path;
  }

  var termAndCondition = HelpCenter().obs;
  loadTermCondition() async {
    var resp = await dio.get('admin/term-conditions?skip&take');
    var termResp = AppHelpCenterResponse.fromJson(resp.data);
    termAndCondition.value = termResp.result!;
  }
}

UploadImageResult uploadImageResultFromJson(String str) =>
    UploadImageResult.fromJson(json.decode(str));

String uploadImageResultToJson(UploadImageResult data) =>
    json.encode(data.toJson());

class UploadImageResult {
  UploadImageResult({
    this.message,
    this.result,
  });

  UploadImageResult.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'];
  }

  String? message;
  String? result;

  UploadImageResult copyWith({
    String? message,
    String? result,
  }) =>
      UploadImageResult(
        message: message ?? this.message,
        result: result ?? this.result,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['result'] = result;
    return map;
  }
}
