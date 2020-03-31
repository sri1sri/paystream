import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  int _n = 0;
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
            child: Text(
              'Back',
              style: subTitleStyleLight,
            ),
          ),
          leftAction: () {
            Navigator.pop(context, true);
          },
          rightActionBar: Container(
            child: Text(
              'Add',
              style: subTitleStyleLight,
            ),
          ),
          rightAction: () {
            print('right action bar is pressed in appbar');
          },
          primaryText: 'Add group',
          secondaryText: null,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ItemCard(),
            ],
          ),
        ),
      ),
    );
  }



  Widget ItemCard()
  {
    return Padding(
      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 10),
      child: Container(


        //// Write your code hear



      ),
    );
  }
}