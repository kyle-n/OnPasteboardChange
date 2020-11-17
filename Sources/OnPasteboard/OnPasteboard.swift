import SwiftUI
import Combine

public extension View {
    func onPasteboard(contains value: OnPasteboardValue) -> PasteboardListenerView<Self> {
        PasteboardListenerView(input: self)
    }
}

public struct PasteboardListenerView<T>: View where T: View {
    let input: T
    
    @StateObject private var store = PasteboardListener()
    
    public var body: some View {
        input
    }
}
