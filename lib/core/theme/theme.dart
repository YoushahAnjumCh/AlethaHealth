import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A class that contains all theme configurations for the fitness application.
/// Implements Therapeutic Minimalism design style with Wellness Clarity color theme.
class AppTheme {
  AppTheme._();

  // Wellness Clarity Color Palette - optimized for fitness app contexts
  static const Color primaryLight = Color(
    0xFF2E7D5A,
  ); // Deep forest green for trust and wellness
  static const Color primaryVariantLight = Color(
    0xFF1E5A3F,
  ); // Darker variant for depth
  static const Color secondaryLight = Color(0xFFF4F7F5); // Soft sage background
  static const Color accentLight = Color(
    0xFF4A90E2,
  ); // Clear blue for interactive elements
  static const Color successLight = Color(
    0xFF27AE60,
  ); // Vibrant green for completion states
  static const Color errorLight = Color(
    0xFFE74C3C,
  ); // Clear red for error states
  static const Color backgroundLight = Color(
    0xFFF4F7F5,
  ); // Soft sage background
  static const Color surfaceLight = Color(
    0xFFFFFFFF,
  ); // Pure white for card backgrounds
  static const Color textPrimaryLight = Color(
    0xFF2C3E50,
  ); // Dark slate for optimal readability
  static const Color textSecondaryLight = Color(
    0xFF7F8C8D,
  ); // Medium gray for supporting information
  static const Color dividerLight = Color(
    0xFFE8F4F0,
  ); // Subtle green-tinted gray

  // Dark theme adaptations maintaining wellness focus
  static const Color primaryDark = Color(
    0xFF4A9B6E,
  ); // Lighter forest green for dark mode
  static const Color surfaceDark = Color(
    0xFF1E2420,
  ); // Dark surface with green tint
  static const Color textPrimaryDark = Color(
    0xFFECF0F1,
  ); // Light text for dark mode

  // Shadow colors for elevation-based system
  static const Color shadowLight = Color(
    0x1A000000,
  ); // 10% opacity for subtle depth

  /// Light theme optimized for fitness app usage
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primaryLight,
      onPrimary: surfaceLight,
      primaryContainer: primaryVariantLight,
      onPrimaryContainer: surfaceLight,
      secondary: accentLight,
      onSecondary: surfaceLight,
      secondaryContainer: secondaryLight,
      onSecondaryContainer: textPrimaryLight,
      tertiary: successLight,
      onTertiary: surfaceLight,
      tertiaryContainer: successLight.withValues(alpha: 0.1),
      onTertiaryContainer: textPrimaryLight,
      error: errorLight,
      onError: surfaceLight,
      surface: surfaceLight,
      onSurface: textPrimaryLight,
      onSurfaceVariant: textSecondaryLight,
      outline: dividerLight,
      outlineVariant: dividerLight.withValues(alpha: 0.5),
      shadow: shadowLight,
      scrim: shadowLight,
      inverseSurface: surfaceDark,
      onInverseSurface: textPrimaryDark,
      inversePrimary: primaryDark,
    ),
    scaffoldBackgroundColor: backgroundLight,
    cardColor: surfaceLight,
    dividerColor: dividerLight,

    // AppBar theme for clean, professional header
    appBarTheme: AppBarTheme(
      backgroundColor: surfaceLight,
      foregroundColor: textPrimaryLight,
      elevation: 2.0,
      shadowColor: shadowLight,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textPrimaryLight,
      ),
      iconTheme: IconThemeData(color: textPrimaryLight),
    ),

    // Card theme with subtle elevation for content hierarchy
    cardTheme: CardThemeData(
      // Changed from CardTheme to CardThemeData
      color: surfaceLight,
      elevation: 2.0,
      shadowColor: shadowLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),

    // FloatingActionButton for primary actions like "Start Exercise"
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryLight,
      foregroundColor: surfaceLight,
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    ),

    // Button themes optimized for fitness app interactions
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: surfaceLight,
        backgroundColor: primaryLight,
        elevation: 2.0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryLight,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        side: const BorderSide(color: primaryLight, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryLight,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    ),

    // Input decoration optimized for fitness app forms
    inputDecorationTheme: InputDecorationTheme(
      fillColor: surfaceLight,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: dividerLight, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: dividerLight, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: primaryLight, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: errorLight, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: errorLight, width: 2.0),
      ),
      labelStyle: GoogleFonts.inter(
        color: textSecondaryLight,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: GoogleFonts.inter(
        color: textSecondaryLight.withValues(alpha: 0.7),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      prefixIconColor: textSecondaryLight,
      suffixIconColor: textSecondaryLight,
    ),

    // Checkbox theme for workout selections
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return primaryLight;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(surfaceLight),
      side: BorderSide(color: dividerLight, width: 2.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
    ),

    // Progress indicator theme for exercise tracking
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: primaryLight,
      linearTrackColor: dividerLight,
      circularTrackColor: dividerLight,
    ),

    dialogTheme: DialogThemeData(backgroundColor: surfaceLight),
  );
}
