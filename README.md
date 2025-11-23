# Adhkar Tracker

## App Overview

Adhkar Tracker is a simple and elegant Flutter application designed to help users keep track of their daily adhkar (Islamic remembrances). The app displays a hadith of the day and allows users to increment a counter for their recitations. The count is saved locally and resets daily, and users can view their recitation history on a dedicated screen.

## Features

- **Daily Hadith**: Displays a hadith in both Arabic and English.
- **Recitation Counter**: A simple tap-to-increment counter to track daily adhkar.
- **Local Storage**: The daily count is saved to the device and persists across app launches.
- **Daily Reset**: The counter automatically resets to zero each new day.
- **History Screen**: Users can view their recitation counts from previous days.
- **Polished UI**: A clean and modern user interface with a custom theme, animations, and responsive design.
- **Offline First**: The app uses a local JSON file for hadith data, making it fully functional without an internet connection.

<p align="center">
  <img src="Screenshot_20251123_202949.jpg" alt="Screenshot 1" width="45%" />
  <img src="Screenshot_20251123_203016.jpg" alt="Screenshot 2" width="45%" />
   
   
</p>

## Setup Instructions

To get this project up and running on your local machine, follow these steps:

1.  **Prerequisites**:

    - Ensure you have the [Flutter SDK](https://flutter.dev/docs/get-started/install) installed.
    - An editor like [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio) with the Flutter plugin.

2.  **Clone the Repository**:

    ```sh
    git clone https://github.com/your-username/adhkar_tracker.git
    cd adhkar_tracker
    ```

3.  **Install Dependencies**:

    ```sh
    flutter pub get
    ```

4.  **Run the App**:
    ```sh
    flutter run
    ```

## API Used

The app was initially developed using the [Hadith API by fawazahmed0](https://github.com/fawazahmed0/hadith-api) but was later transitioned to a local `hadiths.json` file to ensure offline functionality and reliability. This change removes the dependency on an external API and provides a more consistent user experience.
