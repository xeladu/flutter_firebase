# The Flutter Firebase Compendium Demo Application

![The Flutter Firebase Compendium](res/firebase_compendium_logo.png)

This is the companion app of the Flutter Firebase Compendium with code examples.

The Flutter Firebase Compendium is an article series published on [Medium](https://medium.com/@xeladu/list/the-flutter-firebase-compendium-2ec07e25baba). It explains how to use Firebase services from a Flutter application.

I recommend buying [my ebook](https://xeladu.gumroad.com/l/ffc). It contains a lot more details and will save you many hours of research time to develop your apps quicker.

## Content

- 🔹 [Firebase project setup](https://medium.com/gitconnected/how-to-create-a-firebase-project-and-link-it-with-your-flutter-app-acd826be8356)
- 🔹 [Firebase Authentication](https://levelup.gitconnected.com/how-to-use-firebase-authentication-with-your-flutter-app-4603c1b78156)
- 🔹 [Firebase Cloud Firestore](https://levelup.gitconnected.com/how-to-use-firebase-cloud-firestore-with-a-flutter-app-2110da689e08)
- 🔹 [Firebase Cloud Functions](https://levelup.gitconnected.com/how-to-work-with-firebase-cloud-functions-from-a-flutter-app-fb818c01b0db)
- 🔹 [Firebase Storage](https://medium.com/gitconnected/how-to-easily-store-objects-in-firebase-storage-from-your-flutter-app-deabc475d407)
- 🔹 [Firebase App Check](https://levelup.gitconnected.com/how-to-secure-your-firebase-backend-access-with-app-check-for-flutter-apps-b54cbe777fb2?sk=b934d4a26b5d5a80dfabd94b0c76fad6)
- 🔹 [Firebase Remote Config](https://levelup.gitconnected.com/how-to-use-server-side-configurations-with-firebase-remote-config-3996b5606079)
- 🔹 [Firebase Hosting](https://levelup.gitconnected.com/how-to-host-your-flutter-web-app-with-firebase-hosting-67d3e4657002)

## How to run the code

The code uses Firebase as a backend but the Firebase configuration is not included. You have to add it yourself because there are paid features that might cause costs. Refer to [this article](https://medium.com/gitconnected/how-to-create-a-firebase-project-and-link-it-with-your-flutter-app-acd826be8356) above on how to perform the necessary steps in detail.

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

- 💡 Social sign-in only works on web platform
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

## About me

- Follow me on [Medium](https://xeladu.medium.com)
- Visit my [QuickCoder blog](https://quickcoder.org)
- Check out my [digital products](https://xeladu.gumroad.com)
