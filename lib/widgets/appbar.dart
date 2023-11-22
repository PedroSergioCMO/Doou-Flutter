import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  Appbar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 90,
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 1),
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: Image.asset(
                "lib/assets/imgs/logo.jpeg",
                // height: 110,
                // width: 15,
              ),
            ),
            color: Colors.red,
          ),
          Text(title),
        ],
      ),
      backgroundColor: Color.fromRGBO(72, 141, 146, 1.0),
      actions: [
        // Spacer(),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(90.0);
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