import 'dart:io';

import 'package:bookapp/controller/api/profile/get_profile.dart';
import 'package:bookapp/controller/api/profile/update_profile.dart';
import 'package:bookapp/controller/provider/profile_state.dart';
import 'package:bookapp/controller/service/replace.dart';
import 'package:bookapp/model/api/generated/tikonline.models.swagger.dart';
import 'package:bookapp/model/api/generated/tikonline.swagger.dart';
import 'package:bookapp/model/components/date_picker.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    super.key,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  int _selectedValue = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserProfile(context: context).then(
      (value) {
        name.text = ProfileState.profile!.firstName.toString();
        familyName.text = ProfileState.profile!.lastName.toString();
        phonenumber.text = ProfileState.profile!.phoneNumber.toString();
        nationalCode.text = ProfileState.profile!.nationalCode.toString();
        pervImage = ProfileState.profile!.userAvatar!;
        _selectedOptionIdsCategories = List.generate(
          ProfileState.profile!.categories!.length,
          (index) => ProfileState.profile!.categories![index].title.toString(),
        );
        // expertiseController.text = ProfileState.profile!.expertiseId.toString();
      },
    );
  }

  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path);
      });
    }
  }

  TextEditingController name = TextEditingController();
  TextEditingController familyName = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController nationalCode = TextEditingController();
  String? pervImage;
  List<CategoryDto> optionsCategories =
      ProfileState.profile!.categories!.toList();
  List<String> _selectedOptionIdsCategories = [];

  // باز کردن دیالوگ چند‌انتخابی
  void _openMultiSelectDialogCategories() async {
    final List<String> selectedIds = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialogCategories(
          options: optionsCategories,
          selectedOptionIds: _selectedOptionIdsCategories,
        );
      },
    );

    if (selectedIds != null) {
      setState(() {
        _selectedOptionIdsCategories = selectedIds;
        print('$_selectedOptionIdsCategories' + 'Hereleeeey');
      });
    }
  }

  TextEditingController expertiseController = TextEditingController();
  List<ExpertiseDto> optionsExpertises =
      ProfileState.profile!.expertises!.toList();
  String? _selectedOptionIdsExpertises;

  // باز کردن دیالوگ چند‌انتخابی
  // void _openMultiSelectDialogExpertises() async {
  //   final List<String> selectedIds = await showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return MultiSelectDialogExpertises(
  //         options: optionsExpertises,
  //         selectedOptionIds: _selectedOptionIdsExpertises,
  //       );
  //     },
  //   );

  //   if (selectedIds != null) {
  //     setState(() {
  //       _selectedOptionIdsExpertises = selectedIds;
  //       print('$_selectedOptionIdsExpertises' + 'Hereleeeey');
  //     });
  //   }
  // }
  DateTime? finalDate;
  // CategoryDto? selectedValue;
  void _showPersianDatePicker() async {
    Jalali? picked = await showPersianDatePicker(
      initialDatePickerMode: PDatePickerMode.year,
      initialEntryMode: PDatePickerEntryMode.input,
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali(1300, 1, 1),
      lastDate: Jalali(1450, 12, 29),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked.formatShortDate();
        finalDate = picked.toDateTime();
      });
    }
  }

  // DateTime startDate = DateTime.now();
  String selectedDate = 'تاریخ تولد';
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomSheet: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 8, bottom: 8),
            child: SizedBox(
              width: 100,
              height: 20,
              child: RawMaterialButton(
                fillColor: Color.fromARGB(255, 0, 174, 212),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      'ثبت',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () async {
                  filesHTTP(
                          expertiesId: _selectedOptionIdsExpertises,
                          likedCategories:
                              _selectedOptionIdsCategories.toString(),
                          nationalCode: nationalCode.text,
                          context: context,
                          UserAvatarFile: _image,
                          firstName: name.text,
                          lastName: familyName.text,
                          id: ProfileState.profile!.id)
                      .then(
                    (value) {
                      print('$_selectedOptionIdsCategories' + "DOPSSSSS");
                      print('$expertiseController' + "Hereleeeeey");
                    },
                  );
                },
              ),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0), color: Colors.white),
        ),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: backgroundColor,
              flexibleSpace: Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(),
                              Row(
                                children: [
                                  Text(
                                    'پروفایل',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              )
                              // Image(
                              //   image: AssetImage(
                              //       'lib/assets/images/logo.png'),
                              //   width: 70,
                              // )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
        backgroundColor: backgroundColor,
        body: Center(
          child: Consumer<ProfileState>(
            builder: (context, value, child) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, bottom: 5, top: 15),
                    child: Container(
                        height: 660,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                _image == null
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: pervImage != null
                                            ? Image.network(
                                                pervImage.toString(),
                                                width: 80,
                                                height: 80,
                                              )
                                            : Image(
                                                image: AssetImage(
                                                    'lib/assets/images/profilee.png'),
                                                width: 80,
                                                height: 80,
                                              ),
                                      )
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.file(
                                          File(_image!.path),
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                // _image == null
                                //     // ? Image(
                                //     //     image: AssetImage(
                                //     //         'lib/assets/images/profilee.png'),
                                //     //     width: 80,
                                //     //     height: 80,
                                //     //   )
                                //     ? ClipRRect(
                                //         borderRadius: BorderRadius.circular(100),
                                //         child: pervImage != null
                                //             ? Image.network(pervImage.toString())
                                //             : Image(
                                //                 image: AssetImage(
                                //                     'lib/assets/images/profilee.png'),
                                //                 width: 80,
                                //                 height: 80,
                                //               ),
                                //       )
                                //     : ClipRRect(
                                //         borderRadius: BorderRadius.circular(100),
                                //         child: pervImage != null
                                //             ? Image.file(
                                //                 File(_image!.path),
                                //                 width: 80,
                                //                 height: 80,
                                //                 fit: BoxFit.fill,
                                //               )
                                //             : Image.network(pervImage.toString()),
                                //       ),
                                SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  onTap: () => _pickImage(ImageSource.gallery),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            'lib/assets/images/camera.png'),
                                        width: 12,
                                        height: 11,
                                        fit: BoxFit.fill,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        'ویرایش عکس',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 0, 174, 212),
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 40,
                                  child: Center(
                                    child: TextField(
                                      controller: name,
                                      decoration: InputDecoration(
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10, left: 10),
                                            child: Image(
                                              image: AssetImage(
                                                  'lib/assets/images/iconcm.png'),
                                              color: Colors.grey,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          label: Text(
                                            'نام',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 40,
                                  child: Center(
                                    child: TextField(
                                      controller: familyName,
                                      decoration: InputDecoration(
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10, left: 10),
                                            child: Image(
                                              image: AssetImage(
                                                  'lib/assets/images/iconcm.png'),
                                              color: Colors.grey,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          label: Text(
                                            'نام خانوادگی',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                IgnorePointer(
                                  child: SizedBox(
                                    height: 40,
                                    child: Center(
                                      child: TextField(
                                        controller: phonenumber,
                                        decoration: InputDecoration(
                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, bottom: 5, left: 10),
                                              child: Image(
                                                image: AssetImage(
                                                    'lib/assets/images/mobilee.png'),
                                                color: Colors.grey,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            label: Text(
                                              'شماره موبایل',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 40,
                                  child: Center(
                                    child: TextField(
                                      controller: nationalCode,
                                      decoration: InputDecoration(
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10, left: 10),
                                            child: Image(
                                              image: AssetImage(
                                                  'lib/assets/images/cod.png'),
                                              color: Colors.grey,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          label: Text(
                                            'کد ملی',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'رمز ورود',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          FaIcon(
                                            FontAwesomeIcons.penToSquare,
                                            size: 20,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: Row(
                                    children: [
                                      Text(
                                        '*********',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'جنسیت',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey.shade800,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 13,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 28,
                                      width: 65,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Transform.scale(
                                              scale: 0.8,
                                              child: Radio<int>(
                                                activeColor: Colors.black,
                                                value: 1,
                                                groupValue: _selectedValue,
                                                onChanged: (int? value) {
                                                  setState(() {
                                                    _selectedValue = value!;
                                                  });
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 4),
                                              child: Text(
                                                'مرد',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.grey.shade800,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 14,
                                    ),
                                    Container(
                                      height: 28,
                                      width: 65,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Transform.scale(
                                              scale: 0.8,
                                              child: Radio<int>(
                                                activeColor: Colors.black,
                                                value: 2,
                                                groupValue: _selectedValue,
                                                onChanged: (int? value) {
                                                  setState(() {
                                                    _selectedValue = value!;
                                                  });
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 4),
                                              child: Text(
                                                'زن',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.grey.shade800,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                DatePicker(
                                    selectedDate: selectedDate.persianToEN(),
                                    lable: 'تاریخ تولد',
                                    onTap: _showPersianDatePicker
                                    // final DateTime? dateTime = await showDatePicker(
                                    //     context: context,
                                    //     initialDate: startDate,
                                    //     firstDate: DateTime(1900),
                                    //     lastDate: DateTime(3000));
                                    // if (dateTime != null) {
                                    //   setState(() {
                                    //     startDate = dateTime;
                                    //   });
                                    // }

                                    ),

                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 40,
                                  child: TextField(
                                    onTap: _openMultiSelectDialogCategories,
                                    controller: TextEditingController(
                                      // نمایش نام‌های انتخاب‌شده در TextField
                                      text: optionsCategories
                                          .where((option) =>
                                              _selectedOptionIdsCategories
                                                  .contains(option.id))
                                          .map((e) => e.title)
                                          .join(','),
                                    ),
                                    enabled: true,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.all(9),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 0, 174, 212)),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: InkWell(
                                            onTap:
                                                _openMultiSelectDialogCategories,
                                            child: Icon(Icons.add,
                                                size: 15,
                                                color: Color.fromARGB(
                                                    255, 0, 174, 212)),
                                          ),
                                        ),
                                      ),
                                      label: Text(
                                        'دسته مورد علاقه',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.auto,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 40,
                                  child: TextField(
                                    onTap: () async {
                                      // نمایش دیالوگ و انتظار برای انتخاب
                                      final selectedItem =
                                          await _openSingleSelectDialog(
                                              context, optionsExpertises);
                                      if (selectedItem != null) {
                                        // تنظیم آیتم انتخاب شده در تکست فیلد
                                        expertiseController.text =
                                            selectedItem.name.toString();
                                        _selectedOptionIdsExpertises =
                                            selectedItem.id;
                                      }
                                    },
                                    controller: expertiseController,
                                    enabled: true,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.all(9),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 0, 174, 212)),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: InkWell(
                                            onTap: () async {
                                              // نمایش دیالوگ و انتظار برای انتخاب
                                              final selectedItem =
                                                  await _openSingleSelectDialog(
                                                      context,
                                                      optionsExpertises);
                                              if (selectedItem != null) {
                                                // تنظیم آیتم انتخاب شده در تکست فیلد
                                                expertiseController.text =
                                                    selectedItem.name
                                                        .toString();
                                                _selectedOptionIdsExpertises =
                                                    selectedItem.id;
                                              }
                                            },
                                            child: Icon(Icons.add,
                                                size: 15,
                                                color: Color.fromARGB(
                                                    255, 0, 174, 212)),
                                          ),
                                        ),
                                      ),
                                      label: Text(
                                        'تخصص',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.auto,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                          // Container(
                          //   height: 40,
                          //   child: TextField(
                          //     enabled: true,
                          //     textAlignVertical: TextAlignVertical.center,
                          //     decoration: InputDecoration(
                          //       label: Text(
                          //         'تاریخ تولد',
                          //         style: TextStyle(
                          //             fontSize: 10,
                          //             fontWeight: FontWeight.w500,
                          //             color: Colors.grey),
                          //       ),
                          //       prefixIcon: Padding(
                          //         padding: const EdgeInsets.only(
                          //             top: 10, bottom: 8, left: 8, right: 8),
                          //         child: Image(
                          //           image: AssetImage(
                          //               'lib/assets/images/birth.png'),
                          //           fit: BoxFit.fill,
                          //         ),
                          //       ),
                          //       focusedBorder: OutlineInputBorder(
                          //           borderSide: BorderSide(
                          //               width: 1, color: Colors.grey),
                          //           borderRadius: BorderRadius.circular(8)),
                          //       enabledBorder: OutlineInputBorder(
                          //           borderSide: BorderSide(
                          //               width: 1, color: Colors.grey),
                          //           borderRadius: BorderRadius.circular(8)),
                          //       floatingLabelBehavior:
                          //           FloatingLabelBehavior.auto,
                          //       border: OutlineInputBorder(
                          //           borderSide: BorderSide(
                          //               width: 1, color: Colors.grey),
                          //           borderRadius: BorderRadius.circular(8)),
                          //     ),
                          //   ),
                          // ),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MultiSelectDialogCategories extends StatefulWidget {
  final List<CategoryDto> options;
  final List<String> selectedOptionIds;

  MultiSelectDialogCategories({
    required this.options,
    required this.selectedOptionIds,
  });

  @override
  _MultiSelectDialogState createState() => _MultiSelectDialogState();
}

class _MultiSelectDialogState extends State<MultiSelectDialogCategories> {
  List<String> _tempSelectedIds = [];

  @override
  void initState() {
    super.initState();
    _tempSelectedIds = List.from(widget.selectedOptionIds);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        actionsAlignment: MainAxisAlignment.start,
        title: Text(
          'انتخاب کنید',
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: widget.options.map((option) {
              return CheckboxListTile(
                activeColor: secondaryColor,
                value: _tempSelectedIds.contains(option.id),
                title:
                    Text(option.title.toString()), // نمایش فیلد `name` از DTO
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? selected) {
                  setState(() {
                    if (selected == true) {
                      _tempSelectedIds.add(option.id!);
                    } else {
                      _tempSelectedIds.remove(option.id);
                    }
                  });
                },
              );
            }).toList(),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'CANCEL',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.of(context).pop(widget.selectedOptionIds);
            },
          ),
          TextButton(
            child: Text(
              'OK',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.of(context).pop(_tempSelectedIds);
            },
          ),
        ],
      ),
    );
  }
}

// class MultiSelectDialogExpertises extends StatefulWidget {
//   final List<ExpertiseDto> options;
//   final List<String> selectedOptionIds;

//   MultiSelectDialogExpertises({
//     required this.options,
//     required this.selectedOptionIds,
//   });

//   @override
//   _MultiSelectDialogExpertisesState createState() =>
//       _MultiSelectDialogExpertisesState();
// }

// class _MultiSelectDialogExpertisesState
//     extends State<MultiSelectDialogExpertises> {
//   List<String> _tempSelectedIds = [];

//   @override
//   void initState() {
//     super.initState();
//     _tempSelectedIds = List.from(widget.selectedOptionIds);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: AlertDialog(
//         actionsAlignment: MainAxisAlignment.start,
//         title: Text(
//           'انتخاب کنید',
//         ),
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: widget.options.map((option) {
//               return CheckboxListTile(
//                 activeColor: secondaryColor,
//                 value: _tempSelectedIds.contains(option.id),
//                 title: Text(option.name.toString()), // نمایش فیلد `name` از DTO
//                 controlAffinity: ListTileControlAffinity.leading,
//                 onChanged: (bool? selected) {
//                   setState(() {
//                     if (selected == true) {
//                       _tempSelectedIds.add(option.id!);
//                     } else {
//                       _tempSelectedIds.remove(option.id);
//                     }
//                   });
//                 },
//               );
//             }).toList(),
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: Text(
//               'CANCEL',
//               style: TextStyle(color: Colors.black),
//             ),
//             onPressed: () {
//               Navigator.of(context).pop(widget.selectedOptionIds);
//             },
//           ),
//           TextButton(
//             child: Text(
//               'OK',
//               style: TextStyle(color: Colors.black),
//             ),
//             onPressed: () {
//               Navigator.of(context).pop(_tempSelectedIds);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

Future<ExpertiseDto?> _openSingleSelectDialog(
    BuildContext context, List<ExpertiseDto> items) async {
  return await showDialog<ExpertiseDto>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Select an item'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(items[index].name.toString()),
                onTap: () {
                  Navigator.of(context).pop(items[index]);
                },
              );
            },
          ),
        ),
      );
    },
  );
}
