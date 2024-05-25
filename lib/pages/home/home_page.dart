import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latihan_responsi/pages/health/health.dart';
import 'package:latihan_responsi/pages/meals/meal_list.dart';
import 'package:latihan_responsi/pages/onboarding/onboarding_page.dart';
import 'package:latihan_responsi/pages/user_account/user_profile.dart';
import 'package:latihan_responsi/services/storage_service.dart';
import 'package:latihan_responsi/utils/colors.dart';
import 'package:material_symbols_icons/symbols.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final storage = GetStorage();
  int _currentIndex = 0;
  final storageService = StorageService();

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      _showHomePage(),
      const MealList(),
      const Health(),
      const UserProfile()
    ];
  }

  @override
  Widget build(BuildContext context) {
    //String? token = storage.read("token");
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Diabetless'),
            backgroundColor: darkBlueColor,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                icon: const Icon(Symbols.logout_rounded),
                onPressed: () async {
                  await storageService.logout();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnboardingPage(),
                    ),
                  );
                },
              ),
            ],
          ),
          body: pages[_currentIndex],
          extendBody: true,
          bottomNavigationBar: Navbar(
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
          )),
    );
  }

  Widget _showHomePage() {
    String? token = storage.read("token");
    return SingleChildScrollView(
      child: Text(token ?? "token not found"),
    );
  }
}

class Navbar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const Navbar({super.key, required this.currentIndex, required this.onTap});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: darkBlueColor,
      unselectedItemColor: greyTextColor,
      selectedItemColor: lightGreyColor,
      currentIndex: widget.currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: widget.onTap,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Symbols.home_rounded),
          label: "home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Symbols.rice_bowl_rounded),
          label: "Meals",
        ),
        BottomNavigationBarItem(
          icon: Icon(Symbols.ecg_heart_rounded),
          label: "Health",
        ),
        BottomNavigationBarItem(
          icon: Icon(Symbols.person_rounded),
          label: "Profile",
        ),
      ],
    );
  }
}
