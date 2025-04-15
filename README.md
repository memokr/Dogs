# Dogs

A simple iOS app that fetches and displays random dog images using the [Dog CEO API](https://dog.ceo/dog-api/). Built with Swift and SwiftUI.

## Features

- Fetches list of available dog breeds from the Dog CEO API
- Fetches random dog images from the Dog CEO API
- Error handling and loading states
- Search by breed locally without any network requests

## Screenshots

<p float="left">
  <img src="https://github.com/user-attachments/assets/8ac98f33-16bd-4fc7-adba-53035006c8f4" width="30%" />
  <img src="https://github.com/user-attachments/assets/c420ed37-146c-45be-8551-b414164d9911" width="30%" />
  <img src="https://github.com/user-attachments/assets/403dadef-ce7f-4730-8038-d44dbc5160c6" width="30%" />
</p>

## Installation

To run the app locally:

1. Clone the repo:
   ```bash
   git clone https://github.com/your-username/dogs.git

2. Open the .xcodeproj or .xcworkspace file in Xcode
3. Run the app on a simulator or physical device

## Requirements

- iOS 18.0+ 
- Xcode 16+
- Swift 5.9+

## Architecture

The project follows MVVM architecture with a clean separation between UI and networking logic. Networking is handled using URLSession and async/await for clarity and performance.





