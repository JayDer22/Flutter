import 'dart:io';

void main() async {
  // File name
  File file = File('example.txt');

  // Data to write
  String data = "Hello Riddhita!\nWelcome to Dart File Handling.";

  try {
    // Write data to file
    await file.writeAsString(data);
    print("Data written successfully.\n");

    // Read data from file
    String content = await file.readAsString();

    print("File Content:");
    print(content);

  } on FileSystemException catch (e) {
    print("File Error: ${e.message}");
  } catch (e) {
    print("Unexpected Error: $e");
  }
}
