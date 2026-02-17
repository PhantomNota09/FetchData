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

<img width="120" height="262" alt="simulator_screenshot_8CDA8047-EFCA-433C-AA9B-3081AC82C2A5" src="https://github.com/user-attachments/assets/74d50281-344d-4d7f-8d9c-74e7eed19c27" />
<img width="120" height="262" alt="simulator_screenshot_AEA1F8C8-2063-4E25-B706-74ED189F9BB5" src="https://github.com/user-attachments/assets/83a179b2-a943-45f1-9236-bd329a5291d1" />

<img width="120" height="262" alt="simulator_screenshot_431F6448-FC91-4305-AE03-D21C46459056" src="https://github.com/user-attachments/assets/1f23a5f3-31b2-45ea-80ca-88106a8af530" />
<img width="120" height="262" alt="simulator_screenshot_E262EBC4-317A-4FA0-9BB9-085A47E455E8" src="https://github.com/user-attachments/assets/240874de-6b94-4128-844e-334df907bcf8" />

<img width="120" height="262" alt="simulator_screenshot_6DB42BC9-ACE1-4AB9-9F4F-C661CC7F170D" src="https://github.com/user-attachments/assets/f82e6329-c4fa-415d-b891-b6672eea7df7" />
<img width="120" height="262" alt="simulator_screenshot_93E0D8A0-C7EA-4018-B88E-84E2E632E3BE" src="https://github.com/user-attachments/assets/ac56339f-6b0c-4bd5-b7ea-6aed633e9845" />
