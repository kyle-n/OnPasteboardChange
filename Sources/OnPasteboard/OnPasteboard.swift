import SwiftUI
import Combine

public extension View {
    func onPasteboard(
        matching pattern: NSRegularExpression,
        then: @escaping PasteboardTarget.StringCallback
    ) -> some View {
        PasteboardListenerView<Self>(pasteboardTarget: .string(matching: pattern, onMatch: then)) {
            self
        }
    }
}

public enum PasteboardTarget {
    public typealias StringCallback = (_ contents: String, _ match: Substring) -> Void
    case string(matching: NSRegularExpression, onMatch: StringCallback)
}

public struct PasteboardListenerView<T>: View where T: View {
    let drawParent: () -> T
    
    @StateObject private var store: PasteboardListener
    
    init(pasteboardTarget: PasteboardTarget, drawParent: @escaping () -> T) {
        self.drawParent = drawParent
        let store = PasteboardListener(pasteboardTarget: pasteboardTarget)
        store.initializeSubscriptions()
        _store = StateObject<PasteboardListener>(wrappedValue: store)
    }
    
    public var body: some View {
        drawParent()
    }
}
