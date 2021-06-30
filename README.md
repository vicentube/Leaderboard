# Leaderboard

Sample SwiftUI project to show a different approach of MVVM pattern in SwiftUI. The basic idea of this approach is this:

- ViewModel is a struct
- View is an extension of the ViewModel that conforms to the `View` protocol
- Model is an `@ObservableObject` isolated from the view because it is `private` and passed through `@EnvironmentObject`
