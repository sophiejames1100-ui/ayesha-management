import 'package:flutter/material.dart';
import '../candidate/candidate_form.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayesha Candidate Management'),
      ),
      body: Row(
        children: [
          // Left Side: Entry Form
          Expanded(
            flex: 4,
            child: Container(
              color: Theme.of(context).colorScheme.surface,
              child: const CandidateForm(),
            ),
          ),
          const VerticalDivider(width: 1, thickness: 1),
          // Right Side: Dashboard/Grid
          Expanded(
            flex: 6,
            child: Container(
              color: Theme.of(context).colorScheme.background,
              child: const Center(child: Text('Candidate Grid (Data Table Here)')),
            ),
          ),
        ],
      ),
    );
  }
}
