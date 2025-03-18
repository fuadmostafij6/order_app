# Github Repo

Call a Api and show repo list and details

## Table of Contents

- [Environment Setup](#environment-setup)
- [How to Run the Project](#how-to-run-the-project)
- [Flutter & Dart Versions](#flutter--dart-versions)
- [Project Architecture](#project-architecture)
- [File Structure](#file-structure)
- [Video](#video)

## Environment Setup

1. **Install Flutter & Dart**  
   Ensure you have Flutter installed. This project requires:
    - **Flutter:** 3.29.0
    - **Dart:** 3.7.0
    - Refer to the [Flutter installation guide](https://flutter.dev/docs/get-started/install) for setup instructions.

2. **Install Dependencies**  
   Navigate to your project directory and run:
   ```bash
   flutter pub get
3. **Additional Setup**
    - Configure your preferred IDE (VS Code, Android Studio, etc.) for Flutter development.
    - Set up your emulator or connect a physical device.

## How to Run the Project

1. **Clone the Repository**

    ```bash
   git clone <repository-url>
   cd <repository-directory>
2. **Install Dependencies** Navigate to your project directory and run:

   ```bash
   flutter pub get
3. **Run the App** Launch your emulator or connect your device and execute:

    ```bash
   flutter run

## Flutter & Dart Versions

- **Flutter:** 3.29.0
- **Dart:** 3.7.0


## Project Architecture

The project is organized to separate concerns and improve maintainability

## Core

- **Constant**:
  Stores API constants, endpoints, exceptions, and app-wide
  settings.
    - **API:** `api.dart`, `api_endpoint.dart`, and `exception.dart`.
    - **App:** Icons, dimensions, strings, styles, and common widgets

- **DB:**
  Contains database services (e.g., `isar_service.dart`).
- **DI:**
  Dependency injection via a service locator (`service_locator.dart`).
- **Initializer:**
  Contains initialization routines (`initializer.dart`).
- **Network:**
  Houses networking utilities including API client, services, and
  response handlers.
- **Routes & Utils:**
  Manages application routing and provides various utility functions.

## Feature

Each feature is self-contained within its module:

- **Model:**
  Defines data structures (e.g., `feature_model.dart`,` extra_model.dart`, `model.dart`).

- **Provider:**
  Manages state specific to the feature (e.g., `feature_provider.dart`, `extra_provider.dart`, `provider.dart`).

- **Repository:**
  Handles data abstraction and access (e.g., `feature_repository.dart`).

- **Screen:**
  Contains UI components and screens (e.g., `feature_screen.dart`, `screen.dart`).

- **Services:**
  Implements additional business logic or service-specific code (e.g., `feature_services.dart`, `services.dart`).

## Additional Folders

- **l10n:**
  Localization files for supporting multiple languages.
- **Packages:**
  Custom packages or shared modules.
- **Providers:**
  Global state management files.

## File Structure

Below is the directory structure for the project:

```bash
.
└── lib/
    ├── core/                  # Common utilities and services
    │   ├── constant/          # Application-wide constants
    │   │   ├── api/           # API related constants and exceptions
    │   │   │   ├── api.dart
    │   │   │   ├── api_endpoint.dart
    │   │   │   └── exception.dart  
    │   │   └── app/           # App specific constants
    │   │       ├── app_icon/  # App icon definitions (PNG & SVG)
    │   │       │   ├── png.dart
    │   │       │   └── svg.dart
    │   │       ├── size/      # Dimensions and sizing constants
    │   │       │   └── dimension.dart
    │   │       ├── string/    # Application strings
    │   │       │   └── app_strings.dart
    │   │       ├── style/     # Styling and theme configuration
    │   │       │   ├── app_colors/  
    │   │       │   │   └── app_colors.dart
    │   │       │   └── config/
    │   │       │       └── theme_config.dart      
    │   │       └── widget/    # Common custom widgets
    │   │           ├── app_text/
    │   │           │   └── app_text.dart
    │   │           ├── app_button/
    │   │           │   └── app_button.dart
    │   │           ├── custom_error_widget/
    │   │           │   └── error_widget
    │   │           ├── text_field/
    │   │           │   └── text_field.dart
    │   │           └── toast/
    │   │               └── app_toast.dart   
    │   ├── db/                # Database services
    │   │   └── isar_service.dart
    │   ├── di/                # Dependency injection
    │   │   └── service_locator.dart
    │   ├── initializer/       # Initialization routines
    │   │   └── initializer.dart
    │   ├── network/           # Networking utilities and API client
    │   │   ├── network.dart
    │   │   ├── api_client.dart
    │   │   ├── api_services.dart
    │   │   └── response.dart
    │   ├── routes/            # Route management
    │   └── utils/             # General utility functions
    ├── feature/               # Feature-specific modules
    │   ├── feature_name/
    │   │   ├── model/         # Data models for the feature
    │   │   │   ├── feature_model.dart
    │   │   │   ├── extra_model.dart (if necessary)
    │   │   │   └── model.dart
    │   │   ├── provider/      # State management for the feature
    │   │   │   ├── feature_provider.dart
    │   │   │   ├── extra_provider.dart (if necessary)
    │   │   │   └── provider.dart
    │   │   ├── repository/    # Data repository for the feature
    │   │   │   └── feature_repository.dart
    │   │   ├── screen/        # UI screens for the feature
    │   │   │   ├── feature_screen/
    │   │   │   │   └── feature_screen.dart
    │   │   │   └── screen.dart 
    │   │   └── services/      # Business logic and additional services
    │   │       ├── feture_services/
    │   │       │   └── feature_services.dart
    │   │       └── services.dart
    │   └── fature.dart         # Entry point or export file for features
    ├── l10n/                  # Localization files
    ├── packages/              # Custom or external packages
    └── providers/             # All providers exported file path
```


## Video
[Click here please](https://drive.google.com/drive/folders/1qtfdswBiy95BDObXCiJJBFI59LQAgzm6?usp=sharing) 
  
