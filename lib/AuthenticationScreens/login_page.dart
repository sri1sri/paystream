
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paystream/AuthenticationScreens/phone_number_page.dart';
import 'package:paystream/common_variables/app_colors.dart';
import 'package:paystream/common_variables/app_fonts.dart';
import 'package:paystream/common_widgets/button_widget/to_do_button.dart';
import 'package:paystream/common_widgets/offline_widgets/offline_widget.dart';
import 'package:paystream/firebase/auth.dart';
import 'package:provider/provider.dart';

import 'login_page_manager.dart';

class LoginPage extends StatelessWidget {

  const LoginPage(
      {Key key, @required this.manager, @required this.isLoading})
      : super(key: key);
  final LoginPageManager manager;
  final bool isLoading;

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_) => ValueNotifier<bool>(false),
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, isLoading, __) =>
            Provider<LoginPageManager>(
              create: (_) =>
                  LoginPageManager(auth: auth, isLoading: isLoading),
              child: Consumer<LoginPageManager>(
                builder: (context, manager, _) =>
                    LoginPage(
                      manager: manager, isLoading: isLoading.value,
                    ),
              ),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return offlineWidget(context);
  }

  Widget offlineWidget (BuildContext context){
    return CustomOfflineWidget(
      onlineChild: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Scaffold(
          body: _buildContent(context),
        ),
      ),
    );
  }


  Widget _buildContent(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              color: Color(0xFF243665),
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 3,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Welcome \nto Pay Stream..!", style: bigTitleStyle,),
                  ),

                ],

              ),
            ),

            Container(
              child: Column(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundColor: subBackgroundColor,
                                      radius: 6,),
                                  ],
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "I want to remove the black and \ncurrently the TextField. ",
                                      style: descriptionStyle,),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundColor: subBackgroundColor,
                                      radius: 6,),
                                  ],
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "I want to remove the black and \n currently the TextField. ",
                                      style: descriptionStyle,),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundColor: subBackgroundColor,
                                      radius: 6,),
                                  ],
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "I want to remove the black and \ncurrently the TextField. ",
                                      style: descriptionStyle,),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundColor: subBackgroundColor,
                                      radius: 6,),
                                  ],
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "I want to remove the black and \ncurrently the TextField. ",
                                      style: descriptionStyle,),
                                  ],
                                )
                              ],
                            ),
                          ]
                      ),
                    ),
                  )

                ],
              ),

            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  ToDoButton(
                      assetName: 'images/google-lodgo.png',
                      text: 'Login',
                      textColor: backgroundColor,
                      backgroundColor: inActiveButtonBackgroundColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PhoneNumberPage(),),
                        );
                      }
                  ),
                  SizedBox(height: 10.0),
                  ToDoButton(
                      assetName: 'images/google-lodgo.png',
                      text: 'Sign Up',
                      textColor: subBackgroundColor,
                      backgroundColor: backgroundColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PhoneNumberPage(),),
                        );
                      }
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


