This is a notes application built using Flutter. The app supports both online and offline storage of notes, with synchronization to Firebase Firestore when online.

## Features

- Create, read, update, and delete notes.
- Dark mode support.
- Firebase Authentication.
- Offline storage with SQLite.
- Data synchronization with Firebase Firestore.

## State Management

This application uses the `provider` package for state management. Provider is a recommended approach to managing state in Flutter applications as it is easy to use, efficient, and highly scalable.

### Why Provider?

- **Simple to Use**: Provider makes it easy to manage and listen to state changes.
- **Optimized Performance**: It only rebuilds the parts of the widget tree that need to be rebuilt.
- **Scalable**: Suitable for small to large scale applications.

### Implementation

The state of the application is managed in the `AppState` class, which extends `ChangeNotifier`. This class handles all the business logic, including reading, saving, and deleting notes, managing user authentication, and handling theme preferences.

#### AppState Class

The `AppState` class is the central point of state management in this application. Here are some of the key responsibilities of this class:

- **Initialization**: Initializes Firebase, SharedPreferences, and sets the theme.
- **Theme Management**: Toggles between dark and light themes.
- **Note Management**: CRUD operations for notes, either locally using SQLite or remotely using Firebase Firestore.
- **User Authentication**: Handles user login, registration, and data migration from local storage to Firestore.
