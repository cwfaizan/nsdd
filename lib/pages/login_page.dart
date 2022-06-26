import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../components/c_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _dateOfBirthController = TextEditingController();
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              CTextFormField(
                controller: _dateOfBirthController,
                onTap: () {
                  print('object');
                  _showDatePicker();
                },
                initialValue: 'ABC',
                readOnly: true,
                showCursor: false,
                hintText: 'Date of Birth',
                prefixIcon: Icon(Icons.calendar_month),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              CheckboxListTile(
                title: Text("title text"),
                value: checkedValue,
                onChanged: (newValue) {
                  setState(() {
                    checkedValue = newValue!;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.trailing, //  <-- leading Checkbox
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate != null) {
        _dateOfBirthController.text = DateFormat.yMd().format(pickedDate);
      }
    });
  }
}
