import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vdev20210801/components/customFormField.dart';
import 'package:vdev20210801/components/customText.dart';
import 'package:vdev20210801/components/verticalSpacing.dart';
import 'package:vdev20210801/constants/customMediaQuery.dart';
import 'package:vdev20210801/constants/palette.dart';
import 'package:vdev20210801/screens/signinScreen/providers/userProvider.dart';
import 'package:vdev20210801/utils/alertUtils.dart';
import 'package:vdev20210801/utils/validatorMixin.dart';

class SigninScreen extends StatefulWidget {
  static const String route = '/signinScreen';

  const SigninScreen({Key key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = CustomMediaQuery.width(context);
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Palette.bgGrey,
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: 'Sign In',
          textSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: width,
          margin: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              verticalDirection: VerticalDirection.down,
              children: [
                VerticalSpacing(height: 15),
                Row(
                  children: [
                    Container(
                      width: 80,
                      child: CustomText(
                        text: 'Email',
                        textSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    VerticalSpacing(width: 10),
                    Expanded(
                      child: CustomFormField(
                        textEditingController: emailController,
                        validator: validateEmail,
                        hintText: 'Email Address',
                        obscureText: false,
                      ),
                    ),
                  ],
                ),
                VerticalSpacing(height: 15),
                Row(
                  children: [
                    Container(
                      width: 80,
                      child: CustomText(
                        text: 'Password',
                        textSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    VerticalSpacing(width: 10),
                    Expanded(
                      child: CustomFormField(
                        textEditingController: passwordController,
                        validator: validatePassword,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                    )
                  ],
                ),
                VerticalSpacing(height: 15),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (!_formKey.currentState.validate()) return;
                      AlertUtils.showProgressDialog(
                          context, 'Please wait while \nwe sign you in....');
                      await Future.delayed(Duration(seconds: 3));
                      await userProvider.authUser(
                          emailController.text, passwordController.text);
                      AlertUtils.closeProgressDialog(context);
                      if (userProvider.userModel != null) {
                        Navigator.pushReplacementNamed(context, '/dashboard');
                      }
                    },
                    child: CustomText(text: 'Sign-in'),
                  ),
                ),
                VerticalSpacing(height: 15),
                if (userProvider.isError)
                  Align(
                      alignment: Alignment.centerRight,
                      child: CustomText(
                          text: 'Invalid email or password!',
                          textColor: Palette.tomato)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
