# Base Mini App Flutter - Clean Architecture with Bloc State Management


## Introduction

A Flutter package that makes it easy and intuitive to implement [Uncle Bob's Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) in Flutter. This package provides basic classes that are tuned to work with Flutter and are designed according to the Clean Architecture.

## Goals

- Keep code clean
- Keep code testable
- Keep code base easily extensible and adaptable
- Ensure State Management Transparency: Design the codebase to treat the chosen state management solution as an implementation detail, enabling seamless exploration and later replacement with minimal project impact.

## Project Structure

```
assets/
│── fonts/               # Font files
│── i18n/                # Languages File
│── icons/               # Icon files
│── images/              # Image files
│
lib/
│── core/                 # Core functionalities
│   ├── colors/          # Theme color definitions
│   ├── local/           # Local storage handling
│   │   ├── shared_preferences.dart
│   ├── network/         # Networking utilities
│   │   ├── helper/
│   │   ├── app_router.dart
│   │   ├── dio.dart
│   ├── routers/         # Routing configurations
│   ├── setting/         # Application settings
│   ├── themes/          # Theme configurations
│   ├── ui_kit/          # UI components library
│   ├── utils/           # Utility functions
│   ├── app_config.dart  # Global application configurations
│   ├── index.dart       # Core module entry point
│
│── data/                 # Data layer
│   ├── impl/            # Repository implementations
│   │   ├── character_repository_impl.dart
│   │   ├── character_repository.dart
│   │   ├── index.dart
│
│── domain/               # Business logic layer
│   ├── model/           # Data models
│   │   ├── base/
│   │   │   ├── base_response.dart
│   │   │   ├── parse_model.dart
│   │   ├── responses/
│   │   │   ├── auth_token_model.dart
│   │   │   ├── character.dart
│   │   │   ├── location.dart
│   │   ├── index.dart
│   ├── usecases/        # Business use cases
│   │   ├── character_use_case.dart
│   │   ├── index.dart
│   ├── index.dart
│
│── features/             # Feature modules
│   ├── detail/          # Detail feature
│   │   ├── cubit/
│   │   ├── pages/
│   ├── home/            # Home feature
│   │   ├── cubit/
│   │   │   ├── home_cubit.dart
│   │   │   ├── home_state.dart
│   │   ├── pages/
│   │   │   ├── home_page.dart
│   │   ├── widgets/
│   │   ├── index.dart
│
│── generated/            # Auto-generated files
│
│── l10n/                 # Localization files
│
│── application.dart      # Application-level setup
│── index.dart            # Main entry point
│── main.dart             # App execution entry

```

### Known limitations

- The initial setup involves dealing with some boilerplate code
- There is a risk of over-engineering the solution

### Known benefits

- A/B testing can be easily applied
- Feature toggles can be effortlessly implemented
- All layers can be independently unit tested
- The unidirectional data flow facilitates code comprehension
- UI becomes an implementation detail - In fact, we could even reuse the Domain and Data layers to create things like CLIs

## Clean Architecture and how it's applied in this project

In this case, we're only discuss three main layers: Features (also called presentation but I renamed it to be more friendly to everyone including newbies), Domain and Data.

### Feature layer (presentation - UI)

This layer includes Flutter framework classes and state management libraries. It handles:

- Application state management
- UI aspects like navigation, data display, internationalization, and UI updates

### Domain layer

This layer represents the core business logic, independent of external layers. It includes:

- Entity classes (e.g., Character entity)
- Use-case classes for specific business logic
- Repository interfaces for data access

### Data layer

This layer interacts with external data sources and converts data to match Domain expectations. It handles:

- Data retrieval from network/databases
- Repository implementations
- Data coordination between sources
- Data (de)serialization to/from JSON
- Caching management


# References

- [Joe Birch - Google GDE: Clean Architecture Course](https://caster.io/courses/android-clean-architecture)
- [Guide to app architecture - Jetpack Guides](https://developer.android.com/jetpack/docs/guide#common-principles)
- [Jason Taylor (+20 years of experience) - Clean Architecture ](https://youtu.be/Zygw4UAxCdg)
- [Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)