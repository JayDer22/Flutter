import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'resumeform.dart';

class ResumeTemplate1 extends StatelessWidget {
  const ResumeTemplate1({super.key});

  @override
  Widget build(BuildContext context) {
    final r = context.watch<ResumeData>();

    return Column(
      children: [
        _header(r), // ✅ FULL WIDTH HEADER

        Expanded(
          child: Row(
            children: [
              _leftPanel(r),   // ✅ starts below header
              Expanded(child: _rightPanel(r)),
            ],
          ),
        ),
      ],
    );
  }

  // 🔷 HEADER
  Widget _header(ResumeData r) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      color: Colors.grey[200],
      child: Row(
        children: [
          const CircleAvatar(radius: 30, backgroundColor: Colors.grey),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  r.name.isEmpty ? "Your Name" : r.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  r.jobTitle.isEmpty ? "Job Title" : r.jobTitle,
                  style:
                  const TextStyle(fontSize: 13, color: Colors.black54),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // 🔷 LEFT PANEL (FULL HEIGHT)
  Widget _leftPanel(ResumeData r) {
    final skills = r.skills
        .split(RegExp(r'[,\n]'))
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    return Container(
      width: 140,
      height: double.infinity, // ✅ fill full height
      color: Colors.grey[100],
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle("CONTACT"),
          const SizedBox(height: 10),

          if (r.email.isNotEmpty) _iconText(Icons.email, r.email),
          if (r.phone.isNotEmpty) _iconText(Icons.phone, r.phone),
          if (r.jobLocation.isNotEmpty)
            _iconText(Icons.location_on, r.jobLocation),
          if (r.linkedinOrPortfolio.isNotEmpty)
            _iconText(Icons.link, r.linkedinOrPortfolio),

          const SizedBox(height: 20),

          _sectionTitle("SKILLS"),
          const SizedBox(height: 10),

          if (skills.isEmpty)
            const Text("Add skills", style: TextStyle(fontSize: 11))
          else
            ...skills.map((s) => _skillBar(s)),
        ],
      ),
    );
  }
  // 🔷 RIGHT PANEL
  Widget _rightPanel(ResumeData r) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle("SUMMARY"),
            const SizedBox(height: 8),
            Text(
              r.summary.isEmpty ? "Add your summary" : r.summary,
              style: const TextStyle(fontSize: 12, height: 1.4),
            ),

            const SizedBox(height: 16),

            _sectionTitle("EXPERIENCE"),
            const SizedBox(height: 8),

            if (r.jobTitle.isNotEmpty)
              Text(
                r.jobTitle,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 14),
              ),

            if (r.company.isNotEmpty || r.jobLocation.isNotEmpty)
              Text(
                "${r.company}"
                    "${r.jobLocation.isNotEmpty ? " • ${r.jobLocation}" : ""}",
                style: const TextStyle(fontSize: 12),
              ),

            if (r.jobStartDate.isNotEmpty || r.jobEndDate.isNotEmpty)
              Text(
                "${r.jobStartDate} - ${r.jobEndDate.isEmpty ? "Present" : r.jobEndDate}",
                style:
                const TextStyle(fontSize: 11, color: Colors.orange),
              ),

            const SizedBox(height: 6),

            if (r.jobDescription.isNotEmpty)
              ...r.jobDescription.split('\n').map(
                    (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("• "),
                      Expanded(
                        child: Text(
                          e.trim(),
                          style: const TextStyle(fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            const SizedBox(height: 16),

            _sectionTitle("EDUCATION"),
            const SizedBox(height: 8),

            if (r.degree.isNotEmpty)
              Text(
                r.degree,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

            if (r.university.isNotEmpty || r.educationLocation.isNotEmpty)
              Text(
                "${r.university}"
                    "${r.educationLocation.isNotEmpty ? " • ${r.educationLocation}" : ""}",
                style: const TextStyle(fontSize: 12),
              ),

            if (r.educationStartDate.isNotEmpty ||
                r.educationEndDate.isNotEmpty)
              Text(
                "${r.educationStartDate} - ${r.educationEndDate}",
                style:
                const TextStyle(fontSize: 11, color: Colors.orange),
              ),

            if (r.educationDetails.isNotEmpty)
              Text(
                r.educationDetails,
                style: const TextStyle(fontSize: 11),
              ),
          ],
        ),
      ),
    );
  }

  // 🔷 SECTION TITLE
  Widget _sectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontSize: 12),
        ),
        const SizedBox(height: 4),
        Container(height: 1, color: Colors.grey[400]),
      ],
    );
  }

  // 🔷 ICON TEXT
  Widget _iconText(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Icon(icon, size: 14, color: Colors.grey[700]),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 11),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // 🔷 SKILL BAR
  Widget _skillBar(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 11),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 4),
              const Text("90%", style: TextStyle(fontSize: 11)),
            ],
          ),
          const SizedBox(height: 4),
          Container(
            height: 4,
            width: double.infinity,
            color: Colors.grey[300],
            child: FractionallySizedBox(
              widthFactor: 0.9,
              child: Container(color: Colors.blueGrey),
            ),
          ),
        ],
      ),
    );
  }
}