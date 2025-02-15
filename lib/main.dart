
import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'app.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();

  // UserRemoteDataSource(DioConsumer(dio: Dio())).login(
  //   phoneNumber: '01528126333',
  //   password: '12343212',
  // );
  runApp(const CarCareApp());
}
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _currentIndex = 0; // Index to track the selected tab

//   // List of screens/pages to display for each tab
//   final List<Widget> _screens = [
//     FeedbackPage(), // Your existing FeedbackPage
//     SettingsPage(), // Example: A settings page
//     ProfilePage(), // Example: A profile page
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Display the current screen based on the selected tab
//       body: _screens[_currentIndex],

//       // Bottom Navigation Bar
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.red,
//         currentIndex: _currentIndex, // Current selected index
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index; // Update the selected index
//           });
//         },
//         items: const [
//           // Define the items in the bottom navigation bar
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         selectedItemColor: Colors.blue, // Color of the selected item
//         unselectedItemColor: Colors.grey, // Color of unselected items
//       ),
//     );
//   }
// }

// // Your existing FeedbackPage
// class FeedbackPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Feedback Page'),
//     );
//   }
// }

// // Example: Settings Page
// class SettingsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Settings Page'),
//     );
//   }
// }

// // Example: Profile Page
// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Profile Page'),
//     );
//   }
// }