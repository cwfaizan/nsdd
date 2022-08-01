import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nsdd/providers/password_provider.dart';
import 'package:nsdd/providers/signup_provider.dart';
import 'package:nsdd/utils/routes.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';
import '../utils/file_path.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);
  final _globalKeySignupForm = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _shortNameController = TextEditingController();
  final _contactNoController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  void _submitSignupForm(BuildContext context) async {
    bool isValid = _globalKeySignupForm.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (!isValid) {
      return;
    }
    _globalKeySignupForm.currentState!.save();
    Provider.of<SignupProvider>(context, listen: false).submitSignupForm(
      context,
      _idController,
      _nameController,
      _shortNameController,
      _contactNoController,
      _passwordController,
      _passwordConfirmationController,
    );
  }

  @override
  Widget build(BuildContext context) {
    final passwordProvider =
        Provider.of<PasswordProvider>(context, listen: false);
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
                    key: _globalKeySignupForm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Signup',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        kPageItemSpacing2,
                        TextFormField(
                          controller: _idController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.pin),
                            hintText: 'Enter cnic no',
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter cnic no';
                            } else if (!RegExp(r'^(\d{13})$').hasMatch(value)) {
                              return 'Please enter 13 digits valid cnic no';
                            }
                            return null;
                          },
                        ),
                        kPageItemSpacing2,
                        TextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: 'Enter full name',
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter full name';
                            } else if (!RegExp(r'^[a-zA-Z]+(?:\s[a-zA-Z]+)+$')
                                .hasMatch(value)) {
                              return 'Please enter valid full name';
                            }
                            return null;
                          },
                        ),
                        kPageItemSpacing2,
                        TextFormField(
                          controller: _shortNameController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: 'Enter short name',
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter short name';
                            } else if (!RegExp(r'^[a-zA-Z]+$')
                                .hasMatch(value)) {
                              return 'Please enter valid short name';
                            }
                            return null;
                          },
                        ),
                        kPageItemSpacing2,
                        TextFormField(
                          controller: _contactNoController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            hintText: 'Enter mobile no',
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter mobile no';
                            } else if (!RegExp(r'^[03][0-9]{10,}$')
                                .hasMatch(value)) {
                              return 'Please enter valid mobile no';
                            }
                            return null;
                          },
                        ),
                        kPageItemSpacing2,
                        Consumer<PasswordProvider>(
                          builder: (context, pp, child) => TextFormField(
                            controller: _passwordController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            obscureText: pp.isObscure,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              hintText: 'Enter Password',
                              suffixIcon: IconButton(
                                icon: Icon(pp.isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () =>
                                    passwordProvider.toggleIsObscure(),
                              ),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              } else if (value.length < 7) {
                                return 'Please enter at least 8 characters password';
                              } else if (value.length > 12) {
                                return 'Please enter at most 12 characters password';
                              }
                              return null;
                            },
                          ),
                        ),
                        kPageItemSpacing2,
                        Consumer<PasswordProvider>(
                          builder: (context, pp, child) => TextFormField(
                            controller: _passwordConfirmationController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            obscureText: pp.isObscure,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              hintText: 'Re-enter Password',
                              suffixIcon: IconButton(
                                icon: Icon(pp.isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () =>
                                    passwordProvider.toggleIsObscure(),
                              ),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please re-enter password';
                              } else if (value.length < 7) {
                                return 'Please re-enter at least 8 characters password';
                              } else if (value.length > 12) {
                                return 'Please enter at most 12 characters password';
                              }
                              return null;
                            },
                          ),
                        ),
                        kPageItemSpacing4,
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => _submitSignupForm(context),
                            child: Text(
                              'Signup',
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                        ),
                        kPageItemSpacing2,
                        Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already have an account? ',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                TextSpan(
                                  text: 'Login',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.restorablePushReplacementNamed(
                                        context,
                                        RouteGenerator.login,
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
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
