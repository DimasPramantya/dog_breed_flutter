import 'package:flutter/material.dart';
import 'package:latihan_responsi/pages/home/home_page.dart';
import 'package:latihan_responsi/pages/onboarding/onboarding_page.dart';
import 'package:latihan_responsi/services/storage_service.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  Widget build(BuildContext context){
    //final storage = GetStorage();
    final storageService = StorageService();
    bool isLoggedIn = storageService.isLoggedIn();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? const HomePage() : const OnboardingPage(),
    );
  }
}