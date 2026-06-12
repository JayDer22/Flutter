import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:work_space/model/Data.dart';

import '../model/provider_model.dart';

class ProviderDetailScreen extends StatefulWidget {
  final ProviderModel Provider;

  const ProviderDetailScreen({super.key, required this.Provider});

  @override
  State<ProviderDetailScreen> createState() => _ProviderDetailScreenState();
}

class _ProviderDetailScreenState extends State<ProviderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Provider.name, style: TextStyle(color: Colors.red)),
      ),
      body: Padding(
          padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text('Service: ${widget.Provider.service}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
            SizedBox(height: 5,),
            Text('Experience: ${widget.Provider.experience}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
            SizedBox(height: 5,),
            Text('Rating: ⭐${widget.Provider.rating}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
            SizedBox(height: 5,),
            Text('Phone: ${widget.Provider.phone}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
            SizedBox(height: 5,),
            Text('Address: ${widget.Provider.address}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
            SizedBox(height: 5,),
            Text('About: ${widget.Provider.about}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
            SizedBox(height: 5,),
            ElevatedButton(
              onPressed: () async {
                final Uri phoneUri = Uri(
                  scheme: 'tel',
                  path: widget.Provider.phone,
                );

                if (await canLaunchUrl(phoneUri)) {
                  await launchUrl(phoneUri);
                }
              },
              child: const Text("Call"),
            ),
            SizedBox(width: 8,),
            ElevatedButton(onPressed: (){
              launchUrl(Uri.parse('https://wa.me/91${widget.Provider.phone}'));
            }, child: Text("Whatsapp")),
          ],
        ),
      ),
    );
  }
}
