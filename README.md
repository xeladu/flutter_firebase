# The Flutter Firebase Compendium Demo Application

![The Flutter Firebase Compendium](res/firebase_compendium_logo.png)

This is the companion app of the Flutter Firebase Compendium with code examples.

The Flutter Firebase Compendium is a detailled introduction for Flutter developers to work with Firebase. It explains how to use Firebase services from a Flutter application. Check out [my ebook](https://xeladu.gumroad.com/l/ffc) with many details that will save you many hours of research time to develop your apps quicker. You can learn more about it [here](https://flutter-firebase.quickcoder.org).

## Content

- [Firebase project setup](https://quickcoder.org/firebase-flutter-setup/)
- [Firebase Authentication](https://quickcoder.org/firebase-auth/)
- [Firebase Cloud Firestore](https://quickcoder.org/firebase-firestore/)
- [Firebase Cloud Functions](https://quickcoder.org/firebase-functions/)
- [Firebase Storage](https://quickcoder.org/firebase-storage/)
- [Firebase App Check](https://quickcoder.org/firebase-app-check/)
- [Firebase Remote Config](https://quickcoder.org/firebase-remote-config/)
- [Firebase Hosting](https://quickcoder.org/firebase-hosting/)
- [Firebase Crashlytics](https://quickcoder.org/how-to-monitor-your-mobile-apps-with-firebase-crashlytics/)

## How to run the code

The code uses Firebase as a backend but the Firebase configuration is not included. You have to add it yourself because there are paid features that might cause costs. Refer to [this article](https://quickcoder.org/firebase-flutter-setup/) above on how to perform the necessary steps in detail.

1. Create a Firebase project
2. Install [Firebase CLI](https://firebase.google.com/docs/cli)
3. Install [FlutterFire CLI](https://pub.dev/packages/flutterfire_cli)
4. Check out the code
5. Execute `firebase login` from the app root folder and log into your created Firebase project
6. Execute `flutterfire configure` from the app root folder and use your created Firebase project
7. A file `firebase_options.dart` will be created in your `lib` folder
8. (**Authentication only**) Activate the sign-in providers Email/Password and Google
9. (**Cloud Functions only**) Execute `firebase deploy --only functions` to deploy the demo functions. You might need to run `npm install` from inside the functions folder to make it work. You need to adapt the link in `functions_page.dart` according to your Firebase instance.
10. (**Storage and Cloud Firestore only**) Set security rules for Storage and Firestore
11. (**App Check only**) Register an attestation provider and enforce App Check
12. (**Remote Config only**) Create parameters with conditions for Remote Config
13. Run the app

## Hints

- 💡 Social sign-ins only works on web platform without additional configurations
- 💡 You need to replace the link on `functions_page.dart` according to your deployed function link!
- 💡 Don't forget to set the security rules for Storage and Firestore!
- 💡 To get file downloads from Firebase Storage work on the web platform, you need to set specific [CORS rules](https://firebase.google.com/docs/storage/web/download-files#cors_configuration)!
- 💡 [SafetyNet deprecated, supported until June 2024!](https://developer.android.com/training/safetynet/deprecation-timeline)
- 💡 Play Integrity provider for Android only works for apps that are distributed via Google Play!

## Platforms

Overview of supported platforms of the used [Firebase packages](https://firebase.google.com/docs/flutter/setup?platform=ios#add-plugins).

✔ - supported ❌ - not supported

||Android|iOS|Web|MacOS|Windows|Linux|
|---|:-:|:-:|:-:|:-:|:-:|:-:|
|[Authentication](https://pub.dev/packages/firebase_auth)| ✔ | ✔ | ✔ | ✔ | ✔ | ❌ |
|[Firestore](https://pub.dev/packages/cloud_firestore)| ✔ | ✔ | ✔ | ✔ | ✔ | ❌ |
|[Functions](https://pub.dev/packages/cloud_functions)| ✔ | ✔ | ✔ | ✔ | ❌ | ❌ |
|[Storage](https://pub.dev/packages/firebase_storage)| ✔ | ✔ | ✔ | ✔ | ✔ | ❌ |
|[App Check](https://pub.dev/packages/firebase_app_check)| ✔ | ✔ | ✔ | ✔ | ❌ | ❌ |
|[Remote Config](https://pub.dev/packages/firebase_remote_config)| ✔ | ✔ | ✔ | ✔ | ❌ | ❌ |
|[Crashlytics](https://pub.dev/packages/firebase_crashlytics)| ✔ | ✔ | ❌ | ✔ | ❌ | ❌ |

## About me

- Follow me on [Medium](https://xeladu.medium.com)
- Visit my [QuickCoder blog](https://quickcoder.org)
- Check out my [digital products](https://xeladu.gumroad.com)
