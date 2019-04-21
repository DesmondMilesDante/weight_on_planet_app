import 'package:flutter/material.dart';

class WeightOnPlanet extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return StateWeightOnPlanet();
  }

}
class StateWeightOnPlanet extends State<WeightOnPlanet>{

  final TextEditingController weightController = new TextEditingController();
  int radioValue = 0;
  String _formattedText = "";
  double _weight = 0.0;

  void radioValueChanged(int value){
    setState(() {
      radioValue = value;

      switch(radioValue) {
        case 0 :
          _weight = calculate(weightController.text, 0.06);
          _formattedText = "Your weight on Pluto is ${_weight.toStringAsFixed(1)}";
          break;

        case 1:
          _weight = calculate(weightController.text, 0.38);
          _formattedText = "Your weight on Mard is ${_weight.toStringAsFixed(1)}";

          break;

        case 2:
          _weight = calculate(weightController.text,  0.91);
          _formattedText = "Your weight on Venus is ${_weight.toStringAsFixed(1)}";

          break;

      }
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight on Planet X"),
        backgroundColor: Colors.black38,
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: EdgeInsets.all(2.5),
          children: <Widget>[

            Image.asset("images/planet.png",height: 133.0, width: 200.0,),

            Container(
              margin: EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[


                  TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText:"Your weight on Earth",
                        hintText: "In Pounds",
                        icon: Icon(Icons.person_outline)
                    ),
                  ),

                  Padding(padding: EdgeInsets.all(5.0),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //3 Radio Buttons
                      Radio<int>(activeColor: Colors.brown,
                          value: 0, groupValue: radioValue, onChanged: radioValueChanged),

                      Text("Pluto", style: TextStyle(color : Colors.white30),),


                      Radio<int>(activeColor: Colors.red,
                          value: 1, groupValue: radioValue, onChanged: radioValueChanged),

                      Text("Mars", style: TextStyle(color : Colors.white30),),


                      Radio<int>(activeColor: Colors.orangeAccent,
                          value: 2, groupValue: radioValue, onChanged: radioValueChanged),

                      Text("Venus", style: TextStyle(color : Colors.white30),),


                    ],
                  ),

                  Padding(padding: EdgeInsets.all(15.6),),

                  Text(
                    weightController.text.isEmpty? "Please Enter Weight" : _formattedText + "lbs",
                   // "$_formattedText lbs",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w500
                    ),
                  )

                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  double calculate(String text, double d) {
    if(int.parse(text).toString().isNotEmpty && int.parse(text) > 0)
      return int.parse(text)*d;
    else
      print("Wrong");

    return int.parse("180.0") * 0.38;
  }

}