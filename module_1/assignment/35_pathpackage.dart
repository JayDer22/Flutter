
import 'package:path/path.dart' as p;

void main() {

  String filePath = "/storage/emulated/0/Documents/report.pdf";

  
  String directory = p.dirname(filePath);

  
  String filename = p.basename(filePath);

  String extension = p.extension(filePath);

  
  String filenameWithoutExtension =
  p.basenameWithoutExtension(filePath);


  print("Full Path: $filePath");
  print("Directory: $directory");
  print("Filename: $filename");
  print("Extension: $extension");
  print("Filename without extension: $filenameWithoutExtension");
}
