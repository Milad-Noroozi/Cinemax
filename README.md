# 🎬 Cinemax - Movie & Series Discovery App

<div align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge" alt="License">
</div>

<p align="center">
  <strong>🎭 A sleek and modern Flutter app for discovering movies and TV shows, built for movie lovers.</strong>
</p>

<p align="center">
  Browse trending titles, view details, and manage your watchlist with ease.
</p>

---

## ✨ Features

### 🎯 Core Features
- **🎬 Movie & Series Discovery**: Browse trending movies and TV shows
- **🔍 Smart Search**: Find your favorite content instantly
- **📱 Beautiful Onboarding**: Animated introduction screens
- **🎨 Modern UI**: Clean, intuitive interface with custom animations
- **📋 Watchlist Management**: Save movies and shows for later
- **🌟 Detailed Information**: View ratings, cast, synopsis, and more

### 🛠️ Technical Features
- **🏗️ MVC Architecture**: Clean, maintainable code structure
- **📱 Cross-Platform**: Runs on Android, iOS, Web, macOS, Linux, and Windows
- **🎭 Smooth Animations**: Engaging user experience with fluid transitions
- **🔄 State Management**: Efficient app state handling
- **🎪 Responsive Design**: Adapts to different screen sizes

---

## 📸 Screenshots

### Onboarding Experience
Beautiful animated screens that introduce users to the app's features.

### Authentication Flow
Secure login, registration, and password reset functionality.

### Home & Discovery
Explore trending content with an intuitive and visually appealing interface.

### Movie Details
Comprehensive information about movies and TV shows with stunning visuals.

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=2.17.0)
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Milad-Noroozi/Cinemax.git
   cd Cinemax
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Build for Production

```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

---

## 🏗️ Architecture

This project follows the **MVC (Model-View-Controller)** pattern for better code organization:

```
lib/
├── models/          # Data structures and business logic
├── views/           # UI components and screens
├── controllers/     # Handle user interactions and state
├── widgets/         # Reusable UI components
├── services/        # API calls and external services
├── utils/           # Helper functions and constants
└── main.dart        # App entry point
```

### Key Components:
- **Models**: Define data structures for movies, users, and app state
- **Views**: Screen layouts and UI components
- **Controllers**: Business logic and state management
- **Widgets**: Reusable UI elements and custom components

---

## 🎨 Design System

### Color Palette
- **Primary**: Deep blue tones for main actions
- **Secondary**: Vibrant orange for highlights
- **Background**: Dark theme with gradient overlays
- **Text**: High contrast for excellent readability

### Typography
- **Headers**: Bold, modern font family
- **Body**: Clean, readable typography
- **Accents**: Stylized text for emphasis

---

## 🔧 Configuration

### API Setup
1. Create an account at [TMDB](https://www.themoviedb.org/documentation/api)
2. Get your API key
3. Add it to your environment configuration

### Environment Variables
```dart
// lib/config/app_config.dart
class AppConfig {
  static const String apiKey = 'YOUR_TMDB_API_KEY';
  static const String baseUrl = 'https://api.themoviedb.org/3';
}
```

---

## 📱 Supported Platforms

| Platform | Status |
|----------|---------|
| Android  | ✅ Fully Supported |
| iOS      | ✅ Fully Supported |
| Web      | ✅ Fully Supported |
| macOS    | ✅ Fully Supported |
| Linux    | ✅ Fully Supported |
| Windows  | ✅ Fully Supported |

---

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Commit your changes**
   ```bash
   git commit -m 'Add some amazing feature'
   ```
4. **Push to the branch**
   ```bash
   git push origin feature/amazing-feature
   ```
5. **Open a Pull Request**

### Code Style
- Follow [Flutter's style guide](https://flutter.dev/docs/development/tools/formatting)
- Use meaningful variable and function names
- Add comments for complex logic
- Write tests for new features

---

## 🐛 Issues & Bug Reports

Found a bug? Have a feature request? Please:
1. Check existing issues first
2. Create a detailed bug report
3. Include steps to reproduce
4. Add screenshots if applicable

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Milad Noroozi**
- GitHub: [@Milad-Noroozi](https://github.com/Milad-Noroozi)
- LinkedIn: [Connect with me](https://linkedin.com/in/milad-noroozi)

---

## 🙏 Acknowledgments

- [The Movie Database (TMDB)](https://www.themoviedb.org/) for providing the API
- Flutter team for the amazing framework
- All contributors who helped improve this project

---

## 🌟 Show Your Support

If you found this project helpful, please consider:
- ⭐ Starring the repository
- 🐛 Reporting bugs
- 💡 Suggesting new features
- 🤝 Contributing to the codebase

---

<div align="center">
  <p>Made with ❤️ and Flutter</p>
  <p>© 2024 Milad Noroozi. All rights reserved.</p>
</div>