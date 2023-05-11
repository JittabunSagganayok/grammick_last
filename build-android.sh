fvm flutter clean
fvm flutter pub get
cd android
fastlane increment_build_number
fvm flutter --no-color build apk
fastlane upload_to_firebase