// import 'package:flutter/material.dart';
//
// class UpcomingAppointmentsScreen extends StatelessWidget {
//   const UpcomingAppointmentsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Book Appointment'),
//           centerTitle: true,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pushNamed(context, '/empty');
//             },
//           ),
//           bottom: const TabBar(
//             tabs: [
//               Tab(text: 'Upcoming'),
//               Tab(text: 'Past'),
//               Tab(text: 'Cancelled'),
//             ],
//             labelColor: Colors.deepPurple,
//             unselectedLabelColor: Colors.black,
//             indicatorColor: Colors.deepPurple,
//           ),
//         ),
//         body: const TabBarView(
//           children: [
//             _AppointmentsList(),
//             Center(child: Text('Past Appointments')),
//             Center(child: Text('Cancelled Appointments')),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _AppointmentsList extends StatelessWidget {
//   const _AppointmentsList();
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(16),
//       children: [
//         _appointmentCard(
//           image: 'assets/images/dog.png',
//           doctor: 'Dr.Mohammad Ali',
//           petName: 'Sassy',
//           date: '3 Mar 2025',
//           time: '11–12 AM',
//         ),
//         const SizedBox(height: 12),
//         _appointmentCard(
//           image: 'assets/images/cat.png',
//           doctor: 'Dr.Mary Santo',
//           petName: 'Rozi',
//           date: '21 Mar 2025',
//           time: '11–12 AM',
//         ),
//       ],
//     );
//   }
//
//   Widget _appointmentCard({
//     required String image,
//     required String doctor,
//     required String petName,
//     required String date,
//     required String time,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.grey[100],
//         border: Border.all(color: Colors.yellow.shade700),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           CircleAvatar(
//             radius: 30,
//             backgroundImage: AssetImage(image),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   doctor,
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 Text(petName),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     const Icon(Icons.calendar_month, size: 16),
//                     const SizedBox(width: 4),
//                     Text(date),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     const Icon(Icons.access_time, size: 16),
//                     const SizedBox(width: 4),
//                     Text(time),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Column(
//             children: [
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepPurple,
//                   minimumSize: const Size(80, 32),
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text(
//                   'Remember me',
//                   style: TextStyle(
//                     fontSize: 10,
//                     color: Colors.white, // ✅ الأبيض واضح
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8),
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.grey[300],
//                   minimumSize: const Size(80, 32),
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text(
//                   'Cancel',
//                   style: TextStyle(
//                     fontSize: 10,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpcomingAppointmentsScreen extends StatelessWidget {
  const UpcomingAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Book Appointment'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, '/empty');
            },
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Upcoming'),
              Tab(text: 'Past'),
              Tab(text: 'Cancelled'),
            ],
            labelColor: Colors.deepPurple,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.deepPurple,
          ),
        ),
        body: const TabBarView(
          children: [
            _AppointmentsList(status: 'upcoming'),
            _AppointmentsList(status: 'past'),
            _AppointmentsList(status: 'cancelled'),
          ],
        ),
      ),
    );

  }
}

class _AppointmentsList extends StatelessWidget {
  final String status;
  const _AppointmentsList({required this.status});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('appointments')
          .where('status', isEqualTo: status)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final docs = snapshot.data!.docs;

        if (docs.isEmpty) {
          return Center(child: Text('No $status appointments'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: docs.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final data = docs[index].data() as Map<String, dynamic>;
            return _appointmentCard(
              image: data['image'] ?? '',
              doctor: data['doctor'] ?? '',
              petName: data['petName'] ?? '',
              date: data['date'] ?? '',
              time: data['time'] ?? '',
            );
          },
        );
      },
    );
  }

  Widget _appointmentCard({
    required String image,
    required String doctor,
    required String petName,
    required String date,
    required String time,
  }) {
    final imageProvider = image.startsWith("http")
        ? NetworkImage(image)
        : AssetImage(image) as ImageProvider;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.yellow.shade700),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: imageProvider,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(petName),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.calendar_month, size: 16),
                    const SizedBox(width: 4),
                    Text(date),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 16),
                    const SizedBox(width: 4),
                    Text(time),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  minimumSize: const Size(80, 32),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Remember me',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  minimumSize: const Size(80, 32),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}