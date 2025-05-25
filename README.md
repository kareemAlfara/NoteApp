# note App

A beautiful, simple, and powerful **note app** built using **Flutter**. This app helps you jot down thoughts, manage daily notes, and stay organized—all with a sleek, responsive UI and offline support.

## 🚀 Features

- 📝 Create, edit, and delete notes
- 🔍 Search and filter through notes
- 🕓 Sort by date created
- 💾 Offline access using local database (Hive)
- 🎨 Clean UI with responsive layout
- 📱 Supports Android & iOS

---
## ScreenShots

| Home Screen | Create Note |
|-------------|-------------|
| ![Home](assets/screenshots/Homenoteapp.png) | ![Create](assets/screenshots/addNote.png) |
![editing](assets/screenshots/editNote.png)

---
## 📂 Folder Structure

```plaintext
lib/
├── data/            # Data layer (models, Hive, repositories)
├── domain/          # Business logic (entities, usecases)
└── presentation/    # UI (screens, widgets, state management)
└── main.dart                # App entry point
```


## 🧰 Tech Stack

- [Flutter](https://flutter.dev)
- [Hive](https://pub.dev/packages/hive)
- [Bloc](https://pub.dev/packages/flutter_bloc)
- [dio](https://pub.dev/packages/dio)
- [Dart](https://dart.dev)

---
## 🛠️ Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/kareemAlfara/NoteApp.git
   cd NoteApp
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Generate Hive type adapters :
   ```bash
   flutter packages pub run build_runner build
   ```

4. Run the app:
   ```bash
   flutter run
   ```

---

## 👤 Author

- [Kareem Alfarra](https://github.com/kareemAlfara/)
- LinkedIn: [linkedin.com/in/kareem-elfara](https://www.linkedin.com/in/kareem-elfara-2aa767337/)

---
