import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
              ),
            ),
            SizedBox(height: 16.0),
            Text('ФИО: Юртеев Алексей Игоревич',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 8.0),
            Text('Группа: ЭФБО-03-22', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8.0),
            Text('Номер телефона: +7 (777) 777-77-77',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 8.0),
            Text('Почта: yurteev@example.com', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
