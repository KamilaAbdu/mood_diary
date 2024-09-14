import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mood_diary/features/data/providers/mood_provider.dart';
import 'package:mood_diary/features/data/sources/mood_local_data_source.dart';
import 'package:mood_diary/features/domain/repositories/mood_repository_impl.dart';
import 'package:mood_diary/features/presentation/screens/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  await initializeDateFormatting('ru_RU', null);
  Intl.defaultLocale = 'ru_RU';

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MoodProvider(
            MoodRepositoryImpl(MoodLocalDataSource()), 
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.nunitoTextTheme(
            Theme.of(context)
                .textTheme
                .apply(bodyColor: Colors.black, displayColor: Colors.black),
          ),
          primarySwatch: Colors.blue,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
