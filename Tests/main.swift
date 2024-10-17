import Adwaita
import WebView

@main
struct Test: App {
    let id = "xyz.zaph.webview"
    var app: AdwaitaApp!

    @State private var url: String = "https://github.com/AparokshaUI/adwaita-swift"

    var scene: Scene {
        Window(id: "main") { window in
            WebView(url: $url)
                .setSize(width: 800, height: 600)
                .topToolbar {
                    ToolbarView(app: app, window: window)
                }

        }
    }
}

struct ToolbarView: View {
    @State private var about = false
    var app: AdwaitaApp
    var window: AdwaitaWindow

    var view: Body {
        HeaderBar.end {
            Menu(icon: .default(icon: .openMenu)) {
                MenuButton("New Window", window: false) {
                    app.addWindow("main")
                }
                .keyboardShortcut("n".ctrl())
                MenuButton("Close Window") {
                    window.close()
                }
                .keyboardShortcut("w".ctrl())
                MenuButton("Close App") {
                    app.quit()
                }
                .keyboardShortcut("q".ctrl())
                MenuSection {
                    MenuButton("About Me", window: false) {
                        about = true
                    }
                }
            }
            .primary()
            .tooltip("Main Menu")
            .aboutDialog(
                visible: $about,
                app: "WebViewAdwaita",
                developer: "zaph",
                version: "dev",
                icon: .custom(name: "xyz.zaph.webview"),
                website: .init(string: "https://github.com/Zaphik/AdwaitaWebViewSwift")!,
                issues: .init(string: "https://github.com/Zaphik/AdwaitaWebViewSwift")!
            )
        }

    }

}
