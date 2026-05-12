
import 'package:path/path.dart' as p;

void main() {
  // Sample file path
  String filePath = "/storage/emulated/0/Documents/report.pdf";

  // Extract directory
  String directory = p.dirname(filePath);

  // Extract filename with extension
  String filename = p.basename(filePath);

  // Extract file extension
  String extension = p.extension(filePath);

  // Extract filename without extension
  String filenameWithoutExtension =
  p.basenameWithoutExtension(filePath);

  // Print results
  print("Full Path: $filePath");
  print("Directory: $directory");
  print("Filename: $filename");
  print("Extension: $extension");
  print("Filename without extension: $filenameWithoutExtension");
}
