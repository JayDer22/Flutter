import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'resumeform.dart';

import 'color.dart';
import 'dashboard.dart' hide goldPrimary;
import 'color.dart' hide textPrimary, textSecondary, cardColor, borderColor, baseBackground, surfaceColor;
import 'resume_preview_widget.dart';
import 'package:printing/printing.dart';
import 'pdf_service.dart';

class ResumeBuilderScreen extends StatefulWidget {
  const ResumeBuilderScreen({super.key});

  @override
  State<ResumeBuilderScreen> createState() => _ResumeBuilderScreenState();
}

class _ResumeBuilderScreenState extends State<ResumeBuilderScreen> with TickerProviderStateMixin {
  // Controllers for all text fields
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _linkedinOrPortfolioController;
  late TextEditingController _summaryController;
  late TextEditingController _jobTitleController;
  late TextEditingController _companyController;
  late TextEditingController _jobLocationController;
  late TextEditingController _jobStartDateController;
  late TextEditingController _jobEndDateController;
  late TextEditingController _jobDescriptionController;
  late TextEditingController _degreeController;
  late TextEditingController _universityController;
  late TextEditingController _educationLocationController;
  late TextEditingController _educationStartDateController;
  late TextEditingController _educationEndDateController;
  late TextEditingController _educationDetailsController;
  late TextEditingController _skillsController;

  late TabController _tabController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final ResumeData resumeData = context.read<ResumeData>();

    _nameController = TextEditingController(text: resumeData.name);
    _emailController = TextEditingController(text: resumeData.email);
    _phoneController = TextEditingController(text: resumeData.phone);
    _linkedinOrPortfolioController = TextEditingController(text: resumeData.linkedinOrPortfolio);
    _summaryController = TextEditingController(text: resumeData.summary);
    _jobTitleController = TextEditingController(text: resumeData.jobTitle);
    _companyController = TextEditingController(text: resumeData.company);
    _jobLocationController = TextEditingController(text: resumeData.jobLocation);
    _jobStartDateController = TextEditingController(text: resumeData.jobStartDate);
    _jobEndDateController = TextEditingController(text: resumeData.jobEndDate);
    _jobDescriptionController = TextEditingController(text: resumeData.jobDescription);
    _degreeController = TextEditingController(text: resumeData.degree);
    _universityController = TextEditingController(text: resumeData.university);
    _educationLocationController = TextEditingController(text: resumeData.educationLocation);
    _educationStartDateController = TextEditingController(text: resumeData.educationStartDate);
    _educationEndDateController = TextEditingController(text: resumeData.educationEndDate);
    _educationDetailsController = TextEditingController(text: resumeData.educationDetails);
    _skillsController = TextEditingController(text: resumeData.skills);

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _linkedinOrPortfolioController.dispose();
    _summaryController.dispose();
    _jobTitleController.dispose();
    _companyController.dispose();
    _jobLocationController.dispose();
    _jobStartDateController.dispose();
    _jobEndDateController.dispose();
    _jobDescriptionController.dispose();
    _degreeController.dispose();
    _universityController.dispose();
    _educationLocationController.dispose();
    _educationStartDateController.dispose();
    _educationEndDateController.dispose();
    _educationDetailsController.dispose();
    _skillsController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  // Helper widget for form section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(color: goldPrimary, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Helper for text form fields
  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    String? hintText,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    required void Function(String) onChanged,
    TextInputAction textInputAction = TextInputAction.next, // Added textInputAction parameter
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: const TextStyle(color: textPrimary),
        textInputAction: textInputAction, // Applied textInputAction
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          labelStyle: const TextStyle(color: textSecondary),
          hintStyle: TextStyle(color: textSecondary.withOpacity(0.6)),
          filled: true,
          fillColor: cardColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: borderColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: goldPrimary, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ResumeData resumeData = context.read<ResumeData>();

    return Scaffold(
      backgroundColor: baseBackground,
      appBar: AppBar(
        title: const Text("Resume Builder", style: TextStyle(color: textPrimary)),
        backgroundColor: surfaceColor,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: textSecondary),
          onPressed: () => Navigator.of(context).pop(),
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf, color: textSecondary),
            onPressed: () async {
              try {
                final resumeData = context.read<ResumeData>();

                final pdf = await generateResumePdf(resumeData);

                await Printing.layoutPdf(
                  onLayout: (format) async => pdf.save(),
                );
              } catch (e) {
                print("PDF ERROR: $e");

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Error: $e")),
                );
              }
            },
          ),
        ],

        bottom: TabBar(
          controller: _tabController,
          tabs: const <Tab>[
            Tab(text: "Edit Form", icon: Icon(Icons.edit_note_outlined)),
            Tab(text: "Live Preview", icon: Icon(Icons.visibility_outlined)),
          ],
          labelColor: goldPrimary,
          unselectedLabelColor: textSecondary,
          indicatorColor: goldPrimary,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildSectionTitle("Personal Information"),
                    _buildTextFormField(
                      controller: _nameController,
                      labelText: "Full Name",
                      hintText: "John Doe",
                      onChanged: (String value) => resumeData.name = value,
                      validator: (String? value) => value == null || value.isEmpty ? "Name cannot be empty" : null,
                      textInputAction: TextInputAction.next,
                    ),
                    _buildTextFormField(
                      controller: _emailController,
                      labelText: "Email",
                      hintText: "john.doe@example.com",
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (String value) => resumeData.email = value,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) return "Email cannot be empty";
                        if (!value.contains('@')) return "Enter a valid email";
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    _buildTextFormField(
                      controller: _phoneController,
                      labelText: "Phone Number",
                      hintText: "+1 (555) 123-4567",
                      keyboardType: TextInputType.phone,
                      onChanged: (String value) => resumeData.phone = value,
                      textInputAction: TextInputAction.next,
                    ),
                    _buildTextFormField(
                      controller: _linkedinOrPortfolioController,
                      labelText: "LinkedIn or Portfolio URL",
                      hintText: "https://linkedin.com/in/johndoe",
                      keyboardType: TextInputType.url,
                      onChanged: (String value) => resumeData.linkedinOrPortfolio = value,
                      textInputAction: TextInputAction.next,
                    ),

                    _buildSectionTitle("Summary/Objective"),
                    _buildTextFormField(
                      controller: _summaryController,
                      labelText: "Summary",
                      hintText: "A highly motivated and results-oriented professional...",
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      onChanged: (String value) => resumeData.summary = value,
                      textInputAction: TextInputAction.newline,
                    ),
                    Consumer<ResumeData>(
                      builder: (context, data, _) {
                        if (data.summarySuggestions.isEmpty) {
                          return const SizedBox();
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),

                            const Text(
                              "Suggested Summaries",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),

                            const SizedBox(height: 6),

                            ...data.summarySuggestions.map((s) => GestureDetector(
                              onTap: () {
                                _summaryController.text = s;
                                data.summary = s;
                              },
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: cardColor,
                                  border: Border.all(color: borderColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  s,
                                  style: const TextStyle(color: textPrimary),
                                ),
                              ),
                            )),
                          ],
                        );
                      },
                    ),

                    _buildSectionTitle("Experience (Latest)"),
                    _buildTextFormField(
                      controller: _jobTitleController,
                      labelText: "Job Title",
                      hintText: "Senior Product Designer",
                      onChanged: (String value) {
                        resumeData.jobTitle = value;
                        resumeData.generateSummarySuggestions();
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    _buildTextFormField(
                      controller: _companyController,
                      labelText: "Company",
                      hintText: "Tech Innovations Inc.",
                      onChanged: (String value) {
                        resumeData.jobTitle = value;
                        resumeData.generateSummarySuggestions();
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    _buildTextFormField(
                      controller: _jobLocationController,
                      labelText: "Location",
                      hintText: "San Francisco, CA",
                      onChanged: (String value) => resumeData.jobLocation = value,
                      textInputAction: TextInputAction.next,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: _buildTextFormField(
                            controller: _jobStartDateController,
                            labelText: "Start Date",
                            hintText: "Jan 2020",
                            onChanged: (String value) => resumeData.jobStartDate = value,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildTextFormField(
                            controller: _jobEndDateController,
                            labelText: "End Date",
                            hintText: "Dec 2022 or Present",
                            onChanged: (String value) => resumeData.jobEndDate = value,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),
                    _buildTextFormField(
                      controller: _jobDescriptionController,
                      labelText: "Job Description (bullet points recommended)",
                      hintText: "• Led design sprints for new features\n• Increased user engagement by 15%",
                      maxLines: 8,
                      keyboardType: TextInputType.multiline,
                      onChanged: (String value) => resumeData.jobDescription = value,
                      textInputAction: TextInputAction.newline,
                    ),

                    _buildSectionTitle("Education (Latest)"),
                    _buildTextFormField(
                      controller: _degreeController,
                      labelText: "Degree/Certification",
                      hintText: "Master of Science in HCI",
                      onChanged: (String value) {
                        resumeData.jobTitle = value;
                        resumeData.generateSummarySuggestions();
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    _buildTextFormField(
                      controller: _universityController,
                      labelText: "University/Institution",
                      hintText: "Stanford University",
                      onChanged: (String value) {
                        resumeData.university = value;
                        resumeData.generateSummarySuggestions();
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    _buildTextFormField(
                      controller: _educationLocationController,
                      labelText: "Location",
                      hintText: "Stanford, CA",
                      onChanged: (String value) => resumeData.educationLocation = value,
                      textInputAction: TextInputAction.next,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: _buildTextFormField(
                            controller: _educationStartDateController,
                            labelText: "Start Date",
                            hintText: "Sep 2018",
                            onChanged: (String value) => resumeData.educationStartDate = value,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildTextFormField(
                            controller: _educationEndDateController,
                            labelText: "End Date",
                            hintText: "Jun 2020",
                            onChanged: (String value) => resumeData.educationEndDate = value,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),
                    _buildTextFormField(
                      controller: _educationDetailsController,
                      labelText: "Additional Details (e.g., Thesis, GPA)",
                      hintText: "Thesis: 'Designing for Accessibility in VR'",
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      onChanged: (String value) => resumeData.educationDetails = value,
                      textInputAction: TextInputAction.newline,
                    ),

                    _buildSectionTitle("Skills"),
                    _buildTextFormField(
                      controller: _skillsController,
                      labelText: "Skills (comma-separated or newline-separated)",
                      hintText: "Figma, Sketch\nUser Research\nPrototyping, HTML, CSS",
                      maxLines: 4,
                      keyboardType: TextInputType.multiline, // Allow multiline input
                      onChanged: (String value) {
                        resumeData.university = value;
                        resumeData.generateSummarySuggestions();
                      },
                      textInputAction: TextInputAction.newline, // Allow enter to create new line
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text("Resume data updated!", style: TextStyle(color: baseBackground)),
                                backgroundColor: goldPrimary,
                                duration: const Duration(seconds: 2),
                              ),
                            );
                            _tabController.animateTo(1); // Switch to the preview tab after saving
                          } else {
                            // Show a snackbar if validation fails
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text("Please correct the errors in the form.", style: TextStyle(color: textPrimary)),
                                backgroundColor: Colors.redAccent,
                                duration: const Duration(seconds: 3),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(

                          backgroundColor: goldPrimary,
                          foregroundColor: baseBackground,
                          shape: defaultTargetPlatform == TargetPlatform.android ? const StadiumBorder() : RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                        ),
                        child: const Text("Save Resume", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
           ResumePreviewWidget(),
        ],
      ),
    );
  }
}