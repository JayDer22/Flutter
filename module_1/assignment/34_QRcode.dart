
import 'package:qr/qr.dart';

void main() {
  String data = "Hello Riddhita!";

  // Create QR code
  final qrCode = QrCode(
    4,
    QrErrorCorrectLevel.L,
  );

  qrCode.addData(data);

  // Create QR image
  final qrImage = QrImage(qrCode);

  // Print QR in console
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
