import SwiftUI
import Charts
import Foundation

struct SeizureData: Identifiable {
    let id = UUID()
    let second: Int
    let amount: Double

}

struct SeizureHistory: View {
    let list = [
        SeizureData(second: 0, amount: 50),
        SeizureData(second: 1, amount: 60),
        SeizureData(second: 2, amount: 86),
        SeizureData(second: 3, amount: 90),
        SeizureData(second: 4, amount: 100),
        SeizureData(second: 5, amount: 86),
        SeizureData(second: 6, amount: 72),
    ]
    
    struct SeizureTestData: View {
        
        var logs: [SeizureHistory]
        @Binding var selectedIndex: Int
        
        init(logs: [ActivityLog], selectedIndex: Binding<Int>) {
            self._selectedIndex = selectedIndex
            self.logs = logs // Temporary, we'll group logs next
        }
        
        var body: some View {
            // Nothing yet...
        }
    }
}
