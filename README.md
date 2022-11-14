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

## App screenshots

<p align="center">
  <img width="32%" alt="Firebase Authentication" src="res/auth.png" />
  <img width="32%" alt="Firebase Cloud Firestore" src="res/firestore.png" />
  <img width="32%" alt="Firebase Cloud Functions" src="res/functions.png" />
</p>
<p align="center">
  <img width="32%" alt="Firebase Storage" src="res/storage.png" />
  <img width="32%" alt="Firebase Remote Config" src="res/remote_config.png">
</p>

## How to run the code

The code uses Firebase as a backend but the Firebase configuration is not included. You have to add it yourself because there are paid features that might cause costs. Refer to [this article](https://medium.com/gitconnected/how-to-create-a-firebase-project-and-link-it-with-your-flutter-app-acd826be8356) above on how to perform the necessary steps in detail.

1. Create a Firebase project
2. Install [Firebase CLI](https://firebase.google.com/docs/cli)
3. Install [FlutterFire CLI](https://pub.dev/packages/flutterfire_cli)
4. Check out the code
5. Execute `firebase login` from the app root folder and log into your created Firebase project
6. Execute `flutterfire configure` from the app root folder and use your created Firebase project
7. A file `firebase_options.dart` will be created in your `lib` folder
8. (**Cloud Functions only**) Execute `firebase deploy --only functions` to deploy the demo functions
9. (**Storage and Cloud Firestore only**) Set security rules for Storage and Firestore
10. (**App Check only**) Register an attestation provider and enforce App Check
11. (**Remote Config only**) Create parameters with conditions for Remote Config
12. Run the app

## Hints

- 💡 Social sign-in only works on web platform
- 💡 You need to replace the link on `functions_page.dart` according to your deployed function link!
- 💡 Don't forget to set the security rules for Storage and Firestore!
- 💡 To get file downloads from Firebase Storage work on the web platform, you need to set specific [CORS rules](https://firebase.google.com/docs/storage/web/download-files#cors_configuration)!
- 💡 [The Play Integrity attestation provider is not working](https://github.com/firebase/flutterfire/issues/9178) at the moment. Use SafetyNet as replacement! => [SafetyNet deprecated, supported until June 2024!](https://developer.android.com/training/safetynet/deprecation-timeline))

## Platforms

Overview of supported platforms of the used [Firebase packages](https://firebase.google.com/docs/flutter/setup?platform=ios#add-plugins).

✔ - supported ❌ - not supported

||Android|iOS|Web|MacOS|Windows|Linux|
|---|:-:|:-:|:-:|:-:|:-:|:-:|
|[Authentication](https://pub.dev/packages/firebase_auth)| ✔ | ✔ | ✔ | ✔ | ❌ | ❌ |
|[Firestore](https://pub.dev/packages/cloud_firestore)| ✔ | ✔ | ✔ | ✔ | ❌ | ❌ |
|[Functions](https://pub.dev/packages/cloud_functions)| ✔ | ✔ | ✔ | ✔ | ❌ | ❌ |
|[Storage](https://pub.dev/packages/firebase_storage)| ✔ | ✔ | ✔ | ✔ | ❌ | ❌ |
|[App Check](https://pub.dev/packages/firebase_app_check)| ✔ | ✔ | ✔ | ✔ | ❌ | ❌ |
|[Remote Config](https://pub.dev/packages/firebase_remote_config)| ✔ | ✔ | ✔ | ✔ | ❌ | ❌ |

## Support

If you like this post or my work in general, feel free to support me in any way ❤

- You can [become a Medium member via my referral link](https://xeladu.medium.com/membership) for just $5 a month! 💖
- You can [buy me a coffee](https://www.buymeacoffee.com/xeladu) ☕
- You can [browse my Gumroad store](https://xeladu.gumroad.com) for ebooks and freebies 📙
- You can [join my free monthly Medium Newsletter](https://bit.ly/xeladu-medium) 💌
- You can [find all my published stuff here](https://xeladu.medium.com/%E2%84%B9-xeladus-info-point-find-quickly-what-you-need-bbe620e97d8c) 📑
- You can buy [my ebook](https://xeladu.gumroad.com/l/ffc) 📗
