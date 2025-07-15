# Aletha Fitness App

A simple fitness app to help you achieve your fitness goals.

## Architecture

This app uses **Clean Architecture** to separate concerns and create a scalable and maintainable codebase. The architecture is divided into three main layers:

*   **Presentation Layer:** This layer is responsible for the UI and user interaction. It contains the widgets, screens, and state management logic. It depends on the Domain layer to handle business logic.
*   **Domain Layer:** This is the core of the application. It contains the business logic, entities, and use cases. It is independent of the other layers.
*   **Data Layer:** This layer is responsible for fetching data from various sources like APIs or local databases. It implements the repository contracts defined in the Domain layer.

This separation of concerns allows for a more modular, testable, and maintainable codebase. It follows the principles of **Clean Code**, emphasizing readability and simplicity.

## How to Run the App

1.  Make sure you have Flutter installed.
2.  Clone the repository.
3.  Run `flutter pub get` to install the dependencies.
4.  Run `flutter run` to start the app.

## Flutter and Dart Versions

*   **Flutter:** 3.32.4
*   **Dart:** 3.8.1
