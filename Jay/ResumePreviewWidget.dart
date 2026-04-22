import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dashboard2.dart';

class ResumePreviewWidget extends StatelessWidget {
  const ResumePreviewWidget({super.key});

  Widget _buildPreviewSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 6.0),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: goldPrimary,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildPreviewText(String text, {TextStyle? style}) {
    if (text.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Text(text, style: style ?? const TextStyle(color: textPrimary, fontSize: 13)),
    );
  }

  Widget _buildBulletPoint(String text) {
    if (text.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("• ", style: TextStyle(color: textPrimary, fontSize: 13)),
          Expanded(child: Text(text, style: const TextStyle(color: textPrimary, fontSize: 13))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ResumeData resumeData = context.watch<ResumeData>();

    final List<String> jobDescriptionPoints = resumeData.jobDescription
        .split('\n')
        .where((String s) => s.trim().isNotEmpty)
        .map<String>((String s) => s.trim().startsWith('•') ? s.trim().substring(1).trim() : s.trim()) // Remove leading bullets if present
        .toList();

    // Updated skills parsing to split by both commas and newlines
    final List<String> skillsList = resumeData.skills
        .split(RegExp(r'[,\n]')) // Split by comma OR newline
        .where((String s) => s.trim().isNotEmpty)
        .map<String>((String s) => s.trim())
        .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Personal Information (Name and contact - more compact)
          if (resumeData.name.isNotEmpty)
            _buildPreviewText(
              resumeData.name,
              style: const TextStyle(color: goldPrimary, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          if (resumeData.jobTitle.isNotEmpty)
            _buildPreviewText(
              resumeData.jobTitle,
              style: const TextStyle(color: textPrimary, fontSize: 16, fontWeight: FontWeight.w600),
            ),
          const SizedBox(height: 8),
          Text(
            <String>[resumeData.email, resumeData.phone, resumeData.linkedinOrPortfolio]
                .where((String s) => s.isNotEmpty)
                .join(' | '),
            style: const TextStyle(color: textSecondary, fontSize: 12),
          ),

          // Summary
          if (resumeData.summary.isNotEmpty) ...<Widget>[
            _buildPreviewSectionTitle("Summary"),
            _buildPreviewText(resumeData.summary, style: const TextStyle(color: textPrimary, fontSize: 13, height: 1.4)),
          ],

          // Experience
          if (resumeData.jobTitle.isNotEmpty || resumeData.company.isNotEmpty || resumeData.jobDescription.isNotEmpty) ...<Widget>[
            _buildPreviewSectionTitle("Experience"),
            if (resumeData.jobTitle.isNotEmpty)
              _buildPreviewText(
                resumeData.jobTitle,
                style: const TextStyle(color: textPrimary, fontSize: 14, fontWeight: FontWeight.bold),
              ),
            if (resumeData.company.isNotEmpty || resumeData.jobLocation.isNotEmpty)
              _buildPreviewText(
                '${resumeData.company}${resumeData.company.isNotEmpty && resumeData.jobLocation.isNotEmpty ? ' - ' : ''}${resumeData.jobLocation}',
                style: const TextStyle(color: textSecondary, fontSize: 12, fontStyle: FontStyle.italic),
              ),
            if (resumeData.jobStartDate.isNotEmpty || resumeData.jobEndDate.isNotEmpty)
              _buildPreviewText(
                '${resumeData.jobStartDate}${resumeData.jobStartDate.isNotEmpty && resumeData.jobEndDate.isNotEmpty ? ' - ' : ''}${resumeData.jobEndDate}',
                style: const TextStyle(color: textSecondary, fontSize: 12),
              ),
            if (jobDescriptionPoints.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: jobDescriptionPoints.map<Widget>((String point) => _buildBulletPoint(point)).toList(),
              ),
          ],

          // Education
          if (resumeData.degree.isNotEmpty || resumeData.university.isNotEmpty || resumeData.educationDetails.isNotEmpty) ...<Widget>[
            _buildPreviewSectionTitle("Education"),
            if (resumeData.degree.isNotEmpty)
              _buildPreviewText(
                resumeData.degree,
                style: const TextStyle(color: textPrimary, fontSize: 14, fontWeight: FontWeight.bold),
              ),
            if (resumeData.university.isNotEmpty || resumeData.educationLocation.isNotEmpty)
              _buildPreviewText(
                '${resumeData.university}${resumeData.university.isNotEmpty && resumeData.educationLocation.isNotEmpty ? ' - ' : ''}${resumeData.educationLocation}',
                style: const TextStyle(color: textSecondary, fontSize: 12, fontStyle: FontStyle.italic),
              ),
            if (resumeData.educationStartDate.isNotEmpty || resumeData.educationEndDate.isNotEmpty)
              _buildPreviewText(
                '${resumeData.educationStartDate}${resumeData.educationStartDate.isNotEmpty && resumeData.educationEndDate.isNotEmpty ? ' - ' : ''}${resumeData.educationEndDate}',
                style: const TextStyle(color: textSecondary, fontSize: 12),
              ),
            if (resumeData.educationDetails.isNotEmpty)
              _buildPreviewText(
                resumeData.educationDetails,
                style: const TextStyle(color: textPrimary, fontSize: 13),
              ),
          ],

          // Skills
          if (skillsList.isNotEmpty) ...<Widget>[
            _buildPreviewSectionTitle("Skills"),
            Wrap(
              spacing: 6.0,
              runSpacing: 6.0,
              children: skillsList.map<Widget>((String skill) {
                return Chip(
                  label: Text(skill, style: const TextStyle(color: baseBackground, fontSize: 12)),
                  backgroundColor: goldPrimary.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                );
              }).toList(),
            ),
          ],
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}