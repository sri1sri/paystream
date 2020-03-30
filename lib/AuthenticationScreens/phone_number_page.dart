import 'package:cloud_firestore/cloud_firestore.dart';
import'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paystream/AuthenticationScreens/Verify_Otp.dart';
import 'package:paystream/Models/phone_number_page_model.dart';
import 'package:paystream/common_variables/app_colors.dart';
import 'package:paystream/common_variables/app_fonts.dart';
import 'package:paystream/common_variables/app_functions.dart';
import 'package:paystream/common_widgets/button_widget/to_do_button.dart';
import 'package:paystream/common_widgets/offline_widgets/offline_widget.dart';
import 'package:paystream/common_widgets/platform_alert/platform_exception_alert_dialog.dart';
import 'package:paystream/firebase/auth.dart';

import 'package:provider/provider.dart';

class PhoneNumberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_PhoneNumberPage.create(context),
    );
  }
}

class F_PhoneNumberPage extends StatefulWidget {
  F_PhoneNumberPage({@required this.model});
  final PhoneNumberModel model;

  static Widget create(BuildContext context) {
    final AuthBase auth = Provider.of<AuthBase>(context);
    return ChangeNotifierProvider<PhoneNumberModel>(
      create: (context) => PhoneNumberModel(auth: auth),
      child: Consumer<PhoneNumberModel>(
        builder: (context, model, _) => F_PhoneNumberPage(model: model),
      ),
    );
  }


  @override
  _F_PhoneNumberPageState createState() => _F_PhoneNumberPageState();
}

class _F_PhoneNumberPageState extends State<F_PhoneNumberPage> {

  final TextEditingController _phoneNumberController = TextEditingController();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  PhoneNumberModel get model => widget.model;

  Future<bool> didCheckPhoneNumber;

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return offlineWidget(context);
  }

  Widget offlineWidget (BuildContext context) {
    return CustomOfflineWidget(
      onlineChild: Padding(
        padding: const EdgeInsets.fromLTRB( 0, 0, 0, 0 ),
        child: Scaffold(
          body: SingleChildScrollView(child: _buildContent( context )),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {

    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            color: Color(0xFF222222),
            height: MediaQuery.of(context).size.height/2.4,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      children: <Widget>[
                        Text("Hello \nthere..!",style: bigTitleStyle,),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Please enter your number.",style: titleStyle,),
                )
              ],


            ),
          ),
          SizedBox(height: 150.0),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                new TextFormField(
                  controller: _phoneNumberController,
                  textInputAction: TextInputAction.done,
                  obscureText: false,
                  focusNode: _phoneNumberFocusNode,
                  onEditingComplete: () => _submit(context),
                  onChanged: model.updatePhoneNumber,
                  decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone,
                      color: backgroundColor,
                    ),
                    labelText: "Enter your mobile no.",
                    //fillColor: Colors.redAccent,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Phone number cannot be empty";
                    } else if (val.length == 10) {
                      return null;
                    } else {
                      return "Phone number you entered is invalid.";
                    }
                  },
                  keyboardType: TextInputType.phone,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(height: 20.0),
                ToDoButton(
                  assetName: 'images/googl-logo.png',
                  text: 'Get OTP',
                  textColor: subBackgroundColor,
                  backgroundColor: backgroundColor,
                  onPressed: model.canSubmit ? () => _submit(context) : null,
                ),
                SizedBox(height: 10.0),
                ToDoButton(
                  assetName: 'images/googl-logo.png',
                  text: 'back',
                  textColor: Colors.black,
                  backgroundColor: Colors.white,
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ],
    );
  }


  Future<void> _submit(BuildContext context) async {
    try {
      await Firestore.instance
          .collection('users')
          .where('user_contact_number',
          isEqualTo: '+91${_phoneNumberController.value.text}')
          .snapshots()
          .listen((data) => {
        print('data=${data}'),
        if (data.documents.length == 0)
          {
            model.submit(),
            GoToPage(context, OTPPage(phoneNo: _phoneNumberController.value.text, newUser: true)),
          }
        else
          {
            model.submit(),
            GoToPage(context, OTPPage(phoneNo: _phoneNumberController.value.text, newUser: false)),
          }
      });
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: 'Phone number failed',
        exception: e,
      ).show(context);
    }
  }
}