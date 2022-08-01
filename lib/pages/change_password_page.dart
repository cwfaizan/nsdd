import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:nsdd/providers/change_password_provider.dart';
import 'package:nsdd/providers/password_provider.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';
import '../utils/file_path.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _globalKeyChangePasswordForm = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  bool showLoader = false;

  void _submitChangePasswordForm(BuildContext context) async {
    bool isValid = _globalKeyChangePasswordForm.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (!isValid) {
      return;
    }
    _globalKeyChangePasswordForm.currentState!.save();
    Provider.of<ChangePasswordProvider>(context, listen: false).changePassword(
      context,
      toggleLoader,
      _currentPasswordController,
      _passwordController,
      _passwordConfirmationController,
    );
  }

  void toggleLoader() {
    setState(() {
      showLoader = !showLoader;
    });
  }

  @override
  Widget build(BuildContext context) {
    final passwordProvider =
        Provider.of<PasswordProvider>(context, listen: false);
    return Scaffold(
      body: showLoader
          ? Center(child: Lottie.asset(FilePath.loader(context)))
          : Stack(
              children: [
                Positioned(
                  top: 30.h,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30.w,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
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
                          key: _globalKeyChangePasswordForm,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Change Password',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              kPageItemSpacing2,
                              Consumer<PasswordProvider>(
                                builder: (context, pp, child) => TextFormField(
                                  controller: _currentPasswordController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  obscureText: pp.isObscure,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock),
                                    hintText: 'Current Password',
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
                                  controller: _passwordController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  obscureText: pp.isObscure,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock),
                                    hintText: 'New Password',
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
                                    hintText: 'Re-enter New Password',
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
                                  onPressed: () =>
                                      _submitChangePasswordForm(context),
                                  child: Text(
                                    'Change Password',
                                    style: Theme.of(context).textTheme.button,
                                  ),
                                ),
                              ),
                              kPageItemSpacing2,
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
