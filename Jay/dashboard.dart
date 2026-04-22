import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/dashboard/preview.dart';
import 'color.dart';

import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'resumeform.dart'; // where ResumeData class is;

class ResumAIHomeScreen extends StatelessWidget {
  const ResumAIHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseBackground,
      bottomNavigationBar: _buildBottomNav(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildHeader(),
              const SizedBox(height: 25),
              _buildResumeStrengthCard(),
              const SizedBox(height: 20),
              _buildCreateNewCard(context),
              const SizedBox(height: 30),
              _buildSectionHeader("My Resumes", true),
              const SizedBox(height: 15),
              _buildResumeList(),
              const SizedBox(height: 30),
              _buildSectionHeader("Recent Activity", false),
              const SizedBox(height: 15),
              _buildActivityCard(),
              const SizedBox(height: 20),
              _buildProTip(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            const Icon(Icons.bolt, color: goldPrimary, size: 30),
            const SizedBox(width: 8),
            Text("ResumAI", style: TextStyle(color: goldPrimary, fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: cardColor, shape: BoxShape.circle, border: Border.all(color: borderColor)),
              child: const Icon(Icons.settings_outlined, color: textSecondary, size: 20),
            ),
            const SizedBox(width: 12),
            const CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage('https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg'),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildResumeStrengthCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(20), border: Border.all(color: borderColor)),
      child: Row(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              CircularProgressIndicator(value: 0.7, strokeWidth: 6, backgroundColor: baseBackground, color: goldPrimary),
              const Text("70%", style: TextStyle(color: textPrimary, fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("RESUME STRENGTH", style: TextStyle(color: textSecondary, fontSize: 10, letterSpacing: 1.2)),
                const Text("Almost there, Alex!", style: TextStyle(color: textPrimary, fontSize: 18, fontWeight: FontWeight.bold)),
                Text("Add your skills to reach 90%", style: TextStyle(color: textSecondary, fontSize: 13)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: textSecondary),
        ],
      ),
    );
  }

  Widget _buildCreateNewCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1515), // Deep dark teal/black mix
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: goldPrimary.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: goldPrimary, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.add, color: baseBackground),
          ),
          const SizedBox(height: 20),
          const Text("Create New Resume", style: TextStyle(color: textPrimary, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("Our AI analyzes 1,000+ job\ndescriptions to build your perfect CV\nin seconds.",
              style: TextStyle(color: textSecondary, fontSize: 14, height: 1.4)),
          const SizedBox(height: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                          create: (_) => ResumeData(),
                          child: const ResumeBuilderScreen(),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: goldPrimary,
                    foregroundColor: baseBackground,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text("Start Building"),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 80,
                height: 24,
                child: Stack(
                  children: List.generate(
                    3,
                        (i) => Positioned(
                      left: i * 15,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: borderColor,
                        child: const Icon(Icons.person, size: 12, color: goldSecondary),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, bool showViewAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title, style: const TextStyle(color: textPrimary, fontSize: 18, fontWeight: FontWeight.bold)),
        if (showViewAll) Text("View All", style: TextStyle(color: goldPrimary, fontSize: 14)),
      ],
    );
  }

  Widget _buildResumeList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          _buildResumeTile("Product Designer 2024", "Edited 2h ago", "70% COMPLETE"),
          const SizedBox(width: 15),
          _buildResumeTile("Senior UX Strat", "Edited yesterday", "READY"),
        ],
      ),
    );
  }

  Widget _buildResumeTile(String title, String time, String status) {
    return Container(
      width: 200,
      decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(16), border: Border.all(color: borderColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100,
            decoration: BoxDecoration(
                color: surfaceColor,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: <Color>[Colors.white10, Colors.transparent])
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(status, style: const TextStyle(color: textSecondary, fontSize: 10, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(title, style: const TextStyle(color: textPrimary, fontSize: 14, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Row(
                  children: <Widget>[
                    const Icon(Icons.access_time, color: textSecondary, size: 12),
                    const SizedBox(width: 4),
                    Text(time, style: const TextStyle(color: textSecondary, fontSize: 11)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildActivityCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(20), border: Border.all(color: borderColor)),
      child: Column(
        children: <Widget>[
          _activityItem(Icons.description_outlined, "Updated Skills section", "2 hours ago"),
          const Divider(color: borderColor, height: 24),
          _activityItem(Icons.auto_awesome, "AI optimized your summary", "5 hours ago", iconColor: goldPrimary),
          const Divider(color: borderColor, height: 24),
          _activityItem(Icons.emoji_events_outlined, "Added 'Google Certification'", "Yesterday"),
        ],
      ),
    );
  }

  Widget _activityItem(IconData icon, String title, String time, {Color? iconColor}) {
    return Row(
      children: <Widget>[
        Icon(icon, color: iconColor ?? textSecondary, size: 20),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: const TextStyle(color: textPrimary, fontSize: 14, fontWeight: FontWeight.w500)),
            Text(time, style: const TextStyle(color: textSecondary, fontSize: 12)),
          ],
        )
      ],
    );
  }

  Widget _buildProTip() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: goldDark.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: goldDark.withOpacity(0.3)),
      ),
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: goldPrimary.withOpacity(0.2), shape: BoxShape.circle),
            child: const Icon(Icons.lightbulb_outline, color: goldLight, size: 20),
          ),
          const SizedBox(width: 15),
          const Expanded(
            child: Text.rich(
              TextSpan(
                style: TextStyle(color: textSecondary, fontSize: 13),
                children: <TextSpan>[
                  TextSpan(text: "PRO TIP\n", style: TextStyle(color: goldLight, fontWeight: FontWeight.bold, fontSize: 11)),
                  TextSpan(text: "Resumes with "),
                  TextSpan(text: "quantified achievements", style: TextStyle(color: textPrimary, fontWeight: FontWeight.bold)),
                  TextSpan(text: " get 40% more callbacks."),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: borderColor, width: 0.5))),
      child: BottomNavigationBar(
        backgroundColor: baseBackground,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: goldPrimary,
        unselectedItemColor: textSecondary,
        currentIndex: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.file_copy_outlined), label: "Templates"),
          BottomNavigationBarItem(icon: Icon(Icons.auto_awesome_outlined), label: "AI Help"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }
}