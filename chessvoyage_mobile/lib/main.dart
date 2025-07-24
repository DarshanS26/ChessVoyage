import 'package:flutter/material.dart';

void main() {
  runApp(const ChessVoyageApp());
}

class ChessVoyageApp extends StatelessWidget {
  const ChessVoyageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChessVoyage',
      theme: ThemeData(
        // Define a calming, soft color palette inspired by Material You
        // Primary Blue (for accents, buttons)
        primaryColor: const Color(0xFF007BFF), // Brilliant Blue
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF007BFF), // Brilliant Blue
          secondary: const Color(0xFFFFA500), // Energetic Orange for accent
          surface: const Color(0xFFF8F9FA), // Light Background
          background: const Color(0xFFF0F2F5), // Slightly darker background for depth
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: const Color(0xFF212529), // Dark Text
          onBackground: const Color(0xFF212529), // Dark Text
          // Apply softer tones for the overall UI
          tertiary: const Color(0xFF8BB8E8), // Softer blue
          onTertiary: Colors.white,
          // Use a more muted tone for card backgrounds for calmness
          surfaceVariant: Colors.white, // Cards will be pure white
          onSurfaceVariant: const Color(0xFF212529),
        ),
        // Apply rounded corners globally where possible
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0056b3), // Darker blue for app bar
          foregroundColor: Colors.white,
          elevation: 4, // Subtle shadow
          centerTitle: true,
        ),
        cardTheme: CardThemeData(
          elevation: 4, // Material Design elevation
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // Soft edges for cards
          ),
          margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        ),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Soft edges for buttons
          ),
        ),
        // Text theme for readability
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.bold, color: Color(0xFF212529)),
          displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Color(0xFF212529)),
          displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFF212529)),
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF212529)),
          headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF212529)),
          headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF212529)),
          titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Color(0xFF212529)),
          titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF212529)),
          titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF212529)),
          bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF212529)),
          bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF212529)),
          bodySmall: TextStyle(fontSize: 12, color: Color(0xFF212529)),
          labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white), // For buttons
          labelMedium: TextStyle(fontSize: 12, color: Color(0xFF212529)),
          labelSmall: TextStyle(fontSize: 11, color: Color(0xFF212529)),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // For bottom navigation bar

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // In a real app, this would navigate to different screens
    // For now, it just updates the selected index
  }

  @override
  Widget build(BuildContext context) {
    // Access the defined color scheme
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background, // Overall background color
      appBar: AppBar(
        title: const Text('ChessVoyage', style: TextStyle(color: Colors.white)),
        // No leading or actions for a clean home page, but you could add settings/profile here
      ),
      body: SingleChildScrollView( // Allows content to scroll if it overflows
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section
              Text(
                'Hello, Chess Enthusiast!',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: colorScheme.onBackground),
              ),
              const SizedBox(height: 16),
              Text(
                'Your personalized AI chess mentor is ready to help you master the game. Let\'s begin your journey to improvement!',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: colorScheme.onBackground),
              ),
              const SizedBox(height: 32),

              // Chessboard Placeholder Card
              Center(
                child: Card(
                  color: colorScheme.surfaceVariant, // Card background color
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Your Current Game / Analysis',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: colorScheme.onSurfaceVariant),
                        ),
                        const SizedBox(height: 16),
                        // Placeholder for the Chess Board
                        Container(
                          width: double.infinity, // Take full width of card
                          height: MediaQuery.of(context).size.width * 0.8, // Maintain aspect ratio (e.g., 80% of screen width)
                          decoration: BoxDecoration(
                            color: colorScheme.tertiary.withOpacity(0.3), // Softer blue for board area
                            borderRadius: BorderRadius.circular(8.0), // Soft edges for the board area
                            border: Border.all(color: colorScheme.primary, width: 2), // Primary blue border
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Interactive Chess Board Placeholder',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: colorScheme.onPrimary.withOpacity(0.7)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Action Buttons
                        Wrap(
                          spacing: 12.0, // Horizontal space between buttons
                          runSpacing: 12.0, // Vertical space if buttons wrap
                          alignment: WrapAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                // Logic for starting a new game
                              },
                              icon: const Icon(Icons.play_arrow, color: Colors.white),
                              label: Text('New Game', style: Theme.of(context).textTheme.labelLarge),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorScheme.primary, // Primary blue button
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                                elevation: 4, // Subtle shadow
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                // Logic for analyzing a game
                              },
                              icon: const Icon(Icons.analytics, color: Colors.white),
                              label: Text('Analyze Game', style: Theme.of(context).textTheme.labelLarge),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorScheme.primary,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                                elevation: 4,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // AI Explanation Feature Highlight
              Card(
                color: colorScheme.surfaceVariant,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AI-Powered Explanations',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Understand the "why" behind every move. Our unique AI interprets complex engine analysis into clear, human-like, and voice-driven insights tailored to your skill level.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Logic for learning more about AI explanations
                        },
                        icon: const Icon(Icons.lightbulb_outline, color: Colors.white),
                        label: Text('Learn More', style: Theme.of(context).textTheme.labelLarge),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.secondary, // Accent orange button
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                          elevation: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Personalized Progress Section
              Card(
                color: colorScheme.surfaceVariant,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Track Your Progress',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Access your saved games and detailed analysis history. See your skill level improve and identify areas for growth with personalized insights.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Logic for navigating to progress/saved games
                        },
                        icon: const Icon(Icons.history, color: Colors.white),
                        label: Text('My Progress', style: Theme.of(context).textTheme.labelLarge),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                          elevation: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Lessons',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: colorScheme.primary, // Selected icon color
        unselectedItemColor: Colors.grey[600], // Unselected icon color
        onTap: _onItemTapped,
        backgroundColor: colorScheme.surfaceVariant, // Background of the bar
        elevation: 8, // Subtle shadow for the bar
        type: BottomNavigationBarType.fixed, // Ensures labels are always visible
      ),
    );
  }
}
