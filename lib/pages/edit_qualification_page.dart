import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nsdd/models/qualification_level.dart';
import 'package:nsdd/models/university.dart';

import '../providers/dummy_data.dart';
import '../utils/constants.dart';
import '../utils/file_path.dart';

class EditQualificationPage extends StatelessWidget {
  EditQualificationPage({Key? key}) : super(key: key);
  final _globalKeyQualificationForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              FilePath.topRightCornerBg(context),
              height: 152.h,
              width: 222.w,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: kPagePadding,
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _globalKeyQualificationForm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Qualification',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        kPageItemSpacing,
                        DropdownButtonFormField<QualificationLevel>(
                          items: qualificationLevelDropdownItems,
                          onChanged: (QualificationLevel? value) {},
                          // value: selectedGender,
                          validator: (value) => value == null
                              ? 'Choose Qualification Level'
                              : null,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.library_books),
                            hintText: 'Choose Qualification Level',
                          ),
                        ),
                        kPageItemSpacing,
                        TextFormField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.abc),
                            hintText: 'Enter degree title',
                          ),
                        ),
                        kPageItemSpacing,
                        TextFormField(
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.pin),
                            hintText: 'Enter obtained marks/cgpa',
                          ),
                        ),
                        kPageItemSpacing,
                        TextFormField(
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.pin),
                            hintText: 'Enter total marks/cgpa',
                          ),
                        ),
                        kPageItemSpacing,
                        TextFormField(
                          readOnly: true,
                          keyboardType: TextInputType.none,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.wysiwyg),
                            hintText: 'Choose Passing Year',
                            suffixIcon: Icon(Icons.date_range),
                          ),
                          onTap: () {},
                        ),
                        kPageItemSpacing,
                        DropdownButtonFormField<University>(
                          items: universityDropdownItems,
                          onChanged: (University? value) {},
                          // value: selectedGender,
                          validator: (value) =>
                              value == null ? 'Choose Board/University' : null,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.location_city),
                            hintText: 'Choose Board/University',
                          ),
                        ),
                        kPageItemSpacing2,
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Save',
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                        ),
                        kPageItemSpacing,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
