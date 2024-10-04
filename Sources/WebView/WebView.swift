import Meta
import CWebView
import Adwaita

public struct WebView: AdwaitaWidget {
    @Binding var url: String
    var width: Int = 800
    var height: Int = 600

    public init(url: Binding<String>) {
        self._url = url
    }

    public func container<Data>(data: WidgetData, type: Data.Type) -> ViewStorage where Data: ViewRenderData {
        let storage = ViewStorage(webkit_web_view_new()?.opaque())
        update(storage, data: data, updateProperties: true, type: type)
        return storage
    }

    public func update<Data>(_ storage: ViewStorage, data: WidgetData, updateProperties: Bool, type: Data.Type) where Data: ViewRenderData {
        guard updateProperties else { return }

        webkit_web_view_load_uri(storage.opaquePointer?.cast(), url)
        gtk_widget_set_size_request(storage.opaquePointer?.cast(), Int32(width), Int32(height))

        storage.previousState = self
    }

    public func setSize(width: Int, height: Int) -> Self {
        var view = self
        view.width = width
        view.height = height
        return view
    }
}
