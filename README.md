=## Features of the application

- Creading, editing and deleting notes. Each note has a title, content and a colored label assigned to it.
- Online sync with Firebase Firestore.
- Offline storage of notes using [sqflite](https://pub.dev/packages/sqflite). Notes are stored offline for persistence accross restarts until the user switches to online sync. Then only online sync.
- Searching for notes based on title and content.
- A theme switcher to switch between dark and light theme. The user's preference is saved among app restarts using [shared_prederences](https://pub.dev/packages/shared_preferences).

## A demo of creating notes

![Android Emulator - Pixel_3a_API_34 2024-07-17 15-48-04](https://user-images.githubusercontent.com/36075176/113130054-3da5cf80-9239-11eb-9ad6-6e0a79fc4b31.gif)

## Demoing the search functionality

![Android Emulator - Pixel_3a_API_34 2024-07-17 15-53-56](https://user-images.githubusercontent.com/36075176/113130422-af7e1900-9239-11eb-8fa5-c4f53922abc9.gif)
