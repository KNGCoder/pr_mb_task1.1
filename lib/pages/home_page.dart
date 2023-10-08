import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic displaytxt = 20;
  Widget calcButton(String btnTxt, Color btnColor, Color txtColor) {
    return Container(
      margin: const EdgeInsets.all(0),
      child: ElevatedButton(
        onPressed: () {
          calculation(btnTxt);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(btnColor),
          padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
        ),
        child: Text(
          btnTxt,
          style: TextStyle(
            fontSize: 26,
            color: txtColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '$text',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 80
                      ),
                    ), 
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                calcButton('C', Colors.grey, Colors.black),
                calcButton('+/-', Colors.grey, Colors.black),
                calcButton('%', Colors.grey, Colors.black),
                calcButton('/', Colors.amber.shade700, Colors.white),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                calcButton('7', Colors.grey.shade800, Colors.white),
                calcButton('8', Colors.grey.shade800, Colors.white),
                calcButton('9', Colors.grey.shade800, Colors.white),
                calcButton('*', Colors.amber.shade700, Colors.white),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                calcButton('4', Colors.grey.shade800, Colors.white),
                calcButton('5', Colors.grey.shade800, Colors.white),
                calcButton('6', Colors.grey.shade800, Colors.white),
                calcButton('-', Colors.amber.shade700, Colors.white),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                calcButton('1', Colors.grey.shade800, Colors.white),
                calcButton('2', Colors.grey.shade800, Colors.white),
                calcButton('3', Colors.grey.shade800, Colors.white),
                calcButton('+', Colors.amber.shade700, Colors.white),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    calculation('0');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey.shade800),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.fromLTRB(28, 20, 128, 20)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))
                  ),
                  child: const Text(
                    '0',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
                calcButton('.', Colors.grey.shade800, Colors.white),
                calcButton('=', Colors.amber.shade700, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ), 
      ),
    );
  }


  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText){
    if (btnText == 'C') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if(opr == '=' && btnText == '='){
      if (preOpr == '+') {
        finalResult = add();}
      else if (preOpr == '-'){
        finalResult = sub();}
      else if (preOpr == '*'){
        finalResult = mul();} 
      else if (preOpr == '/'){
        finalResult = div();}   
    }else if (
      btnText == '+' || 
      btnText == '-' ||
      btnText == '*' || 
      btnText == '/' ||
      btnText == '=' ) 
      { if (numOne == 0) {numOne = double.parse(result);}
      else {numTwo = double.parse(result);}

      if (opr == '+'){
      finalResult = add();}
      else if (opr == '-'){
      finalResult = sub();}
      else if (opr == '*'){
      finalResult = mul();}
      else if (opr == '/'){
      finalResult = div();}
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%'){
      result = numOne / 100;
      finalResult = doesContainerDecimal(result);
    } else if (btnText == '.'){
      if (!result.toString().contains('.')){
        result = '$result.';
      }
      finalResult = result;
    } else if (btnText == '+/-'){
      result.toString().startsWith('-')
      ?result = result.toString().substring(1)
      :result = '-$result';
     finalResult = result; 
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainerDecimal(result);
  }

   String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainerDecimal(result);
  }

   String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainerDecimal(result);
  }

   String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainerDecimal(result);
  }
  
  String doesContainerDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if(!(int.parse(splitDecimal[1])>0)){
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }

}