import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart'; 

import '../core/constants.dart';
import '../core/themes.dart';
import '../widgets/bottom_menu.dart';
import '../widgets/suggested_action_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 89, 94, 255), 
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 89, 94, 255),
        title: Text(
          'Hava Durumu',
          style: GoogleFonts.lobster( 
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.refresh, color: Colors.black),
            onPressed: () {
             
            },
          ),
        ],
      ),      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        child: Column(         
           children: [
          Container(
              height: 200,             
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/icons/Emre.muhammet.jpg"),            
                  ),
                  const SizedBox(height: 10),
                ],
              ),   ),
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: Text('Ana Sayfa', style: GoogleFonts.poppins()),
              onTap: () {
                Navigator.pop(context);
              },
            ),ListTile(
              leading: const Icon(CupertinoIcons.search),
              title: Text('Aktiviteler', style: GoogleFonts.poppins()), 
              onTap: () {
                context.go("/history");
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.person),
              title: Text('Profile', style: GoogleFonts.poppins()), 
              onTap: () {
                context.go("/profile");
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: Text('Ayarlar', style: GoogleFonts.poppins()), 
              onTap: () {
                context.go("/voice");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Ankara', 
              style: GoogleFonts.roboto( 
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '18°C | Güneşli', 
              style: GoogleFonts.openSans( 
                fontSize: 24,
                color: Colors.black54,
              ),
            ),
            Expanded(
              child: Container(
                width: 150,
                height: 150,
                child: Image.asset(
                  'assets/icons/logo2.webp', 
                  fit: BoxFit.contain,
                ),
              ),
            ),    const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildWeatherInfo('Nem', '%65'),
                _buildWeatherInfo('Rüzgar', '10 km/h'),
                _buildWeatherInfo('Hissedilen', '17°C'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }

  Widget _buildWeatherInfo(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins( 
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: GoogleFonts.poppins( 
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
