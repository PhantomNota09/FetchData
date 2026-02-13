# FetchData

A simple iOS app demonstrating network data fetching from multiple APIs using UIKit and modern Swift concurrency (async/await).

## Features

- **Cryptocurrency Prices** - Fetch real-time Bitcoin and Ethereum prices from CoinGecko API
- **Todo List** - Display todo items from JSONPlaceholder API
- **User Directory** - Browse and view detailed user information from JSONPlaceholder API
- **Pull to Refresh** - Update cryptocurrency prices with a simple pull gesture
- **Clean UIKit Implementation** - Built entirely with UIKit using programmatic UI

## Screenshots

The app features three main sections accessible from the home screen:
- Typicode Data (Todo items)
- Cryptocurrency prices
- User information

## Architecture

The project follows a clean architecture pattern with:
- **MVVM Pattern** - Separation of concerns with ViewModels
- **Protocol-Oriented Design** - Network managers use protocols for testability
- **Swift Concurrency** - Modern async/await for network operations
- **Programmatic UI** - All views built with Auto Layout (no storyboards)

## APIs Used

- [CoinGecko API](https://www.coingecko.com/en/api) - Cryptocurrency price data
- [JSONPlaceholder API](https://jsonplaceholder.typicode.com/) - Sample user and todo data

## Usage

### Viewing Cryptocurrency Prices
1. Tap "Fetch Coingecko Data" on the home screen
2. View current Bitcoin and Ethereum prices in USD
3. Pull down to refresh prices

### Viewing Todo Items
1. Tap "Fetch Typicode Data" on the home screen
2. Browse the list of todo items with completion status

### Viewing User Information
1. Tap "Fetch User Data" on the home screen
2. Browse the user list
3. Tap any user to view detailed information including contact details and address

## Screenshots
<img width="120" height="262" alt="simulator_screenshot_C80F30AC-7A27-4D16-89BA-AF1542E5E783" src="https://github.com/user-attachments/assets/04865d65-7e94-49f0-9dc3-06679fc62470" />
<img width="120" height="262" alt="simulator_screenshot_24AC427F-B0F9-4217-83A0-82520D62F930" src="https://github.com/user-attachments/assets/96de1e91-5f49-443b-a1c8-15fb3c8d4b12" />
<img width="120" height="262" alt="simulator_screenshot_E39C5B3C-E9C3-4731-95A7-07584A77D1DC" src="https://github.com/user-attachments/assets/1a10dc30-8258-4b6c-b04b-e58045dd1258" />
<img width="120" height="262" alt="simulator_screenshot_C65E0ACC-8253-4BB3-851C-A082063C22E9" src="https://github.com/user-attachments/assets/ea70ca2b-c9f8-470d-99aa-e3d15a096c99" />
<img width="120" height="262" alt="simulator_screenshot_66091F02-8413-471B-B4BF-FB9C9A4489BF" src="https://github.com/user-attachments/assets/28a685d0-2628-4ea5-91ae-06e5a008c710" />

