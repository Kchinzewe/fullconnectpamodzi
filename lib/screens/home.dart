import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:connectv01pamodzi/screens/newsfeed.dart';
import 'package:connectv01pamodzi/screens/notifications.dart';
import 'package:connectv01pamodzi/screens/upload.dart';
import 'package:connectv01pamodzi/screens/search.dart';
import 'package:connectv01pamodzi/screens/profile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

//Curved Bottom navigation bar STARTS
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final items = const [
    Icon(
      Icons.home_outlined,
      size: 20,
    ),
    Icon(
      Icons.search_outlined,
      size: 20,
    ),
    Icon(
      Icons.add_a_photo_outlined,
      size: 20,
    ),
    Icon(
      Icons.favorite_border_outlined,
      size: 20,
    ),
    Icon(
      Icons.person_outline_outlined,
      size: 20,
    ),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Newsfeed',
      //   ),
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: ((selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        }),
        height: 55,
        color: Colors.white,
        backgroundColor: Colors.deepPurple,
        buttonBackgroundColor: Colors.teal[600],
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeOutQuad,
      ),
      body: Container(
          color: Colors.tealAccent,
          alignment: Alignment.center,
          child: Column(
            children: [
              getSelectedWidget(index: index),
            ],
          )),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget? widget;
    switch (index) {
      case 0:
        widget = const Newsfeed();
        break;
      case 1:
        widget = const Search();
        break;
      case 2:
        widget = const Upload();
        break;
      case 3:
        widget = const Notifications();
        break;
      case 4:
        widget = const Profile();
        break;
    }
    return widget!;
  }
}
//Curved Bottom navigation bar ENDS


//Google bottom navbar STARTS
// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   final items = const [
//     Icon(
//       Icons.home_outlined,
//       size: 20,
//     ),
//     Icon(
//       Icons.search_outlined,
//       size: 20,
//     ),
//     Icon(
//       Icons.add_a_photo_outlined,
//       size: 20,
//     ),
//     Icon(
//       Icons.favorite_border_outlined,
//       size: 20,
//     ),
//     Icon(
//       Icons.person_outline_outlined,
//       size: 20,
//     ),
//   ];

//   int index = 0;

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:  Container(
//           color: Colors.tealAccent,
//           alignment: Alignment.center,
//           child: Column(
//             children: [
//               getSelectedWidget(index: index),
//             ],
//           )),
//       backgroundColor: Colors.tealAccent,
//       bottomNavigationBar: Container(
//         child: Padding(
//           padding: EdgeInsets.all(3),
//           child: GNav(
//             backgroundColor: Colors.deepPurple,
//             tabBackgroundColor: Colors.grey[400]!,
//             hoverColor: Colors.teal,
//             color: Colors.teal,
//             activeColor: Colors.white,
//             gap: 8,
//             padding: EdgeInsets.all(14),
//             selectedIndex: index,
//             onTabChange: (selectedIndex) => {
//               setState(() {
//                 index = selectedIndex ;
//               })
//             },
//             tabs: [
//               GButton(
//                 icon: Icons.home,
//                 text: 'Home',
//               ),
//               GButton(
//                 icon: Icons.search,
//                 text: 'Search',
//               ),
//               GButton(
//                 icon: Icons.photo_camera_outlined,
//                 text: 'Photo',
//               ),
//               GButton(
//                 icon: Icons.favorite_border,
//                 text: 'Notifications',
//               ),
//               GButton(
//                 icon: Icons.people_outlined,
//                 text: 'Profile',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget getSelectedWidget({required int index}) {
//     Widget? widget;
//     switch (index) {
//       case 0:
//         widget = const Newsfeed();
//         break;
//       case 1:
//         widget = const Search();
//         break;
//       case 2:
//         widget = const Upload();
//         break;
//       case 3:
//         widget = const Notifications();
//         break;
//       case 4:
//         widget = const Profile();
//         break;
//     }
//     return widget!;
//   }
// }
//Google bottom navbar ENDS


//Bottom navbar FAILED STARTS
// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   late PageController pageController;
//   int pageIndex = 0;

//   @override
// void initState() {
//   pageController = PageController();
//   FirebaseAuth.instance.currentUser;
// }

//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }

//   onPageChanged(int pageIndex) {
//     setState(() {
//       this.pageIndex = pageIndex;
//     });
//   }

//   onTap(int pageIndex) {
//     pageController.animateToPage(
//       pageIndex,
//       duration: Duration(milliseconds: 200),
//       curve: Curves.easeInOut,
//     );
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         children: <Widget>[
//           Newsfeed(),
//           ActivityFeed(),
//           Upload(),
//           Search(),
//           Profile(),
//         ],
//         controller: pageController,
//         onPageChanged: onPageChanged,
//         physics: NeverScrollableScrollPhysics(),
//       ),
//       bottomNavigationBar: CupertinoTabBar(
//         currentIndex: pageIndex,
//         onTap: onTap,
//         activeColor: Theme.of(context).primaryColor,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.whatshot)),
//           BottomNavigationBarItem(icon: Icon(Icons.notifications_active)),
//           BottomNavigationBarItem(
//               icon: Icon(
//             Icons.photo_camera,
//             size: 35.0,
//           )),
//           BottomNavigationBarItem(icon: Icon(Icons.search)),
//           BottomNavigationBarItem(icon: Icon(Icons.account_circle)),
//         ],
//       ),
//     );
//   }
// }
//Bottom navbar FAILED ENDS


//Basic HOME template SIGNOUT STARTS
// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser!;

//     return Scaffold(
//       backgroundColor: Colors.tealAccent,
//       appBar: AppBar(
//         title: Text('Newsfeed'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(32),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Signed In as',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             Text(
//               user.email!,
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size.fromHeight(50),
//               ),
//               icon: Icon(
//                 Icons.arrow_back_ios,
//                 size: 32,
//               ),
//               label: Text(
//                 'Sign Out',
//                 style: TextStyle(fontSize: 24),
//               ),
//               onPressed: () => FirebaseAuth.instance.signOut(),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//Basic HOME template SIGNOUT ENDS
