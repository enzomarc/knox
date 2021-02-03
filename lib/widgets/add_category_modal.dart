import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:knox/core/models/category.dart';
import 'package:knox/core/providers/category_provider.dart';
import 'package:knox/core/services/category_service.dart';
import 'package:provider/provider.dart';
import 'custom_field.dart';

class AddCategoryModal extends StatefulWidget {
  const AddCategoryModal({
    Key key,
  }) : super(key: key);

  @override
  _AddCategoryModalState createState() => _AddCategoryModalState();
}

class _AddCategoryModalState extends State<AddCategoryModal> {
  TextEditingController title = TextEditingController();
  File _image;
  ImagePicker picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final provider = Provider.of<CategoryProvider>(context, listen: false);

    return Container(
      padding: EdgeInsets.all(20.0),
      height: screenSize.height / 2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                height: 4.0,
                width: 20.0,
                decoration: BoxDecoration(
                  color: Color(0xFF334148).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'Add New Category',
              style: TextStyle(
                color: Color(0xFF334148),
                fontFamily: 'Source Bold',
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: screenSize.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      getImage();
                    },
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF03A69A).withOpacity(0.2),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(500.0),
                      ),
                      child: _image == null
                          ? Icon(
                              FlutterIcons.image_fea,
                              color: Color(0xFF03A69A),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(500.0),
                                image: DecorationImage(image: FileImage(_image), fit: BoxFit.fill),
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Change image',
                    style: TextStyle(
                      color: Color(0xFF03A69A),
                      fontFamily: 'Source SemiBold',
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  CustomField(
                    label: 'Category Title',
                    placeholder: 'Gaming',
                    icon: FlutterIcons.title_mdi,
                    controller: title,
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () async {
                          if (title.text.isNotEmpty && _image != null) {
                            Category newCategory = Category(title: title.text, image: _image.path, localImage: true);
                            bool created = await categoryService.storeCategory(newCategory);

                            if (created) {
                              provider.getCategories();
                              Navigator.pop(context);
                            }
                          }
                        },
                        color: Colors.transparent,
                        splashColor: Color(0xFF03A69A).withOpacity(0.3),
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          side: BorderSide(color: Color(0xFF03A69A), width: 1.5),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FlutterIcons.save_fea,
                              color: Color(0xFF03A69A),
                              size: 16.0,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              'Save',
                              style: TextStyle(
                                color: Color(0xFF03A69A),
                                fontFamily: 'Source Semibold',
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
