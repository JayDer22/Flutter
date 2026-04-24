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
  List<String> _summarySuggestions = [];

  List<String> get summarySuggestions => _summarySuggestions;

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

  void generateSummarySuggestions() {
    final List<String> suggestions = [];

    final namePart = _name.isNotEmpty ? _name : "A dedicated professional";
    final titlePart = _jobTitle.isNotEmpty ? _jobTitle : "professional";
    final companyPart = _company.isNotEmpty
        ? " with experience at $_company"
        : "";

    final skillsList = _skills
        .split(RegExp(r'[,\n]'))
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    final skillsPart = skillsList.isNotEmpty
        ? "Skilled in ${skillsList.take(4).join(', ')}"
        : "";

    final educationPart = (_degree.isNotEmpty && _university.isNotEmpty)
        ? "Holds a $_degree from $_university"
        : "";

    // 🔹 Summary 1 (Professional)
    suggestions.add(
        "$namePart is a results-driven $titlePart$companyPart. $skillsPart. "
            "Focused on delivering high-quality work and contributing to organizational success."
    );

    // 🔹 Summary 2 (Growth + Skills)
    suggestions.add(
        "Motivated $titlePart with a strong background in problem-solving and innovation. "
            "$skillsPart. Passionate about continuous learning and applying skills to real-world challenges."
    );

    // 🔹 Summary 3 (Education + Career)
    suggestions.add(
        "$educationPart. Currently working as a $titlePart$companyPart. "
            "Brings a strong mix of technical knowledge and practical experience to every project."
    );

    _summarySuggestions = suggestions;
    notifyListeners();
  }
}

