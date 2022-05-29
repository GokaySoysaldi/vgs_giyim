import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.grey,
      child: Container(
        height: 70, 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          IconButton(
            iconSize: 30,
            icon: Icon(Icons.home, color: Colors.black),
            onPressed: () {
            Navigator.pushNamed(context, '/');
          }),
          IconButton(
            iconSize: 30,
            icon: Icon(Icons.shopping_bag, color: Colors.black,),
            onPressed: () {
            Navigator.pushNamed(context, '/cart');
          }),
          IconButton(
            iconSize: 30,
            icon: Icon(Icons.person, color: Colors.black,),
            onPressed: () {
            Navigator.pushNamed(context, '/user');
          }),
        ],),
        )
    );
  }
}

