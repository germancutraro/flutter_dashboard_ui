import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Home()));

class Home extends StatelessWidget {
  // render each item
  Widget _renderItem({index = 0, screenWidth = 360.0, context = 0}) {
    final items = [
      {'title': 'Expend', 'icon': Icons.home, 'color': 0xffFED525},
      {'title': 'Collection', 'icon': Icons.star, 'color': 0xffFD637B},
      {'title': 'Incomes', 'icon': Icons.monetization_on, 'color': 0xff21CDFF},
      {'title': 'Sales', 'icon': Icons.show_chart, 'color': 0xff7585F6},
    ];
    return Container(
      width: (screenWidth - 40 - 17) / 2,
      height: (screenWidth - 40 - 17 - 30) / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(items[index]['color']),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          child: Icon(items[index]['icon'], size: 40, color: Colors.white),
          margin: EdgeInsets.only(bottom: 10),
        ),
        Text(items[index]['title'],
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold))
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(0xff333), // status bar color
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
        body: SafeArea(
      child: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 30),
          child: Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu, size: 30, color: Colors.grey)),
                  CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://images-na.ssl-images-amazon.com/images/M/MV5BOTIxNTE2NTQ3Nl5BMl5BanBnXkFtZTcwMzMwOTk2Nw@@._V1_UX172_CR0,0,172,256_AL_.jpg'))
                ]),
            Expanded(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: 190,
                    height: 190,
                    alignment: Alignment.center,
                    child: Text("37%",
                        style: TextStyle(
                            color: Colors.blueAccent[200],
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(100.0),
                        border: Border.all(
                            color: Color(0xff7E89FC),
                            style: BorderStyle.solid,
                            width: 25),
                        color: Colors.transparent),
                  ),
                ]),
                flex: 1),
            Wrap(
              spacing: 17,
              runSpacing: 17,
              children: [
                _renderItem(
                    index: 0, screenWidth: screenWidth, context: context),
                _renderItem(
                    index: 1, screenWidth: screenWidth, context: context),
                _renderItem(
                    index: 2, screenWidth: screenWidth, context: context),
                _renderItem(
                    index: 3, screenWidth: screenWidth, context: context),
              ],
            ),
          ])),
    ));
  }
}
