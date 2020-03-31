
import 'package:flutter/cupertino.dart';
import 'package:paystream/common_variables/app_fonts.dart';



class OfflinePage extends CustomOfflinePage{
  OfflinePage({
    @required String text,
  }) : assert(text != null),
        super(
        text: text,
      );
}

class CustomOfflinePage extends StatelessWidget {

  CustomOfflinePage({this.text});

  final text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(
                'images/no_internet.png',
              ),
              height: 300.0,
              width: 300.0,
            ),
            Text('No Internet connection.\nPlease check connection!!', style: topNavigationBarTitleStyle,)
          ],
        ),
      ),
    );
  }
}