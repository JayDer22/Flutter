import 'dart:io';

void main() {
  Map<String, String> addressBook = {};

  while (true) {
    print("\n--- Address Book Menu ---");
    print("1. Add Entry");
    print("2. Update Entry");
    print("3. Remove Entry");
    print("4. Display All");
    print("5. Exit");

    stdout.write("Enter your choice: ");
    String choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        // Add Entry
        stdout.write("Enter Name: ");
        String name = stdin.readLineSync()!;

        stdout.write("Enter Phone Number: ");
        String number = stdin.readLineSync()!;

        addressBook[name] = number;
        print("Entry Added!");
        break;

      case '2':
        // Update Entry
        stdout.write("Enter Name to Update: ");
        String name = stdin.readLineSync()!;

        if (addressBook.containsKey(name)) {
          stdout.write("Enter New Phone Number: ");
          String number = stdin.readLineSync()!;

          addressBook.update(name, (value) => number);
          print("Entry Updated!");
        } else {
          print("Name not found!");
        }
        break;

      case '3':
        // Remove Entry
        stdout.write("Enter Name to Remove: ");
        String name = stdin.readLineSync()!;

        addressBook.remove(name);
        print("Entry Removed!");
        break;

      case '4':
        // Display All
        print("\n--- Address Book ---");
        addressBook.forEach((key, value) {
          print("Name: $key, Phone: $value");
        });
        break;

      case '5':
        print("Exiting...");
        return;

      default:
        print("Invalid Choice!");
    }
  }
}
