import 'package:flutter/material.dart';
import 'package:scoutasks/screens/home_screen/widgets/home_toggle_button_row.dart';
import 'widgets/technician_job_card.dart';
import 'widgets/technician_calendar_widget.dart';
import 'widgets/task_evidence_bottom_sheet.dart';
import 'widgets/complete_job_bottom_sheet.dart';
import 'widgets/find_job_search_bar.dart';
import 'widgets/send_offer_bottom_sheet.dart';

class TechnicianScheduleScreen extends StatefulWidget {
  const TechnicianScheduleScreen({super.key});

  @override
  State<TechnicianScheduleScreen> createState() => _TechnicianScheduleScreenState();
}

class _TechnicianScheduleScreenState extends State<TechnicianScheduleScreen> {
  String _selectedTab = "All";

  final String dummyDesc =
      "Implements the emergency location broadcast HUD and search filtersImplements the emergency location broadcast HUD and search filtersImplements the emergency location broadcast HUD and search filters";

  late final List<Map<String, String>> _allJobs = [
    {
      'title': 'Leaking kitchen pipe',
      'description': dummyDesc,
      'budget': '\$65 to \$120',
      'level': 'Low urgency',
      'location': 'Dhaka, Bangladesh',
      'status': 'INPROGRESS',
      'actionText': 'Mark complite',
    },
    {
      'title': 'Leaking kitchen pipe',
      'description': dummyDesc,
      'budget': '\$65 to \$120',
      'level': 'Low urgency',
      'location': 'Dhaka, Bangladesh',
      'status': 'COMPLETE',
      'actionText': 'See statues',
    },
    {
      'title': 'Leaking kitchen pipe',
      'description': dummyDesc,
      'budget': '\$65 to \$120',
      'level': 'Low urgency',
      'location': 'Dhaka, Bangladesh',
      'status': 'COMPLETE',
      'actionText': 'See statues',
    },
  ];

  late final List<Map<String, dynamic>> _findJobs = [
    {
      'title': 'Leaking kitchen pipe',
      'description': dummyDesc,
      'budget': '\$65-\$120',
      'level': 'Medium urgency',
      'location': 'Dhaka, Bangladesh',
      'status': 'MEDIUM URGENCY',
      'actionText': 'Send offer',
      'userName': 'Guy Hawkins',
      'userRole': 'Customer',
      'userRating': 4.5,
      'images': ['https://images.unsplash.com/photo-1585821555541-155452d3a778?auto=format&fit=crop&w=500&q=80'],
    },
    {
      'title': 'Leaking kitchen pipe',
      'description': dummyDesc,
      'budget': '\$65-\$120',
      'level': 'Medium urgency',
      'location': 'Dhaka, Bangladesh',
      'status': 'MEDIUM URGENCY',
      'actionText': 'Send offer',
      'userName': 'Guy Hawkins',
      'userRole': 'Customer',
      'userRating': 4.5,
      'images': ['https://images.unsplash.com/photo-1585821555541-155452d3a778?auto=format&fit=crop&w=500&q=80'],
    },
  ];

  List<Map<String, dynamic>> get _filteredJobs {
    if (_selectedTab == "All") return _allJobs;
    if (_selectedTab == "In Progress") {
      return _allJobs.where((job) => job['status'] == 'INPROGRESS').toList();
    }
    if (_selectedTab == "Complete") {
      return _allJobs.where((job) => job['status'] == 'COMPLETE').toList();
    }
    if (_selectedTab == "Find job") {
      return _findJobs;
    }
    return []; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Agenda slot management',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 20),
              if (_selectedTab != "Find job") const TechnicianCalendarWidget(),
              if (_selectedTab != "Find job") const SizedBox(height: 24),
              HomeToggleButtonRow(
                selectedItem: _selectedTab,
                onSelected: (item) {
                  setState(() {
                    _selectedTab = item;
                  });
                },
                items: const ["All", "In Progress", "Complete", "Find job"],
              ),
              const SizedBox(height: 20),
              if (_selectedTab == "Find job") ...[
                const FindJobSearchBar(),
                const SizedBox(height: 20),
              ],
              // Dummy Jobs
              ..._filteredJobs.map((job) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TechnicianJobCard(
                    title: job['title'] as String,
                    description: job['description'] as String,
                    budget: job['budget'] as String,
                    level: job['level'] as String,
                    location: job['location'] as String,
                    status: job['status'] as String,
                    actionText: job['actionText'] as String,
                    userName: job['userName'] as String?,
                    userRole: job['userRole'] as String?,
                    userRating: job['userRating'] as double?,
                    images: job['images'] as List<String>?,
                    onChatPressed: () {},
                    onActionPressed: () {
                      if (job['actionText'] == 'Mark complite') {
                        TaskEvidenceBottomSheet.show(context, issueName: job['title'] as String);
                      } else if (job['actionText'] == 'See statues') {
                        CompleteJobBottomSheet.show(
                          context,
                          title: job['title'] as String,
                          description: job['description'] as String,
                          budget: job['budget'] as String,
                          level: job['level'] as String,
                          location: job['location'] as String,
                        );
                      } else if (job['actionText'] == 'Send offer') {
                        SendOfferBottomSheet.show(
                          context,
                          title: job['title'] as String,
                        );
                      }
                    },
                  ),
                );
              }),
              if (_filteredJobs.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Center(
                    child: Text(
                      'No jobs found.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
