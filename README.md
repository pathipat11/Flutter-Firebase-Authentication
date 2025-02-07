# Flutter Firebase Authentication

This project demonstrates user authentication using Firebase Authentication integrated with a Flutter application. It includes features such as account creation, login, and logout functionalities.

## Features
- **Firebase Authentication:** Secure user sign-up and sign-in.
- **Account Management:**
  - Create account with email and password.
  - Log in with existing credentials.
  - Log out functionality.
- **Password Validation:** Ensures that passwords match during account creation.
- **User Persistence:** Redirects logged-in users directly to the Home screen.

## Prerequisites

Before running this project, ensure you have the following installed:
- [Flutter](https://flutter.dev/docs/get-started/install)
- [Firebase CLI](https://firebase.google.com/docs/cli)

### Firebase Setup
1. Go to the [Firebase Console](https://console.firebase.google.com/).
2. Create a new project.
3. Enable Firebase Authentication and set up email/password authentication.
4. Download the Firebase configuration file (`google-services.json` for Android or `GoogleService-Info.plist` for iOS) and place it in the appropriate directory.

## Getting Started

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd flutter_firebase_auth
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Project Structure
```
lib/
├── main.dart                # Main entry point
├── login        # Login screen implementation
├── register # Create account screen implementation
└── home_page          # Home screen with logout functionality
```

## Screenshots
Add screenshots of the app's key features here if available.

## How to Use

1. **Create an Account:**
   - Open the app and click "Create Account."
   - Enter email and password, confirm the password.
   - Click "Create Account" to register.

2. **Log In:**
   - Enter your email and password.
   - Click "Login" to access the Home screen.

3. **Log Out:**
   - Tap on your email displayed in the top right corner.
   - Click the "Logout" button to log out.

## Known Issues
- Ensure that Firebase configuration is correctly set up.
- Weak password errors and duplicate account detection are handled.

## Future Improvements
- Add Forgot Password functionality.
- Improve UI and error message display.
- Integrate additional authentication methods (Google, Facebook).

## License
This project is open-source and available under the [MIT License](LICENSE).