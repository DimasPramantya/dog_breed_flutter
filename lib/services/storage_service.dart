import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../models/user.dart';

class StorageService {
  final GetStorage _storage = GetStorage();
  final String _userKey = 'users'; 
  final String _isLoggedInKey = 'isLoggedIn'; 

  Future<void> login(String username, String password, BuildContext context) async {
    var usersJson = _storage.read(_userKey) ?? '[]'; // Default to empty JSON array
    
    if (usersJson is String) {
      usersJson = jsonDecode(usersJson);
    }

    if (usersJson is! List) {
      throw Exception("Invalid user data format");
    }

    final List<User> users = usersJson.map<User>((userJson) => User.fromJson(userJson)).toList();

    users.firstWhere(
      (user) => user.username == username && user.password == password,
      orElse: () => throw Exception("Invalid username or password"),
    );

    await _storage.write(_isLoggedInKey, true); 
  }

Future<void> register(User user, BuildContext context) async {
  var usersJson = _storage.read(_userKey) ?? '[]'; // Default to empty JSON array
  
  if (usersJson is String) {
    usersJson = jsonDecode(usersJson);
  }

  if (usersJson is! List) {
    usersJson = [usersJson]; // Ensure it is a list
  }

  if (usersJson.any((u) => u['username'] == user.username)) {
    throw Exception("Username has been registered!");
  }

  usersJson.add(user.toJson());
  final updatedUsersJson = jsonEncode(usersJson);

  await _storage.write(_userKey, updatedUsersJson);
}

 
  bool isLoggedIn() {
    return _storage.read(_isLoggedInKey) ?? false; 
  }

  Future<void> logout() async {
    await _storage.remove(_isLoggedInKey); 
  }
}

