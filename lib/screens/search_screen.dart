import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../widgets/bottom_menu.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: arkaplanRenkim, 
      appBar: AppBar(
        backgroundColor: Colors.transparent, 
        elevation: 0,  
        title: TextField(
          decoration: InputDecoration(
            hintText: "Arama yap...",
            border: InputBorder.none,  
            prefixIcon: Icon(Icons.search),  
            
          ),
          style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),  
        ),
      ),
      body: Center(
        child: Text(""),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
