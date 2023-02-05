import SwiftUI
import SwiftUICharts

struct ContentView: View {

    @State private var showAlert = false

    @State var data1: [Double] = (0..<16).map { _ in .random(in: 40.0...90.0) }

    let mixedColorStyle = ChartStyle(backgroundColor: .white, foregroundColor: [
        ColorGradient(ChartColors.orangeBright, ChartColors.orangeDark),
        ColorGradient(.purple, .blue)
    ])
    let blueStyle = ChartStyle(backgroundColor: .white,
                               foregroundColor: [ColorGradient(.purple, .blue)])
    let orangeStyle = ChartStyle(backgroundColor: .white,
                                 foregroundColor: [ColorGradient(ChartColors.orangeBright, ChartColors.orangeDark)])

    let multiStyle = ChartStyle(backgroundColor: Color.green.opacity(0.2),
                                foregroundColor:
                                    [ColorGradient(.purple, .blue),
                                     ColorGradient(.orange, .red),
                                     ColorGradient(.green, .yellow),
                                     ColorGradient(.red, .purple),
                                     ColorGradient(.yellow, .orange),
                                    ])
    var minMaxDifference: String {
        let minValue = data1.min() ?? 0
        let maxValue = data1.max() ?? 0
        let difference = maxValue - minValue
        let percentageDifference = (difference / minValue) * 100
        return "↑ \(String(format: "%.2f", percentageDifference))%"
    }

    var body: some View {
        VStack {
            CardView(showShadow: true) {
                ChartLabel("Seizure Likelihood", type: .custom(size: 16, padding: EdgeInsets(top: 7, leading: 10, bottom: 0, trailing: 0), color: .black))
                ChartLabel(minMaxDifference, type: .legend)
                
                    .labelStyle(.automatic)
                LineChart()
                
            }
            .data(data1)
            .chartStyle(blueStyle)
            
            
        }
        .onAppear {
            self.startUpdatingNumbers()
        }
        .alert(isPresented: $showAlert) {
                        Alert(title: Text("We suspect that you may have a Seizure"), message: Text("Take action now."), primaryButton: .default(Text("Call Emergency Services")), secondaryButton: .cancel(Text("Cancel")))
                    }
    }

    func startUpdatingNumbers() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            self.data1.removeFirst(3)
            for _ in 0..<3 {
                let lastValue = self.data1.last ?? 65.0
                self.data1.append(Double.random(in: lastValue - 1...lastValue + 5))
            }
            if self.data1.last ?? 0 > 90 {
                self.showAlert = true
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

