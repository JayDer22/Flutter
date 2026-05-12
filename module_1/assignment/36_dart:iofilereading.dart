import 'dart:io';

void main() async {
  File file = File('example.txt');

  
  String data = "Hello jay\nWelcome
  try {
    
    await file.writeAsString(data);
    print("Data written successfully.");

  
    String content = await file.readAsString();

    print("File Content:");
    print(content);

  } on FileSystemException catch (e) {
    print("File Error: ${e.message}");
  } catch (e) {
    print("Unexpected Error: $e");
  }
}
