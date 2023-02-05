import SwiftUI
import SwiftUICharts

struct ContentView2: View {


    @State var data1: [Double] = (0..<60).map { _ in .random(in: 95.0...99.0) }

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
                ChartLabel("Blood Oxygen O2", type: .custom(size: 16, padding: EdgeInsets(top: 7, leading: 10, bottom: 0, trailing: 0), color: .black))
                ChartLabel(minMaxDifference, type: .legend)
                LineChart()
            }
            .data(data1)
            .chartStyle(blueStyle)
            
        }
        .onAppear {
            self.startUpdatingNumbers()
        }
    }

    func startUpdatingNumbers() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            self.data1.removeFirst(3)
            for _ in 0..<3 {
                let lastValue = self.data1.last ?? 97.0
                self.data1.append(Double.random(in: lastValue - 0.5...lastValue + 0.5))
            }
        }
    }
}
\

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}

