import 'package:flutter/material.dart';
import '../routes/routes.dart';

class EmptyAppointmentView extends StatefulWidget {
  const EmptyAppointmentView({super.key});

  @override
  State<EmptyAppointmentView> createState() => _EmptyAppointmentViewState();
}

class _EmptyAppointmentViewState extends State<EmptyAppointmentView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        if (_tabController.index == 0) {
          Navigator.pushNamed(context, AppRoutes.upcoming);
        } else if (_tabController.index == 2) {
          Navigator.pushNamed(context, AppRoutes.cancelled);
        }
        // Note: Tab index 1 (Past) is left empty for now.
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),

      ),
      body: _buildEmptyContent(context),
    );
  }

  Widget _buildEmptyContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/icc.png',
            width: 120,
            height: 120,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context,AppRoutes .appointmentForm);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Add Appointment',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
