import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const DevCardApp());
}

class DevCardApp extends StatefulWidget {
  const DevCardApp({super.key});

  @override
  State<DevCardApp> createState() => _DevCardAppState();
}

class _DevCardAppState extends State<DevCardApp> {
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF1E1E1E),
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
          onPrimary: Color(0xFF121212),
          secondary: Color(0xFF7C4DFF),
          onSecondary: Colors.white,
        ),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.manrope(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
          bodyLarge: GoogleFonts.inter(fontSize: 16, color: Color(0xFFE0E0E0)),
          bodySmall: GoogleFonts.jetBrainsMono(fontSize: 14, color: Color(0xFFB0B0B0)),
        ),
      ),
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        cardColor: const Color(0xFFF5F5F5),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF121212),
          onPrimary: Colors.white,
          secondary: Color(0xFF7C4DFF),
          onSecondary: Colors.white,
        ),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.manrope(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
          bodyLarge: GoogleFonts.inter(fontSize: 16, color: Color(0xFF2C2C2C)),
          bodySmall: GoogleFonts.jetBrainsMono(fontSize: 14, color: Color(0xFF757575)),
        ),
      ),
      home: DevCardPage(onToggleTheme: () => setState(() => isDarkMode = !isDarkMode), isDarkMode: isDarkMode),
    );
  }
}

class DevCardPage extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  const DevCardPage({super.key, required this.onToggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Портфолио', style: textTheme.bodyLarge),
        actions: [IconButton(icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode, color: colorScheme.secondary), onPressed: onToggleTheme)],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Алексей Котов', style: textTheme.displayLarge),
                      const SizedBox(height: 8),
                      Text('Фуллстек разработчик на Flutter и Node.js', style: textTheme.bodyLarge),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.code, color: colorScheme.secondary),
                          const SizedBox(width: 8),
                          Text('kotov.dev', style: textTheme.bodySmall),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.mail_outline, color: colorScheme.secondary),
                          const SizedBox(width: 8),
                          Text('alex@kotov.dev', style: textTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Проекты', style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      Text('- Платформа для онлайн-курсов на Flutter + Firebase', style: textTheme.bodySmall),
                      Text('- Telegram-бот на Node.js + MongoDB', style: textTheme.bodySmall),
                      Text('- Личный сайт с блогом на Next.js', style: textTheme.bodySmall),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Связь в соцсетях', style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 12,
                        children: [
                          IconButton(icon: Icon(Icons.telegram, color: colorScheme.secondary), onPressed: () {}, tooltip: 'Telegram'),
                          IconButton(icon: Icon(Icons.linked_camera, color: colorScheme.secondary), onPressed: () {}, tooltip: 'LinkedIn'),
                          IconButton(icon: Icon(Icons.code, color: colorScheme.secondary), onPressed: () {}, tooltip: 'GitHub'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.secondary,
                  foregroundColor: colorScheme.onSecondary,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                icon: const Icon(Icons.download),
                label: const Text('Скачать резюме (PDF)'),
                onPressed: () {
                  // TODO: implement PDF download
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
