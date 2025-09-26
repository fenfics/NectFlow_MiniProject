import 'package:flutter/material.dart';
import '../app_colors.dart';

class IssuePage extends StatefulWidget {
  const IssuePage({super.key});

  @override
  State<IssuePage> createState() => _IssuePageState();
}

class _IssuePageState extends State<IssuePage> {
  final List<String> issues = [
    "Common areas are dirty",
    "Room equipment broken",
    "Damaged common area equipment",
    "Rule violations",
    "Insect/Pest problems",
  ];

  late List<bool> selected;

  final TextEditingController _detailsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selected = List.filled(issues.length, false); 
  }

  void _submitIssue() {
    List<String> chosen = [];
    for (int i = 0; i < issues.length; i++) {
      if (selected[i]) chosen.add(issues[i]);
    }

    String details = _detailsController.text.trim();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Issue Submitted"),
        content: Text("Selected: ${chosen.join(', ')}\nDetails: $details"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );

    // ล้างค่า
    _detailsController.clear();
    setState(() {
      selected = List.filled(issues.length, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Report Issue"),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select Issues", style: TextStyle(fontWeight: FontWeight.bold)),
            ...List.generate(
              issues.length,
              (i) => CheckboxListTile(
                title: Text(issues[i]),
                value: selected[i],
                onChanged: (val) => setState(() => selected[i] = val!),
              ),
            ),
            const SizedBox(height: 16),
            const Text("Additional Details", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _detailsController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: "Type here...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              child: ElevatedButton(
                onPressed: _submitIssue,
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
