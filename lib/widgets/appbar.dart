import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  //final String title;

  //Appbar({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: AppBar(
        title: Container(
          child: Image.asset(
            "lib/assets/imgs/logo.jpeg",
            height: 100,
            width: 200,
          ),
        ),

        //Text(title),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 0, 0, 1),
        // 72, 141, 146, 1.0
        actions: [
          // Spacer(),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kTextTabBarHeight);
}


// AppBar(
//         title: Row(
//           children: [
//             Container(
//               margin: EdgeInsets.only(right: 10.0),
//               child: Image.asset(
//                 "lib/assets/imgs/logo.jpeg",
//                 height: 100,
//                 width: 55,
//               ),
//             ),
//           ],
//         ),
//         backgroundColor: Color.fromRGBO(72, 141, 146, 1.0),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {},
//           ),
//         ],
//       ),