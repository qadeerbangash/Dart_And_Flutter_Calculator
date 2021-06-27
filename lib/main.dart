import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: "CALCULATOR",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: cal(),
    );
  }
}

class cal extends StatefulWidget {
  @override
  _calState createState() => _calState();
}

class _calState extends State<cal> {
  int firstvalue;
  String show;
  int secondvalue;
  String texttodisplay = "";
  String res;
  String operatortoshow;

  void btnclick(String btnvalue) {
    if (btnvalue == "c") {
      texttodisplay = "";
      
      firstvalue = 0;
      secondvalue = 0;
      res = "";
      show = "";
    } else if (btnvalue == "+" ||
        btnvalue == "-" ||
        btnvalue == "x" ||
        btnvalue == "/") {
      firstvalue = int.parse(texttodisplay);
      res = "";

      operatortoshow = btnvalue;
    } else if (btnvalue == "=") {
      secondvalue = int.parse(texttodisplay);

      if (operatortoshow == "+") {
        res = (firstvalue + secondvalue).toString();
      }
      if (operatortoshow == "-") {
        res = (firstvalue - secondvalue).toString();
      }
      if (operatortoshow == "x") {
        res = (firstvalue * secondvalue).toString();
      }
      if (operatortoshow == "/") {
        res = (firstvalue / secondvalue).toString();
      }
    } else {
      res = int.parse(texttodisplay + btnvalue).toString();
    }

    setState(() {
      texttodisplay = res;
    });
  }

  Widget hkbtn(btnvalue) {
    return Expanded(
        child: OutlineButton(
      padding: EdgeInsets.all(20.0),
      onPressed: () => btnclick(btnvalue),
      splashColor: Colors.amberAccent,
      child: Text(
        "$btnvalue",
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Center(
          child: Text(
            "Calculator",
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(8.0),
              child: Text(
                "$firstvalue  $operatortoshow $secondvalue",
              ),
            )),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.bottomRight,
                
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              
              
              child: Row( 
                
                children: [
                  hkbtn("9"),
                  hkbtn("8"),
                  hkbtn("7"),
                  hkbtn("+"),
                  
                ],
                
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  hkbtn("6"),
                  hkbtn("5"),
                  hkbtn("4"),
                  hkbtn("-"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  hkbtn("3"),
                  hkbtn("2"),
                  hkbtn("1"),
                  hkbtn("x"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  hkbtn("c"),
                  hkbtn("0"),
                  hkbtn("="),
                  hkbtn("/"),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "Created By Qadeer Hussain",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.0,
                  backgroundColor: Colors.blue, 
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  
                  ),
                )
                
                )
              ],
            
            )
          ],
        ),
      ),
    );
  }
}
