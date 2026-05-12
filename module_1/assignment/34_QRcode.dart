
import 'package:qr/qr.dart';

void main() {
  String data = "Hello jay!";

  
  final qrCode = QrCode(
    4,
    QrErrorCorrectLevel.L,
  );

  qrCode.addData(data);

  
  final qrImage = QrImage(qrCode);


  for (int y = 0; y < qrImage.moduleCount; y++) {
    String row = "";

    for (int x = 0; x < qrImage.moduleCount; x++) {
      if (qrImage.isDark(y, x)) {
        row += "██";
      } else {
        row += "  ";
      }
    }

    print(row);
  }
}
