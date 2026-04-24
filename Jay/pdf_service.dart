import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'resumeform.dart';

Future<pw.Document> generateResumePdf(ResumeData r) async {
  final pdf = pw.Document();

  final skills = r.skills
      .split(RegExp(r'[,\n]'))
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .toList();

  pdf.addPage(
    pw.Page(
      margin: pw.EdgeInsets.zero,
      build: (context) {
        return pw.Column(
          children: [

            // 🔷 HEADER
            pw.Container(
              width: double.infinity,
              padding: const pw.EdgeInsets.all(16),
              color: PdfColors.grey300,
              child: pw.Row(
                children: [
                  pw.Container(
                    width: 50,
                    height: 50,
                    decoration: const pw.BoxDecoration(
                      color: PdfColors.grey,
                      shape: pw.BoxShape.circle,
                    ),
                  ),
                  pw.SizedBox(width: 12),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        r.name.isEmpty ? "Your Name" : r.name,
                        style: pw.TextStyle(
                            fontSize: 16, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Text(
                        r.jobTitle.isEmpty ? "Job Title" : r.jobTitle,
                        style: const pw.TextStyle(fontSize: 10),
                      ),
                    ],
                  )
                ],
              ),
            ),

            // 🔷 BODY
            pw.Expanded(
              child: pw.Row(
                children: [

                  // 🔷 LEFT PANEL
                  pw.Container(
                    width: 120,
                    color: PdfColors.grey100,
                    padding: const pw.EdgeInsets.all(10),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [

                        _pdfSectionTitle("CONTACT"),
                        if (r.email.isNotEmpty) pw.Text(r.email, style: const pw.TextStyle(fontSize: 8)),
                        if (r.phone.isNotEmpty) pw.Text(r.phone, style: const pw.TextStyle(fontSize: 8)),
                        if (r.jobLocation.isNotEmpty) pw.Text(r.jobLocation, style: const pw.TextStyle(fontSize: 8)),
                        if (r.linkedinOrPortfolio.isNotEmpty)
                          pw.Text(r.linkedinOrPortfolio, style: const pw.TextStyle(fontSize: 8)),

                        pw.SizedBox(height: 10),

                        _pdfSectionTitle("SKILLS"),
                        pw.SizedBox(height: 4),

                        ...skills.map((s) => pw.Text("• $s", style: const pw.TextStyle(fontSize: 8))),
                      ],
                    ),
                  ),

                  // 🔷 RIGHT PANEL
                  pw.Expanded(
                    child: pw.Padding(
                      padding: const pw.EdgeInsets.all(12),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [

                          _pdfSectionTitle("SUMMARY"),
                          pw.Text(r.summary, style: const pw.TextStyle(fontSize: 9)),

                          pw.SizedBox(height: 10),

                          _pdfSectionTitle("EXPERIENCE"),

                          if (r.jobTitle.isNotEmpty)
                            pw.Text(r.jobTitle,
                                style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10)),

                          if (r.company.isNotEmpty)
                            pw.Text(r.company, style: const pw.TextStyle(fontSize: 9)),

                          if (r.jobStartDate.isNotEmpty)
                            pw.Text("${r.jobStartDate} - ${r.jobEndDate}", style: const pw.TextStyle(fontSize: 8)),

                          pw.SizedBox(height: 5),

                          if (r.jobDescription.isNotEmpty)
                            ...r.jobDescription.split('\n').map(
                                  (e) => pw.Bullet(text: e, style: const pw.TextStyle(fontSize: 8)),
                            ),

                          pw.SizedBox(height: 10),

                          _pdfSectionTitle("EDUCATION"),

                          if (r.degree.isNotEmpty)
                            pw.Text(r.degree,
                                style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10)),

                          if (r.university.isNotEmpty)
                            pw.Text(r.university, style: const pw.TextStyle(fontSize: 9)),

                          if (r.educationStartDate.isNotEmpty)
                            pw.Text("${r.educationStartDate} - ${r.educationEndDate}",
                                style: const pw.TextStyle(fontSize: 8)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );

  return pdf;
}

// 🔹 Section title for PDF
pw.Widget _pdfSectionTitle(String title) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(
        title,
        style: pw.TextStyle(
          fontWeight: pw.FontWeight.bold,
          fontSize: 10,
        ),
      ),
      pw.Container(height: 1, color: PdfColors.grey),
      pw.SizedBox(height: 4),
    ],
  );
}