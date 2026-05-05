import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page extends StatefulWidget
{
  @override
  State<Page> createState() => pageState();
}
class pageState extends State<Page>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Print Page",style: TextStyle(fontSize: 18.00,fontWeight: FontWeight.bold,color: Colors.yellowAccent),),),
    );
  }

}

