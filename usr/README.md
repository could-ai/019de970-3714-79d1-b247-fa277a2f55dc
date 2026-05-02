# Business Administration Presentation

A Flutter-based presentation app featuring 10 slides that discuss the fundamentals of Business Administration. It is designed with smooth navigation, a modern UI, and responsive image handling tailored for BA students.

## Overview
This application acts as a standalone interactive presentation. It demonstrates how to use Flutter's `PageView` to build a clean, multi-slide experience with custom navigation controls, a progress indicator, and mixed media (text and images). 

## Features
- **10 Custom Slides**: Informative slides walking through topics related to Business Administration, including Finance, Marketing, Strategy, and Analytics.
- **Interactive Navigation**: Move forward and backward through slides using on-screen buttons or swipe gestures.
- **Progress Tracking**: A linear progress bar at the top of the screen visually indicates the current position within the presentation.
- **Embedded Media**: Slides automatically handle layout changes when a network image is included, featuring graceful loading and error states. Business-themed images are used to complement the content.
- **Responsive Layout**: Designed to look great on desktop, web, and mobile screen sizes.

## User Flows
- **Viewing the Presentation**: Upon launch, the user is greeted by the title slide.
- **Navigating**: The user can tap the next (`>`) or previous (`<`) arrows at the bottom of the screen to navigate through the slides. 
- **Tracking Progress**: The slide counter and progress bar update dynamically as the user navigates.

## Tech Stack
- **Framework**: Flutter
- **Language**: Dart
- **UI Components**: `PageView`, `LinearProgressIndicator`, custom `SlideWidget`
- **Images**: Unsplash (Network Images)

## Setup and Run
1. Ensure you have the [Flutter SDK](https://flutter.dev/docs/get-started/install) installed.
2. Clone this repository.
3. Fetch the dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```

---

## About CouldAI
This app was generated with [CouldAI](https://could.ai), an AI app builder for cross-platform apps that turns prompts into real native iOS, Android, Web, and Desktop apps with autonomous AI agents that architect, build, test, deploy, and iterate production-ready applications.