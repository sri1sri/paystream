import 'package:cloud_firestore/cloud_firestore.dart';
import'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paystream/AuthenticationScreens/SignUp_Screen.dart';
//import 'package:paystream/Models/otp_model.dart';
import 'package:paystream/common_variables/app_colors.dart';
import 'package:paystream/common_variables/app_fonts.dart';
import 'package:paystream/common_variables/app_functions.dart';
import 'package:paystream/common_widgets/button_widget/to_do_button.dart';
import 'package:paystream/common_widgets/offline_widgets/offline_widget.dart';
import 'package:paystream/common_widgets/platform_alert/platform_exception_alert_dialog.dart';
//import 'package:paystream/firebase/auth.dart';
import 'package:provider/provider.dart';

import '../landing_page.dart';

class OTPPage extends StatelessWidget {
  OTPPage({@required this.phoneNo, @required this.newUser});
  String phoneNo;
  bool newUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      //child: F_OTPPage.create(context, phoneNo, newUser),
    );
  }
}

//class F_OTPPage extends StatefulWidget {
//
//  //F_OTPPage({@required this.model, @required this.phoneNo, @required this.newUser});
// // final OtpModel model;
//  String phoneNo;
//  bool newUser;
//
//  static Widget create(BuildContext context, String phoneNo, bool newUser) {
//
////    final AuthBase auth = Provider.of<AuthBase>(context);
////    return ChangeNotifierProvider<OtpModel>(
////      create: (context) => OtpModel(auth: auth),
////      child: Consumer<OtpModel>(
////        builder: (context, model, _) => F_OTPPage(model: model, phoneNo: phoneNo, newUser: newUser,),
////      ),
////    );
////  }
//
//  @override
//  //_F_OTPPageState createState() => _F_OTPPageState();
//}
//
////class _F_OTPPageState extends State<F_OTPPage> {
////
////  final TextEditingController _otpController = TextEditingController();
////  final FocusNode _otpFocusNode = FocusNode();
////
////  OtpModel get model => widget.model;
////
////  @override
////  void dispose() {
////    _otpController.dispose();
////    super.dispose();
////  }
//
//  @override
//  Widget build(BuildContext context) {
//    return CustomOfflineWidget(
//      onlineChild: Padding(
//        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//        child: Scaffold(
//          body: SingleChildScrollView(child: _buildContent(context)),
//        ),
//      ),
//    );
//  }
//
//  Widget _buildContent(BuildContext context) {
//
//    return Column(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      children: <Widget>[
//        Container(
//          color: Color(0xFF222222),
//          height: MediaQuery.of(context).size.height/2.4,
//          width: MediaQuery.of(context).size.width,
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.all(10.0),
//                child: Column(
//                    children: <Widget>[
//                      Text("Hello \nthere..!",style: bigTitleStyle,),
//                    ]
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.all(10.0),
//                child: Text("Please enter the otp which is sent to +91 ${widget.phoneNo}.",style: titleStyle,),
//              )
//            ],
//
//
//          ),
//        ),
//        SizedBox(height: 100.0),
//        Padding(
//          padding: const EdgeInsets.all(20.0),
//          child: Column(
//            children: <Widget>[
//              new TextFormField(
//                keyboardType: TextInputType.number,
//                //controller: _otpController,
//                textInputAction: TextInputAction.done,
//                obscureText: false,
//                //focusNode: _otpFocusNode,
//                //onEditingComplete:() =>_submit(),
//                //onChanged: model.updateOtp,
//                decoration: new InputDecoration(
//                  prefixIcon: Icon(
//                    Icons.lock,
//                    color: backgroundColor,
//                  ),
//                  labelText: "Enter OTP",
//                  border: new OutlineInputBorder(
//                    borderRadius: new BorderRadius.circular(5.0),
//                    borderSide: new BorderSide(
//                    ),
//                  ),
//                ),
//
//                validator: (val) {
//                  if(val.length==0) {
//                    return "One Time Password cannot be empty";
//                  }else{
//                    return null;
//                  }
//                },
//                style: new TextStyle(
//                  fontFamily: "Poppins",
//                ),
//              ),
//              SizedBox(height: 20.0),
//              ToDoButton(
//                assetName: 'images/googl-logo.png',
//                text: 'Login',
//                textColor: subBackgroundColor,
//                backgroundColor: backgroundColor,
//                //onPressed: model.canSubmit ? () => _submit() : null,
//              ),
//              SizedBox(height: 10.0),
//              ToDoButton(
//                assetName: 'images/googl-logo.png',
//                text: 'back',
//                textColor: Colors.black,
//                backgroundColor: Colors.white,
//                onPressed: (){
//                  Navigator.of(context).pop();
//                },
//              ),
//            ],
//          ),
//        ),
//      ],
//    );
//  }
//
//  @override
////  Future<void> _submit() async {
////    try {
////      print('otp${widget.newUser}');
////      if(widget.newUser){
////        await model.submit();
////        GoToPage(context, SignUpPage(phoneNo: widget.phoneNo));
////      }else{
////        await model.submit();
////        GoToPage(context, LandingPage());
////      }
////    } on PlatformException catch (e) {
////      PlatformExceptionAlertDialog(
////        title: 'Otp Verification failed',
////        exception: e,
////      ).show(context);
////    }
////  }
//}