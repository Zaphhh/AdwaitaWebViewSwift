import Adwaita
import WebView

@main
struct Test: App{
    let id = "xyz.zaph.webview"
    var app: AdwaitaApp!

    @State private var url: String = "https://github.com/AparokshaUI/adwaita-swift"

    var scene: Scene {
        Window(id: "main"){ window in
            WebView(url: $url)
                .setSize(width: 800, height: 600)
            
        }
    }
}

