import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'providers/agent_provider.dart';
import 'providers/theme_provider.dart';
import 'theme/color_scheme.dart';

void main() {
  runApp(const AutoCareApp());
}

class AutoCareApp extends StatelessWidget {
  const AutoCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AgentProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'AutoCare ONE',
            debugShowCheckedModeBanner: false,
            theme: AppColorScheme.getLightTheme(),
            darkTheme: AppColorScheme.getDarkTheme(),
            themeMode: themeProvider.themeMode,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
