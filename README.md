# WebView

_WebView_ adds support for embedding a (you guessed it)webview into GNOME apps built using [Adwaita For Swift](https://github.com/AparokshaUI/adwaita-swift)

## Table of Contents

- [Installation](#Installation)
- [Usage](#Usage)
- [Thanks](#Thanks)

## Installation
### Dependencies
Install `webkitgtk6.0-dev` or similar (based on the package manager) as well as `gtk4-devel` and `libadwaita-dev` (or similar).

### Examples
* Debian and derivatives
  ```
  sudo apt install libadwaita-1-dev libwebkitgtk-6.0-dev libgtk-4-dev
  ```
* Fedora and derivatives
  ```
  sudo dnf install libadwaita-devel webkitgtk6.0-devel gtk4-devel
  ```


### Swift Package
1. Open your Swift package in GNOME Builder, or any other IDE.
2. Open the `Package.swift` file.
3. Into the `Package` initializer, under `dependencies`, paste:
```swift
.package(url: "https://github.com/Zaphik/AdwaitaWebViewSwift", branch: "main")   
```

## Usage

Take a look at the simple [sample app](Tests/main.swift).
Check out the [Adwaita](https://github.com/AparokshaUI/Adwaita) packages.

## Thanks

### Dependencies
- [Adwaita](https://github.com/AparokshaUI/Adwaita) licensed under the [GPL-3.0 license](https://github.com/AparokshaUI/Adwaita/blob/main/LICENSE.md)

### Other Thanks
- The programming language [Swift](https://github.com/apple/swift)
- [WebKitGTK](https://webkitgtk.org/) for the widgets
- [CodeEditor](https://github.com/AparokshaUI/CodeEditor) for the guide on embedding widgets
