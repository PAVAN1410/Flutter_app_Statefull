import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "statefull App example ",
    home: FavoriteCity(),
  ));
}

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoriteCity();
  }
}

class _FavoriteCity extends State<FavoriteCity> {
  String fav_city = '';
  var _currencies = ['Rupees', 'Dollars', 'Pounds', 'Others'];
  var currentItemSelected = 'Rupees';

  @override
  Widget build(BuildContext context) {
    debugPrint("Fav_city widget is created");
    return Scaffold(
        appBar: AppBar(
          title: Text("Exploring statefull widget"),
        ),
        body: Container(
          margin: EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              TextField(onSubmitted: (String
                      User_input) //TextField(onChanged: (String User_input) {

                  {
                setState(() {
                  debugPrint(
                      "set Set is called, this tells framework to redraw the Favsity widet");
                  fav_city = User_input;
                });
              }),
              DropdownButton<String>(
                items: _currencies.map((String dropDownStringItem){
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),

                onChanged: (String newValue) {
                  onDropDownButtonSelected(newValue);
                },
                  value: currentItemSelected,
                ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "Your fav city is $fav_city ",
                  style: TextStyle(fontSize: 25.0),
                ),
              )
            ],
          ),
        ));
  }
  void onDropDownButtonSelected(String newValue)
  {
  setState(() {
  this.currentItemSelected=newValue;
  });
  }

}
