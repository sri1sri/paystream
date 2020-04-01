import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:intl/intl.dart';
import 'package:paystream/common_variables/app_colors.dart';
import 'package:paystream/common_variables/app_fonts.dart';
import 'package:paystream/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:paystream/common_widgets/offline_widgets/offline_widget.dart';

class SubscriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_SubscriptionPage(),
    );
  }
}

class F_SubscriptionPage extends StatefulWidget {
  @override
  _F_SubscriptionPage createState() => _F_SubscriptionPage();
}

class _F_SubscriptionPage extends State<F_SubscriptionPage> {
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
            child: Icon(Icons.list,color: subBackgroundColor,),
          ),
          rightAction: () {
            print('right action bar is pressed in appbar');
          },
          primaryText: 'Group Details',
          secondaryText: null,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Image(
                        image: AssetImage('images/hotstar.jpeg'),
                        height: 80,
                        width: 80,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'CSK batch',
                        style: topNavigationBarTitleStyle,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '5 members',
                        style: subTitleStyleLight
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Divider(
                          thickness: 1,
                          color: backgroundColor,
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10),
                        child: ExpansionTile(
                          title: Row(
                            children: <Widget>[
                              Text(
                                'Subscription info',
                                style: titleStyle,
                              ),
                            ],
                          ),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'payment date :',
                                    style: subTitleStyleLight
                                  ),
                                  Text(
                                    '5th of every month',
                                     style:priceFont
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'payment amount :',
                                    style: subTitleStyleLight
                                  ),
                                  Text(
                                    '₹200/-',
                                    style:priceFont
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Start date :',
                                    style: subTitleStyleLight
                                  ),
                                  Text(
                                    '01/03/2020',
                                      style:priceFont
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Divider(
                          thickness: 1,
                          color: backgroundColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10),
                        child: ExpansionTile(
                          title: Row(
                            children: <Widget>[
                              Text(
                                'Members',
                                style: titleStyle,
                              ),
                            ],
                          ),
                          children: <Widget>[

                            MemberCard("SK","Srivatsav","Payment Completed","Admin"),
                            MemberCard("VG","Vasanth","Payment Incomplete","Member"),
                            MemberCard("VP","Vamsi","Payment Completed","Member"),
                            MemberCard("JK","Jake","Payment Incomplete","Member"),

                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Divider(
                          thickness: 1,
                          color: backgroundColor,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10),
                        child: ExpansionTile(
                          title: Row(
                            children: <Widget>[
                              Text(
                                'Account Info',
                                style: titleStyle,
                              ),
                            ],
                          ),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'User Name :',
                                    style: subTitleStyleLight
                                  ),
                                  Text(
                                    'anakonda@katre.com',
                                    style: priceFont
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Password :',
                                    style: subTitleStyleLight
                                  ),
                                  Text(
                                    '********',
                                    style: priceFont
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Divider(
                          thickness: 1,
                          color: backgroundColor,
                        ),
                      ),
                      SizedBox(height: 80,),
                    ],
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add,color: subBackgroundColor,),
                backgroundColor: backgroundColor,
              ),
              SizedBox(width: 80,),
              FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.mode_edit,color: subBackgroundColor,),
                backgroundColor: backgroundColor,
              )
            ],
          ),
        )
    );
  }
  Widget MemberCard(String initials,String name,String paymentInfo,String role)
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(name,style: titleStyle,),
                          SizedBox(height: 5,),
                          Text(paymentInfo,style: TextStyle(color: paymentInfo == 'Payment Incomplete' ? Colors.redAccent : Colors.green,fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0),),
                        ],
                      ),
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
