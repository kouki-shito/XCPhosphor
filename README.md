# swift-xc-phosphor
This repository generates an XCFramework from PhosphorSwift and provides it as a BinaryTarget.

By using this library, you can reduce asset loading and significantly shorten the extensive build time of Phosphor Swift.

Original repository: https://github.com/phosphor-icons/swift

# Installation
### Swift Package Manager
```swift
dependencies: [
    .package(url: "https://github.com/kouki-shito/swift-xc-phosphor.git", branch: "main")
]
```
```swift
.target(
  name: "...",
  dependencies: [
    .product(name: "PhosphorBinary", package: "swift-xc-phosphor")),
  ]
),
```
# Usage

```swift
import PhosphorBinary
```
After importing, you can use it just like the original library.
```swift
import SwiftUI
import PhosphorBinary

struct ContentView: View {
    var body: some View {
        HStack {
            Ph.horse.regular
                .color(.accentColor)
                .frame(width: 64, height: 64)
            Ph.heart.fill
                .color(.red)
                .frame(width: 64, height: 64)
            Ph.cube.duotone
                .frame(width: 64, height: 64)
        }   
    }
}
```
For detailed usage instructions, please refer to the original repository.

# License
MIT
