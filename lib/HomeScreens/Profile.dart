import 'package:flutter/material.dart';
import 'package:paystream/Database_models/UserDetails.dart';
import 'package:paystream/HomeScreens/Settings.dart';
//import 'package:paystream/HomeScreens/Settings.dart';
import 'package:paystream/common_variables/app_colors.dart';
import 'package:paystream/common_variables/app_fonts.dart';
import 'package:paystream/common_variables/app_functions.dart';
import 'package:paystream/common_widgets/button_widget/to_do_button.dart';
import 'package:paystream/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:paystream/common_widgets/offline_widgets/offline_widget.dart';
import 'package:paystream/common_widgets/platform_alert/platform_alert_dialog.dart';
import 'package:paystream/firebase/auth.dart';
import 'package:paystream/firebase/database.dart';
import 'package:popup_menu/popup_menu.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

void customLaunch(command) async{
  if(await canLaunch(command)){
    await launch(command);

  }else{
    print('could not launch $command');
  }
}

Future<void> _signOut(BuildContext context) async {
  try {
    final auth = Provider.of<AuthBase>(context, listen: false);
    await auth.signOut();
//    Navigator.of(context).pop();
  } catch (e) {
    print(e.toString());
  }
}

Future<void> _confirmSignOut(BuildContext context) async {
  final didRequestSignOut = await PlatformAlertDialog(
    title: 'Logout',
    content: 'Are you sure that you want to logout?',
    defaultActionText: 'Logout',
    cancelActionText: 'Cancel',
  ).show(context);
  if (didRequestSignOut == true) {
    _signOut(context);
  }
}


class ProfilePage extends StatelessWidget {
  ProfilePage({@required this.database});
  Database database;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_ProfilePage(database: database,),
    );
  }
}

class F_ProfilePage extends StatefulWidget {
  F_ProfilePage({@required this.database});
  Database database;

  @override
  _F_ProfilePageState createState() => _F_ProfilePageState();
}

class _F_ProfilePageState extends State<F_ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return offlineWidget(context);
  }

  Widget offlineWidget(BuildContext context) {
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
    return StreamBuilder<UserDetails>(
        stream: widget.database.readUser(USER_ID),
        builder: (context, snapshot) {
          print('get contacts 2${CONTACT_NUMBERS}');

          final user = snapshot.data;
          PopupMenu.context = context;
          return new MaterialApp(
            debugShowCheckedModeBanner: false,
            home: new Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(130),

                //preferredSize : Size(double.infinity, 100),
                child: CustomAppBar(

                  leftActionBar: Container(
                    child: Icon(
                      Icons.arrow_back,
                      size: 40,
                      color: Colors.white70,
                    ),
                  ),
                  leftAction: () {
                    Navigator.pop(context, true);
                  },
                  rightActionBar: Container(
                    child:IconButton(
                        icon: Icon(
                          Icons.settings,
                          size: 35,
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsPage() ),
                          );
                        }
                    ),
                  ),
                  rightAction: () {
                    print('right action bar is pressed in appbar');
                  },
                  primaryText: null,
                  secondaryText: 'Profile',
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: (user != null ? user.userImagePath : "") != null ? CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.grey[200],
                              backgroundImage:
                              NetworkImage((user != null ? user.userImagePath : "")),
                            ) : CircleAvatar(
                              radius: 40.0,
                              backgroundColor: Colors.grey[200],
                            ),
                          ),

                          SizedBox(height: 10,),
                          Text(user != null ? user.phoneNumber : 'loading...',style: descriptionStyleDarkBlur,),
                          SizedBox(height: 10,),
                          Text(user != null ? user.username : 'loading...',style: subTitleStyle,),
                          SizedBox(height: 10,),
                          Divider(
                            color: Colors.black.withOpacity(0.9),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
    );

  }
}