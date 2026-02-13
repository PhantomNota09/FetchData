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

## Project Structure

```
FetchData/
├── Models/
│   └── Model.swift              # Data models for all APIs
├── ViewControllers/
│   ├── MainPageVC.swift         # Home screen with navigation
│   ├── CoingeckoVC.swift        # Cryptocurrency prices view
│   ├── TypicodeTableVC.swift    # Todo items table view
│   └── UserDataVC.swift         # User directory view
├── ViewModels/
│   ├── CoingeckoViewModel.swift
│   ├── TypicodeViewModel.swift
│   └── UserDataViewModel.swift
├── NetworkManagers/
│   ├── CoingeckoNetworkManager.swift
│   ├── TypicodeNetworkManager.swift
│   └── UserDataNetworkManager.swift
└── Views/
    ├── TypicodeTableViewCell.swift
    └── UserDataTableViewCell.swift
```

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


