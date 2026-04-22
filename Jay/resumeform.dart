import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ResumeData extends ChangeNotifier {
  String _name;
  String _email;
  String _phone;
  String _linkedinOrPortfolio;
  String _summary;
  String _jobTitle;
  String _company;
  String _jobLocation;
  String _jobStartDate;
  String _jobEndDate;
  String _jobDescription;
  String _degree;
  String _university;
  String _educationLocation;
  String _educationStartDate;
  String _educationEndDate;
  String _educationDetails;
  String _skills;

  ResumeData()
      : _name = '',
        _email = '',
        _phone = '',
        _linkedinOrPortfolio = '',
        _summary = '',
        _jobTitle = '',
        _company = '',
        _jobLocation = '',
        _jobStartDate = '',
        _jobEndDate = '',
        _jobDescription = '',
        _degree = '',
        _university = '',
        _educationLocation = '',
        _educationStartDate = '',
        _educationEndDate = '',
        _educationDetails = '',
        _skills = '';

  String get name => _name;
  set name(String value) {
    if (_name != value) {
      _name = value;
      notifyListeners();
    }
  }

  String get email => _email;
  set email(String value) {
    if (_email != value) {
      _email = value;
      notifyListeners();
    }
  }

  String get phone => _phone;
  set phone(String value) {
    if (_phone != value) {
      _phone = value;
      notifyListeners();
    }
  }

  String get linkedinOrPortfolio => _linkedinOrPortfolio;
  set linkedinOrPortfolio(String value) {
    if (_linkedinOrPortfolio != value) {
      _linkedinOrPortfolio = value;
      notifyListeners();
    }
  }

  String get summary => _summary;
  set summary(String value) {
    if (_summary != value) {
      _summary = value;
      notifyListeners();
    }
  }

  String get jobTitle => _jobTitle;
  set jobTitle(String value) {
    if (_jobTitle != value) {
      _jobTitle = value;
      notifyListeners();
    }
  }

  String get company => _company;
  set company(String value) {
    if (_company != value) {
      _company = value;
      notifyListeners();
    }
  }

  String get jobLocation => _jobLocation;
  set jobLocation(String value) {
    if (_jobLocation != value) {
      _jobLocation = value;
      notifyListeners();
    }
  }

  String get jobStartDate => _jobStartDate;
  set jobStartDate(String value) {
    if (_jobStartDate != value) {
      _jobStartDate = value;
      notifyListeners();
    }
  }

  String get jobEndDate => _jobEndDate;
  set jobEndDate(String value) {
    if (_jobEndDate != value) {
      _jobEndDate = value;
      notifyListeners();
    }
  }

  String get jobDescription => _jobDescription;
  set jobDescription(String value) {
    if (_jobDescription != value) {
      _jobDescription = value;
      notifyListeners();
    }
  }

  String get degree => _degree;
  set degree(String value) {
    if (_degree != value) {
      _degree = value;
      notifyListeners();
    }
  }

  String get university => _university;
  set university(String value) {
    if (_university != value) {
      _university = value;
      notifyListeners();
    }
  }

  String get educationLocation => _educationLocation;
  set educationLocation(String value) {
    if (_educationLocation != value) {
      _educationLocation = value;
      notifyListeners();
    }
  }

  String get educationStartDate => _educationStartDate;
  set educationStartDate(String value) {
    if (_educationStartDate != value) {
      _educationStartDate = value;
      notifyListeners();
    }
  }

  String get educationEndDate => _educationEndDate;
  set educationEndDate(String value) {
    if (_educationEndDate != value) {
      _educationEndDate = value;
      notifyListeners();
    }
  }

  String get educationDetails => _educationDetails;
  set educationDetails(String value) {
    if (_educationDetails != value) {
      _educationDetails = value;
      notifyListeners();
    }
  }

  String get skills => _skills;
  set skills(String value) {
    if (_skills != value) {
      _skills = value;
      notifyListeners();
    }
  }
}


// class ResumeForm extends StatelessWidget {
//   const ResumeForm({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Resume Builder"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//               decoration: const InputDecoration(labelText: "Name"),
//             ),
//             TextField(
//               decoration: const InputDecoration(labelText: "Email"),
//             ),
//             TextField(
//               decoration: const InputDecoration(labelText: "Phone"),
//             ),
//             const SizedBox(height: 20),
//
//             ElevatedButton(
//               onPressed: () {
//                 // later: go to preview
//               },
//               child: const Text("Next"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }