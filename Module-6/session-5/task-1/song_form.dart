import 'dart:convert';
import 'package:flutter/material.dart';

class SongForm extends StatefulWidget {
  const SongForm({super.key});

  @override
  State<SongForm> createState() => _SongFormState();
}

class _SongFormState extends State<SongForm> {
  final _formKey = GlobalKey<FormState>();
  final _songNameController = TextEditingController();
  final _artistController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final payload = {
        'songName': _songNameController.text,
        'artist': _artistController.text,
      };
      print("JSON Payload: ${jsonEncode(payload)}");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payload printed to console')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 1: Song Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _songNameController,
                decoration: const InputDecoration(labelText: 'Song Name'),
                validator: (value) => value!.isEmpty ? 'Enter song name' : null,
              ),
              TextFormField(
                controller: _artistController,
                decoration: const InputDecoration(labelText: 'Artist'),
                validator: (value) => value!.isEmpty ? 'Enter artist' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
