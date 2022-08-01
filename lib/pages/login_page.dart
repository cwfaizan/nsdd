import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:nsdd/providers/login_provider.dart';
import 'package:nsdd/providers/password_provider.dart';
import 'package:nsdd/utils/file_path.dart';
import 'package:nsdd/utils/routes.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _globalKeyLoginForm = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  bool showLoader = false;

  void _submitLoginForm(BuildContext context) async {
    bool isValid = _globalKeyLoginForm.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (!isValid) {
      return;
    }
    _globalKeyLoginForm.currentState!.save();
    toggleLoader();
    Provider.of<LoginProvider>(context, listen: false).login(
      context,
      toggleLoader,
      _idController,
      _passwordController,
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
                          key: _globalKeyLoginForm,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Login',
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
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter cnic no';
                                  } else if (!RegExp(r'^(\d{13})$')
                                      .hasMatch(value)) {
                                    return 'Please enter 13 digits valid cnic no';
                                  }
                                  return null;
                                },
                              ),
                              kPageItemSpacing2,
                              Consumer<PasswordProvider>(
                                builder: (context, pp, child) => TextFormField(
                                  controller: _passwordController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
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
                              InkWell(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  RouteGenerator.forgotPassword,
                                ),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    'Forgot Password?',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              kPageItemSpacing4,
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () => _submitLoginForm(context),
                                  child: Text(
                                    'Login',
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
                                        text: 'Don’t have an account? ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      TextSpan(
                                        text: 'Register',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => Navigator
                                                  .restorablePushReplacementNamed(
                                                context,
                                                RouteGenerator.signup,
                                              ),
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
