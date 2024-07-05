# Todo App Project

Welcome to the Todo App project! This project serves as a technical assessment for a job application. The goal is to implement a Todo app using Flutter, following clean architecture principles and utilizing SQfLite for local database management.


## Table of Contents

-   [Features](#Features)
-   [Architecture](#architecture)
-   [Requirements](#requirements)
-   [Getting Started](#getting-started)
-   [Project Structure](#project-structure)
-   [Usage](#usage)
-   [Contributing](#contributing)
-   [License](#license)

## Features

This Todo app includes the following features:

-   Create new notes
-   Edit existing notes
-   Delete notes
-   Mark tasks as complete with a checkbox


## Architecture

The app is built using the Clean Architecture pattern, which separates the code into different layers to enhance maintainability and testability. The main layers include:

1.  **Presentation Layer**: Contains the UI code, including screens and widgets.
2.  **Domain Layer**: Contains business logic, use cases, and entities.
3.  **Data Layer**: Manages data sources, repositories, and models. Here, SQfLite is used for the local database.


## Requirements

To run this project, you will need:

-   Flutter SDK: Install Flutter
-   A code editor (e.g., Visual Studio Code or Android Studio)
-   Android or iOS device/emulator


## Getting Started

Follow these steps to get started with the project:

1.  **Clone the repository:**
    
    `git clone https://gitlab.com/keaunthz/todo-app-test.git` 
   
    
2.  **Install dependencies:**
    
    `flutter pub get` 
    
3.  **Run the app:**
    
    `flutter run`


## Project Structure

The project structure follows the Clean Architecture pattern and is organized as follows:
```
lib/
├── data/
│   ├── database/
│   │   └── todo_database.dart
│   └── repositories/
│       └── todo_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── todo.dart
│   ├── repositories/
│   │   └── todo_repository.dart
│   └── usecases/
│       └── add_todo_usecase.dart
│       └── delete_todo_usecase.dart
│       └── edit_todo_usecase.dart
│       └── get_todo_usecase.dart
├── presentation/
│   ├── bindings/
│   │   ├── apps_binding.dart
│   ├── controller/
│   │   ├── todo_controller.dart
│   ├── views/
│   │   ├── add_or_edit_todo_view.dart
│   │   └── todo_list_view.dart
│   ├── widgets/
│   │   └── count_todo_widget.dart
│   │   └── list_view_widget.dart
│   │   └── today_widget.dart
└── main.dart

```

## Usage

After running the app, you can:

-   **Create a note**: Tap the "+" button, enter the details, and save.
-   **Edit a note**: Tap on right pen icon on a note to modify its content.
-   **Delete a note**: Swipe right on a note to delete it.
-   **Mark as complete**: Tap the note to mark it as complete.

##

Thank you for your interest in this project. I hope you are satisfied with my test project. If you have any questions, please feel free to reach out.