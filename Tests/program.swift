import Adwaita
import WebView

@main
struct Test: App{
    let id = "xyz.zaph.webview"
    var app: GTUIApp!

    @State private var url: String = "https://google.com"

    var scene: Scene {
        Window(id: "main"){ window in
            WebView(url: $url)
                .setSize(width: 800, height: 600)
                .topToolbar {
                    ToolbarView(app: app, window: window)
                }
                .onAppear {
                    print("Loading url: \(url)")
                }
            
        }
    }
}


struct ToolbarView: View {

    @State private var about = false
    var app: GTUIApp
    var window: GTUIApplicationWindow

    var view: Body {
        HeaderBar.end {
            Menu(icon: .default(icon: .openMenu), app: app, window: window) {
                MenuButton("New Window", window: false) {
                    app.addWindow("main")
                }
                .keyboardShortcut("n".ctrl())
                MenuButton("Close Window") {
                    window.close()
                }
                .keyboardShortcut("w".ctrl())
                MenuSection {
                    MenuButton("About me", window: false) {
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
                website: .init(string: "https://google.com")!,
                issues: .init(string: "https://google.com")!
            )
        }
    }

}
