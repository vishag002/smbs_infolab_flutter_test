# SMBS InfoLab Flutter Test

This project is my submission for the Flutter machine test provided by **SMBS Info Solutions**.

## 📱 App Overview

- **Login Screen**  
  Users can log in using their email and password. Upon successful login, an authentication token is generated, saved in Shared Preferences, and displayed in a toast message. The app then navigates to the Home screen.

- **Splash Screen**  
  When the app launches, the splash screen checks whether the authentication token exists in Shared Preferences.

  - If the token is present, the app navigates directly to the Home screen.
  - If not, it navigates to the Login screen.

- **Home Screen**  
  This screen displays a list of products fetched from an API.  
  It includes a search bar for filtering products by name.  
  The app bar contains a Logout button that clears the stored token and navigates back to the Login screen.

- **Product View Screen**  
  When a product is tapped, the app navigates to the Product View screen, passing the product ID.  
  The product details are fetched from the API using this ID.  
  This screen also features Edit and Delete buttons at the bottom for modifying or removing the product.

## 🔗 GitHub Repository

[https://github.com/vishag002/smbs_infolab_flutter_test](https://github.com/vishag002/smbs_infolab_flutter_test)

## 📦 APK

The built APK is attached to the email sent to HR.

## 🛠 Tech Stack

- Flutter
- Dart
- Shared Preferences for local storage
- HTTP package for API calls
- FlutterToast package for toast

---
