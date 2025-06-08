import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../routes/routes.dart';
import '../viewmodel/appointment_viewmodel.dart';
import '../models/doctor.dart';
import 'package:provider/provider.dart';



class AppointmentFormScreen extends StatefulWidget {
  const AppointmentFormScreen({super.key});

  @override
  State<AppointmentFormScreen> createState() => _AppointmentFormScreenState();
}

class _AppointmentFormScreenState extends State<AppointmentFormScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<AppointmentViewModel>(context, listen: false)
            .fetchDoctors());
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AppointmentViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF5E2A6F)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Select a Veterinarian', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFCED31B)),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: DropdownButtonFormField<Doctor>(
                  value: vm.selectedDoctor,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    border: InputBorder.none,
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: vm.doctors.map((doctor) {
                    return DropdownMenuItem(
                      value: doctor,
                      child: Text(doctor.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5E2A6F))),
                    );
                  }).toList(),
                  onChanged: vm.selectDoctor,
                ),
              ),
              const SizedBox(height: 24),
              const Text('Please choose date and time', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFCED31B)),
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.all(8),
                child: TableCalendar(
                  firstDay: DateTime.now(),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: vm.selectedDate ?? DateTime.now(),
                  selectedDayPredicate: (day) =>
                      isSameDay(vm.selectedDate, day),
                  onDaySelected: (selected, _) =>
                      vm.selectDate(selected),
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: const BoxDecoration(
                      color: Color(0xFF5E2A6F),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text('Select time', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: vm.times.map((time) {
                  final isSelected = time == vm.selectedTime;
                  return GestureDetector(
                    onTap: () => vm.selectTime(time),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF5E2A6F)),
                        borderRadius: BorderRadius.circular(8),
                        color: isSelected ? const Color(0xFF5E2A6F) : Colors.transparent,
                      ),
                      child: Text(
                        time,
                        style: TextStyle(
                          color: isSelected ? Colors.white : const Color(0xFF5E2A6F),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: vm.canContinue
                      ? () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.confirm,
                      arguments: {
                        'doctor_name': vm.selectedDoctor!.name,
                        'doctor_uid': vm.selectedDoctor!.uid,
                        'date': vm.selectedDate!.toString().split(' ')[0],
                        'time': vm.selectedTime!,
                      },
                    );
                  }
                      : null,
                  style: TextButton.styleFrom(
                    backgroundColor: vm.canContinue
                        ? const Color(0xFF5E2A6F)
                        : Colors.grey.shade300,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
