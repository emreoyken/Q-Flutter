
import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../core/constants.dart';
import '../widgets/bottom_menu.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: arkaplanRenkim, // .fromARGB(255, 35, 47, 59),
      // AppBar
      appBar: AppBar(
        title: const Text('Ana Sayfa'),
        backgroundColor: Colors.white,
        title: const Text('Q'),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.bell),
            icon: const Icon(CupertinoIcons.app),
            onPressed: () {},
          ),
        ],
      ),

      // Drawer (Yan Menü)
    drawer: Drawer(
  backgroundColor: arkaplanRenkim,
  elevation: 0,
  child: ListView(
    children: [
      ListTile(
        leading: Icon(CupertinoIcons.search),
        title: Text('History'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: Icon(CupertinoIcons.person),
        title: Text('Profile'),
        onTap: () {
          // 
        },
      ),
    ],
  ),
),

            ListTile(
              leading: const Icon(CupertinoIcons.person),
              title: const Text('Profile'),
              onTap: () {
                context.go("/profile");
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Ayarlar'),
@@ -72,32 +90,26 @@ class HomeScreen extends StatelessWidget {
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: const Text('Ana Sayfa İçeriği'),
              child: SizedBox(
                width: double.infinity,
                child: DotLottieLoader.fromAsset(
                  "assets/motions/q2.lottie",
                  frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                    if (dotlottie != null) {
                      return Lottie.memory(dotlottie.animations.values.single);
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),

      // Alt navigasyon çubuğu
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Keşfet',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profil',
          ),
        ],
        onTap: (index) {
          // Navigasyon işlemleri buraya gelecek
        },
      ),
      bottomNavigationBar: BottomMenu(),
        child: Column(
          children: [
            // Drawer Header
            Container(
              height: 200,
              color: Colors.blue,
              // color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.person_circle,
                    size: 80,
                    color: Colors.white,
                    color: Colors.black87,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Kullanıcı Adı',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
@@ -55,6 +58,21 @@ class HomeScreen extends StatelessWidget {
                Navigator.pop(context);
              },
            ),
    );
  }
}