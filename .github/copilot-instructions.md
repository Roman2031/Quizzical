<!--
Guidance for AI coding agents working on the `quizzical` Flutter app.
Keep this short, actionable, and specific to this repo's layout and workflows.
--> 

# Copilot instructions — quizzical

Purpose: help an AI assistant make small-to-medium code changes, fixes, and feature additions in this Flutter app without breaking platform integrations.

- Root entrypoint: `lib/main.dart` — changes here alter the app's startup, theme, and `home` widget.
- Primary Dart code lives in `lib/` (add new widgets, state management, routes here).
- Tests: unit/widget tests live in `test/` (example: `test/widget_test.dart`).

Quick commands (Windows PowerShell):
```powershell
# install deps
flutter pub get

# run on the default device (emulator or connected physical device)
flutter run

# run tests
flutter test

# analyze & format
flutter analyze
dart format .

# build artifacts
flutter build apk      # Android
flutter build ipa      # iOS (macOS host + codesign)
```

Project-specific notes and conventions
- Linting / style: this repo uses `flutter_lints` and `analysis_options.yaml`. Follow existing lint rules and prefer null-safe idiomatic Dart.
- Dependency edits: update `pubspec.yaml` and run `flutter pub get`; commit `pubspec.lock` when appropriate.
- Platform code:
  - Android uses Kotlin/Gradle in `android/` (Gradle Kotlin DSL files like `build.gradle.kts`). Prefer using `flutter build` / `flutter run` unless modifying native Android code.
  - iOS uses Swift in `ios/Runner`. Building iOS requires a macOS host and CocoaPods. Avoid editing generated files under `ios/Flutter/ephemeral`.
- Generated files: do not hand-edit generated plugin registrant files (e.g., `ios/Runner/GeneratedPluginRegistrant.*`, `android` generated outputs). If plugins are added, run `flutter pub get` and let the tooling regenerate.

Patterns observed in code (use these as examples when modifying behavior):
- `lib/main.dart` builds a `MaterialApp` with `ThemeData.colorScheme.fromSeed(...)`; preserve theme seed usage when changing app colors.
- The sample `MyHomePage` is a stateful widget using `setState` for local state changes — follow this pattern for simple local state, but consider introducing a state management package only when multiple screens share state.

Where to add features
- UI pages / widgets: add files under `lib/` (e.g., `lib/screens/`, `lib/widgets/`). Keep `main.dart` minimal — it should only wire up theme/routes and the initial home.
- Assets: register assets and fonts in `pubspec.yaml` (see commented example in `pubspec.yaml`) and add files under `assets/` or platform asset folders.

Build & CI considerations
- `flutter analyze` and `flutter test` are the minimal checks run locally/CI. If you modify native code, include platform build steps in CI (Android: use Gradle wrapper in `android/`, iOS: run on macOS with CocoaPods installed).

Files and directories to reference when making changes
- `lib/main.dart` — app entry and theme
- `pubspec.yaml` / `pubspec.lock` — dependencies and assets
- `analysis_options.yaml` — lint rules
- `test/widget_test.dart` — example test harness
- `android/` and `ios/` — native integration points

Common pitfalls to avoid (repo-specific)
- Don’t commit changes to ephemeral/generated files under `ios/Flutter/ephemeral` or `macos/Flutter/ephemeral`.
- Avoid making large dependency upgrades without running `flutter analyze` and `flutter test` — this is a template app and may rely on stable Flutter SDK behavior.

If something is unclear, ask for which screen/feature to change and whether native (Android/iOS) changes are allowed; provide a short plan and a single small PR-sized patch.

-- End of file
