import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:intl/intl.dart';
import 'package:paystream/common_variables/app_colors.dart';
import 'package:paystream/common_variables/app_fonts.dart';
import 'package:paystream/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:paystream/common_widgets/offline_widgets/offline_widget.dart';

class AddGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_AddGroupPage(),
    );
  }
}

class F_AddGroupPage extends StatefulWidget {
  @override
  _F_AddGroupPage createState() => _F_AddGroupPage();
}

class _F_AddGroupPage extends State<F_AddGroupPage> {
  List<String> F_image = [
    "images/hotstar.jpeg",
    "images/net.jpeg",
    "images/prime.png",
    "images/star.jpeg",
    "images/hotstar.jpeg",
    "images/net.jpeg",
    "images/prime.png",
    "images/star.jpeg",
    "images/hotstar.jpeg",
  ];
  DateTime selectedDate = DateTime.now();
  var customFormat = DateFormat("dd MMMM yyyy 'at' HH:mm:ss 'UTC+5:30'");
  var customFormat2 = DateFormat("dd MMMM yyyy");
  Future<Null> showPicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2010),
      firstDate: DateTime(1930),
      lastDate: DateTime(2010),
    );
    if (picked != null) {
      setState(() {
        print(customFormat.format(picked));
        selectedDate = picked;
      });
    }
  }

  final TextEditingController _usernameController = TextEditingController();
  final FocusNode _usernameFocusNode = FocusNode();
  final TextEditingController _totalPriceController = TextEditingController();
  final FocusNode _totalPriceFocusNode = FocusNode();
  final TextEditingController _subscriptionUsernameController = TextEditingController();
  final FocusNode _subscriptionUsernameFocusNode = FocusNode();
  final TextEditingController _subscriptionPasswordController = TextEditingController();
  final FocusNode _subscriptionPasswordFocusNode = FocusNode();
  int _n = 0;
  int group =1;
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.width/5),
        child: CustomAppBar(
          leftActionBar: Container(
            child: Icon(Icons.arrow_back_ios,color: subBackgroundColor,),
          ),
          leftAction: () {
            Navigator.pop(context, true);
          },
          rightActionBar: Container(
            child: Icon(Icons.person_add,color: subBackgroundColor,),
          ),
          rightAction: () {
            print('right action bar is pressed in appbar');
          },
          primaryText: 'Add group',
          secondaryText: null,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 25,),
                      Text('Select a streaming service',
                          style: descriptionStyleDarkBlur
                      ),
                      SizedBox(height: 15,),
                      Container(
                        height: 400,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                          child: new GridView.builder(
                            itemCount: F_image.length,
                            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,mainAxisSpacing: 10,crossAxisSpacing: 0
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return new GestureDetector(
                                child:
                                  new Card(
                                  elevation: 0.0,
                                  child: new Container(
                                    decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                                    alignment: Alignment.center,
                                    margin: new EdgeInsets.only(
                                        top: 5.0, bottom: 0.0, left: 0.0, right: 0.0),
                                    child: CircleAvatar(
                                radius: 50.0,
                                backgroundColor: Colors.grey[200],
                                backgroundImage:
                                AssetImage(F_image[index],),
                              ),
                                  ),
                                ),
                                onTap: () {

                                },
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 35,),
                      Text('Choose Subscription type',
                        style: descriptionStyleDarkBlur,
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: group,
                            onChanged: (T){
                              print(T);
                              setState(() {
                                group=T;
                              });
                            },
                          ),
                          Text("Yearly",style: descriptionStyleDarkBlur,),
                          Radio(
                            value: 2,
                            groupValue: group,
                            onChanged: (T){
                              print(T);
                              setState(() {
                                group=T;
                              });
                            },
                          ),
                          Text("Monthly",style: descriptionStyleDarkBlur,)
                        ],
                      ),
                      SizedBox(height: 25,),
                      Text('Add Group Name',
                          style: descriptionStyleDarkBlur
                      ),
                      SizedBox(height: 15,),
                      new TextFormField(
                        controller: _usernameController,
                        textInputAction: TextInputAction.done,
                        obscureText: false,
                        focusNode: _usernameFocusNode,
                        //onEditingComplete: () => _imageUpload(),
                        // onChanged: model.updateUsername,
                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.people_outline,
                            color: subBackgroundColor,
                          ),
                          labelText: "Add your Group Name",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "Username cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                      SizedBox(height: 35,),
                      Text('Add members',
                        style: descriptionStyleDarkBlur,
                      ),
                      SizedBox(height: 15,),
                      Container(
                        child: Column(
                          children: <Widget>[
                            MemberCard("SV","Srivatsav","Admin"),
                            MemberCard("VA","Vamsi","Member"),
                            MemberCard("VG","Vasanth","Member"),
                            MemberCard("JK","Jake","Member"),
                          ],
                        ),
                      ),
                      SizedBox(height: 35,),
                      Text('Add Total Price',
                          style: descriptionStyleDarkBlur
                      ),
                      SizedBox(height: 15,),
                      new TextFormField(
                        controller: _totalPriceController,
                        textInputAction: TextInputAction.done,
                        obscureText: false,
                        focusNode: _totalPriceFocusNode,
                        //onEditingComplete: () => _imageUpload(),
                        // onChanged: model.updateUsername,
                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.attach_money,
                            color: subBackgroundColor,
                          ),
                          labelText: "Add a total Price",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "Username cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text('Note: This price will be divided equally among all the members in the group',
                          style: descriptionStyleDark ),
                      SizedBox(height: 35,),
                      Text('Payment Date',
                          style: descriptionStyleDarkBlur
                      ),
                      SizedBox(height: 15,),
                      Padding(
                        padding: EdgeInsets.only(top: 0, bottom: 10),
                        child: Container(
                          child: RaisedButton(
                            color: Colors.white,
                            child: Container(
                              height: 70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    'Select the Payment Date.',
                                    style: subTitleStyleLight,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.date_range,
                                              size: 18.0,
                                              color: backgroundColor,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                                '${customFormat2.format(selectedDate)}',
                                                style: subTitleStyle),
                                          ],
                                        ),
                                      ),
                                      Text('Change', style: subTitleStyle),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () => showPicker(context),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text('Note: Please select a date the payment to be made. Please select the date which is 2-4 days prior.',
                          style: descriptionStyleDark ),
                      SizedBox(height: 35,),
                      Text('Subscription User Name',
                          style: descriptionStyleDarkBlur
                      ),
                      SizedBox(height: 15,),
                      new TextFormField(
                        controller: _subscriptionUsernameController,
                        textInputAction: TextInputAction.done,
                        obscureText: false,
                        focusNode: _subscriptionUsernameFocusNode,
                        //onEditingComplete: () => _imageUpload(),
                        // onChanged: model.updateUsername,
                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.description,
                            color: subBackgroundColor,
                          ),
                          labelText: "Add Subscription User Name",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "Username cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                      SizedBox(height: 35,),
                      Text('Subscription Password',
                          style: descriptionStyleDarkBlur
                      ),
                      SizedBox(height: 15,),
                      new TextFormField(
                        controller: _subscriptionPasswordController,
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        focusNode: _subscriptionPasswordFocusNode,
                        //onEditingComplete: () => _imageUpload(),
                        // onChanged: model.updateUsername,
                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: subBackgroundColor,
                          ),
                          labelText: "Add Subscription User Password",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "Username cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text('Note: Please add your Subscription details. So that your members can know the credentials. These information provided by you will be encrypted.',
                          style: descriptionStyleDark ),
                      SizedBox(height: 15,),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB( 30,20,30,20 ),
                          child: Column(
                            children: <Widget>[
                              RaisedButton(
                                //onPressed: () =>
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular( 80.0 ) ),
                                padding: const EdgeInsets.all( 0.0 ),
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF243665),
                                    borderRadius: BorderRadius.all( Radius.circular(
                                        10 ) ),
                                  ),
                                  child: Container(
                                    constraints: const BoxConstraints( minWidth: 88.0,
                                        minHeight: 50.0 ),
                                    // min sizes for Material buttons
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Create',
                                      style: TextStyle(
                                        color: Color(0xFF8BD8BD),
                                        letterSpacing: 1.5,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Montserrat',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 55,),

                    ],
                  ),
                ),
              ],
            ),

        ),
      ),
    );
  }


  Widget MemberCard(String initials,String name,String role)
  {
    return Padding(
      padding: const EdgeInsets.only(left:5.0,right: 5.0),
      child: Container(
        decoration:
        BoxDecoration(
          borderRadius: BorderRadius.circular( 10.0 ),
        ),
        child: Card(
          child: Container(
            height: 70,
            color: Colors.blueGrey.withOpacity(0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:10.0,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        child: Text(
                          initials,
                          style: subTitleStyleLight,
                        ),
                        radius: 20.0,
                        backgroundColor:
                        backgroundColor,
                      ),
                      Text(name,style: titleStyle,),
                      Text(role,style:descriptionStyleDarkBlur),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );

  }
}
