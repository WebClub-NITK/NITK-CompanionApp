import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:utilapp/injection_container.dart';
import 'package:utilapp/presentation/core/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencyInjection();

  await Firebase.initializeApp();
  runApp(AppWidget());
}
