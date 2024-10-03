import Adwaita
import CWebView

public struct WebView: Widget {
    @Binding var url: String
    var width: Int = 800
    var height: Int = 600

    public init(url: Binding<String>) {
        self._url = url
    }

    public func container(modifiers: [(View) -> View]) -> ViewStorage {
        let webView = ViewStorage(webkit_web_view_new()?.opaque())
        update(webView, modifiers: modifiers, updateProperties: true)
        return webView
    }

    public func update(_ storage: ViewStorage, modifiers: [(View) -> View], updateProperties: Bool) {
        if updateProperties {
            webkit_web_view_load_uri(storage.pointer?.cast(), url)
            gtk_widget_set_size_request(storage.pointer?.cast(), width.cInt, height.cInt)
        }
    }

    public func setSize(width: Int, height: Int) -> Self {
        var view = self
        view.width = width
        view.height = height
        return view
    }
}
