# Aletha Fitness App

A simple fitness app to help you achieve your fitness goals.

<p align="center">
  <img src="https://raw.githubusercontent.com/YoushahAnjumCh/AlethaHealth/master/assets/screenshots/1.png" alt="HomeScreen" width="200" style="display: inline-block; margin: 0 5px;" />
  <img src="https://raw.githubusercontent.com/YoushahAnjumCh/AlethaHealth/master/assets/screenshots/2.png" alt="HomeScreen" width="200" style="display: inline-block; margin: 0 5px;" />
  <img src="https://raw.githubusercontent.com/YoushahAnjumCh/AlethaHealth/master/assets/screenshots/3.png" alt="HomeScreen" width="200" style="display: inline-block; margin: 0 5px;" />
  <img src="https://raw.githubusercontent.com/YoushahAnjumCh/AlethaHealth/master/assets/screenshots/4.png" alt="HomeScreen" width="200" style="display: inline-block; margin: 0 5px;" />
  <img src="https://raw.githubusercontent.com/YoushahAnjumCh/AlethaHealth/master/assets/screenshots/5.png" alt="HomeScreen" width="200" style="display: inline-block; margin: 0 5px;" />
  <img src="https://raw.githubusercontent.com/YoushahAnjumCh/AlethaHealth/master/assets/screenshots/6.png" alt="HomeScreen" width="200" style="display: inline-block; margin: 0 5px;" />
  <img src="https://raw.githubusercontent.com/YoushahAnjumCh/AlethaHealth/master/assets/screenshots/7.png" alt="HomeScreen" width="200" style="display: inline-block; margin: 0 5px;" />
  <img src="https://raw.githubusercontent.com/YoushahAnjumCh/AlethaHealth/master/assets/screenshots/8.png" alt="HomeScreen" width="200" style="display: inline-block; margin: 0 5px;" />
  <img src="https://raw.githubusercontent.com/YoushahAnjumCh/AlethaHealth/master/assets/screenshots/9.png" alt="HomeScreen" width="200" style="display: inline-block; margin: 0 5px;" />
  <img src="https://raw.githubusercontent.com/YoushahAnjumCh/AlethaHealth/master/assets/screenshots/10.png" alt="HomeScreen" width="200" style="display: inline-block; margin: 0 5px;" />
</p>


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
