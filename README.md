# dyslexia_reading_speed_app

App aimed to aid in calculating reading speed when performing dyslexia tests and evaluation.

## Installation

Install flutter following the instructions on [flutter's official website](https://docs.flutter.dev/get-started/install/linux/android).

## Running the app

In the root of this repository, run the app:

```shell
flutter run
```

Choose whether you want to run the app on (1) a Linux application or (2) Chrome Webpage.
Some useful tools while developing are the hot reload ('r'), hot restart ('R') and debug painting ('p').

## Building the app

First, accept android licenses (you might need to install sdk build tools and provide the path to the bin files in order to run sdkmanager):

```shell
sdkmanager --licenses
```

For building the .apk file, just run:

```shell
flutter build apk
```

For more information, including building iOS apps and publishing to the play/app store, please refer to [flutter's deployment documentation](https://docs.flutter.dev/deployment).

## Debugging Flutter installation

Run:

```shell
flutter doctor
```