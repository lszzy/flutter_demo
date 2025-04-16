if [[ "$1" =~ "true" ]]; then
 flutter pub cache clean
 flutter clean
fi

rm pubspec.lock
flutter pub get
dart run build_runner build --delete-conflicting-outputs

cd ios
rm -rf Pods
rm Podfile.lock
pod install
