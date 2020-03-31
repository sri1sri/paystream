import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paystream/HomeScreens/AddGroup.dart';
import 'package:paystream/common_variables/app_colors.dart';
import 'package:paystream/common_variables/app_fonts.dart';
import 'package:paystream/common_widgets/offline_widgets/offline_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_HomePage(),
    );
  }
}

class F_HomePage extends StatefulWidget {
  @override
  _F_HomePage createState() => _F_HomePage();
}

class _F_HomePage extends State<F_HomePage> {
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
        preferredSize: Size.fromHeight( 150 ),
        child: Container(
          color: Colors.white,
          height: MediaQuery
              .of( context )
              .size
              .height / 3,
          width: MediaQuery
              .of( context )
              .size
              .width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:30.0,left: 10,right: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.notifications,size: 40,),
                      color: Colors.black,
                      onPressed: () {},
                    ),
                    GestureDetector(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding:
                              const EdgeInsets.only( bottom: 15, right: 10 ),
                              child: CircleAvatar(
                                child: Text(
                                  'SV',
                                  style: subTitleStyleLight,
                                ),
                                radius: 19.0,
                                backgroundColor:
                                backgroundColor,
                              ),
                            )
                          ],
                        ),
                        onTap: () {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                            builder: (context) =>
//                                ProfilePage( database: database ),
//                          ),
//                        );
                        } )
                ]
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0 ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          Text("Hello",style: subTitleStyleLight,),
                          Text(
                            "Srivatsav Konda",
                            style: topNavigationBarTitleStyle,
                          ),
                        ] ),
                      ),
                    ],
                  ),
                ],
              ),
            ],

          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ItemCard("images/hotstar.jpeg","CSK Batch","5 members","₹200 / preson"),
              ItemCard("images/hotstar.jpeg","CSK Batch","5 members","₹200 / preson"),
              ItemCard("images/hotstar.jpeg","CSK Batch","5 members","₹200 / preson"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddGroupPage() ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add,color: Color(0xFF8BD8BD),),
        backgroundColor: Color(0XFF233666),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
    );
  }



  Widget ItemCard(String imgPath,String title,String members, String price )
  {
    return Padding(
      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 10),
      child: Container(
        decoration:
        BoxDecoration(

            borderRadius: BorderRadius.circular( 10.0 ),
            ),
        child: Card(
          child: Container(
            height: 100,
            color: Colors.blueGrey.withOpacity(0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      child: Image(image: AssetImage(imgPath),
                        height: 60,
                        width: 60,
                        ),
                      radius: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(title,style: titleStyle,),
                        SizedBox(height: 5,),
                        Text(members,style: descriptionStyleDarkBlur,),
                      ],
                    ),
                    Text(price,style:priceFont),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}