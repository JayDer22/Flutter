import 'package:flutter/material.dart';

import '../model/service_model.dart';

class Carddesign extends StatefulWidget {
  final ServiceModel model;
  final VoidCallback onTap;

  const Carddesign({super.key,
    required this.onTap,
    required this.model
  });

  @override
  State<Carddesign> createState() => _CarddesignState();
}

class _CarddesignState extends State<Carddesign> {
  @override
  Widget build(BuildContext context) {
    return Card(elevation: 4,
        shadowColor: Colors.green,
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
        padding:const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Icon(widget.model.icon,size: 40,color: Colors.red,),
              SizedBox(height: 8,),
              Text(widget.model.title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold ),),
              SizedBox(height: 8,),
              Text(widget.model.description,style: TextStyle(fontSize: 12 ),),

            ],
          ),
        ),
    ),
    );
  }
}
