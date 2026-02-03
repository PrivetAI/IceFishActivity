# Ice Fish Activity

iOS application helping ice fishermen understand hourly fish activity patterns.

## Features

- **Activity Graph**: 24-hour visual display of fish activity (00:00-23:59)
- **25+ Fish Species**: North American and European fish with realistic patterns
- **4 Winter Seasons**: Early Winter, Deep Winter, Late Winter, Pre-Spring
- **Favorites System**: Save and quickly load fish presets
- **Detailed Profiles**: Activity explanations for each fish species

## Requirements

- iOS 15.6+
- iPhone and iPad
- No internet required (offline only)

## Project Structure

```
IceFishActivity/
├── IceFishActivityApp.swift    # App entry point
├── ContentView.swift           # Tab navigation
├── Theme/AppTheme.swift        # Colors and styling
├── Models/
│   ├── Season.swift            # Season enum with auto-detection
│   ├── Fish.swift              # Fish model
│   └── FishDatabase.swift      # 25 fish species data
├── ViewModels/
│   └── FishActivityViewModel.swift
└── Views/
    ├── MainView.swift          # Home with activity graph
    ├── FishSelectionView.swift # Fish list with toggles
    ├── FishProfileView.swift   # Detailed fish info
    ├── SeasonsView.swift       # Season switcher
    ├── FavoritesView.swift     # Preset management
    └── Components/             # Reusable UI elements
```

## Build

Open `IceFishActivity.xcodeproj` in Xcode 15+ and build.
