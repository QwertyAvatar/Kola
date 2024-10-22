import SwiftUI
import DGCharts

struct StatisticView: View {
    var kolorki: [ColorData] // Przekazujemy dane kolorów do widoku

    var body: some View {
        VStack {
            Text("Statystyki kolorów")
                .font(.title)
                .padding()

            Chart {
                ForEach(kolorki) { colorData in
                    BarMark(
                        x: .value("Kolor", colorData.colorName),
                        y: .value("Liczba wystąpień", colorData.count)
                    )
                    .foregroundStyle(colorData.colorValue) // Ustaw kolor słupka
                }
            }
            .frame(height: 300) // Ustalamy wysokość wykresu
        }
        .padding()
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleData: [ColorData] = [
            ColorData(colorName: "Red", colorValue: .red, count: 10),
            ColorData(colorName: "Blue", colorValue: .blue, count: 5),
            ColorData(colorName: "Green", colorValue: .green, count: 7)
        ]
        StatisticView(kolorki: exampleData)
    }
}
