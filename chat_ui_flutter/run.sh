#!/bin/bash
flutter clean
flutter config --enable-web
flutter pub get
flutter run -d chrome
