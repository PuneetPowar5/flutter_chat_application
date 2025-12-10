# Flutter Application – Local Development Guide

This guide explains how to run the Flutter application locally, including how to properly run the Angular dashboard inside the WebView.

Follow each section carefully to ensure your setup works on Android or iOS.

---

## 1. Prerequisites

- **Flutter SDK** (latest version)
- **Xcode** (macOS only)
- **Android Studio** (Required for Android emulator)
- **Angular Application Running Locally**
- **Run `npm i` or `npm install` to get all dependencies**

---

## 2. Running Angular Application Locally

Please go to the following repository (https://github.com/PuneetPowar5/angular_webpage), clone it, and follow the steps in its README.md to run the corresponding Angular application locally.

---

## 3. Start an Emulator (Android or iOS)

If you choose Android:

Follow the following guide to setup the emulator:

https://developer.android.com/studio/run/emulator

If you choose iOS (macOS only):

Follow the following guide to setup the emulator:

https://developer.android.com/studio/run/emulator

start it by running this command in terminal:

```
open -a Simulator
```

## 4. Run the Flutter App

Once the Angular server is running and an emulator is active, you can launch the Flutter app.

**For Android Emulators:**

Run this command in terminal:

```
flutter run -d emulator
```

**For iOS Emulators:**

Run this command in terminal:

```
flutter run -d ios
```

This will load the application into your emulator from which you can interact with.
