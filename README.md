# Noty Notes
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/abderazak-py/noty_notes)

Noty Notes is a simple, cross-platform note-taking application built with Flutter. It utilizes the GetX framework for state management, routing, and dependency injection, ensuring a clean and scalable architecture. The app provides essential note-taking features with support for theming, internationalization, and local storage.

## Features

- **CRUD Operations:** Create, read, update, and delete notes.
- **Local Persistence:** Notes are saved locally on the device using `GetStorage`.
- **Note Pinning:** Pin important notes to keep them at the top of the list.
- **Color Customization:** Assign custom colors to notes using an integrated color picker.
- **Light & Dark Mode:** Seamlessly switch between light and dark themes. The theme selection is persisted across app sessions.
- **Multi-language Support:** The interface is available in English and Arabic, with an easy-to-use language switcher.
- **Responsive UI:** A clean and intuitive user interface that works across various screen sizes.
- **Cross-Platform:** Single codebase for Android, iOS, Web, Windows, macOS, and Linux.

## Technology Stack

- **Framework:** Flutter
- **State Management:** GetX
- **Routing & Navigation:** GetX
- **Local Storage:** GetStorage
- **UI Components:**
    - `flutter_colorpicker`: For choosing custom note colors.
    - Material Design widgets.

## Project Structure

The project follows a standard GetX pattern to separate business logic from UI, making the code clean and maintainable.

```
lib/
└── app/
    ├── binding/       # Binds dependencies to routes
    ├── controllers/   # Contains business logic (NoteController, ThemeController)
    ├── models/        # Data models for the application (NoteModel)
    ├── routes/        # Defines application routes and pages
    ├── services/      # Handles backend tasks like storage, theming, and translations
    └── views/         # Contains UI screens and widgets
```

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing.

### Prerequisites

Ensure you have the Flutter SDK installed on your machine. For more information, refer to the [official Flutter documentation](https://flutter.dev/docs/get-started/install).

### Installation & Running

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/abderazak-py/noty_notes.git
    cd noty_notes
    ```

2.  **Install dependencies:**
    ```sh
    flutter pub get
    ```

3.  **Run the application:**
    ```sh
    flutter run
    ```

You can run the application on any supported platform (e.g., Android emulator, iOS simulator, or as a desktop/web app).