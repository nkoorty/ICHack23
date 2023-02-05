import SwiftUI

struct ActivityGraph: View {
    
    var logs: [ActivityLog]
    @Binding var selectedIndex: Int
    
    init(logs: [ActivityLog], selectedIndex: Binding<Int>) {
        self._selectedIndex = selectedIndex
        self.logs = logs // Temporary, we'll group logs next
    }
    
    var body: some View {
        drawGrid()
            .opacity(0.2)
            .overlay(drawActivityGradient(logs: logs))
            //.overlay(drawActivityLine(logs: logs))
            //.overlay(drawLogPoints(logs: logs))
            //.overlay(addUserInteraction(logs: logs))
    }}

    func drawGrid() -> some View {
        VStack(spacing: 0) {
            Color.black.frame(height: 1, alignment: .center)
            HStack(spacing: 0) {
                Color.clear
                    .frame(width: 8, height: 100)
                ForEach(0..<11) { i in
                    Color.black.frame(width: 1, height: 100, alignment: .center)
                    Spacer()

                }
                Color.black.frame(width: 1, height: 100, alignment: .center)
                Color.clear
                    .frame(width: 8, height: 100)
            }
            Color.black.frame(height: 1, alignment: .center)
        }
    }

    func drawActivityGradient(logs: [ActivityLog]) -> some View {
        LinearGradient(gradient: Gradient(colors: [Color(red: 251/255, green: 82/255, blue: 0), .white]), startPoint: .top, endPoint: .bottom)
            .padding(.horizontal, 8)
            .padding(.bottom, 1)
            .opacity(0.8)
            .mask(
                GeometryReader { geo in
                    Path { p in
                        // Used for scaling graph data
                        let maxNum = logs.reduce(0) { (res, log) -> Double in
                            return max(res, log.distance)
                        }

                        let scale = geo.size.height / CGFloat(maxNum)

                        //Week Index used for drawing (0-11)
                        var index: CGFloat = 0

                        // Move to the starting y-point on graph
                        p.move(to: CGPoint(x: 8, y: geo.size.height - (CGFloat(logs[Int(index)].distance) * scale)))

                        // For each week draw line from previous week
                        for _ in logs {
                            if index != 0 {
                                p.addLine(to: CGPoint(x: 8 + ((geo.size.width - 16) / 11) * index, y: geo.size.height - (CGFloat(logs[Int(index)].distance) * scale)))
                            }
                            index += 1
                        }

                        // Finally close the subpath off by looping around to the beginning point.
                        p.addLine(to: CGPoint(x: 8 + ((geo.size.width - 16) / 11) * (index - 1), y: geo.size.height))
                        p.addLine(to: CGPoint(x: 8, y: geo.size.height))
                        p.closeSubpath()
                    }
                }
            )
    }
        
    init(logs: [ActivityLog], selectedIndex: Binding<Int>) {
        self._selectedIndex = selectedIndex
        
        let curr = Date() // Today's Date
        let sortedLogs = logs.sorted { (log1, log2) -> Bool in
            log1.date > log2.date
        } // Sort the logs in chronological order
        
        var mergedLogs: [ActivityLog] = []

        for i in 0..<12 { // Loop back for the past 12 weeks

            var weekLog: ActivityLog = ActivityLog(distance: 0, duration: 0, elevation: 0, date: Date())

            for log in sortedLogs {
                // If log is within specific week, then add to weekly total
                if log.date.distance(to: curr.addingTimeInterval(TimeInterval(-604800 * i))) < 604800 && log.date < curr.addingTimeInterval(TimeInterval(-604800 * i)) {
                    weekLog.distance += log.distance
                    weekLog.duration += log.duration
                    weekLog.elevation += log.elevation
                }
            }

            mergedLogs.insert(weekLog, at: 0)
        }

        self.logs = mergedLogs
    }
