import SwiftUI
import Foundation

struct ContentView: View {
    @State var kolko1 = ColorData(ColorName: "red", ColorValue: Color.red, count: 1) // Stan kolka 1
    @State var kolko2 = ColorData(ColorName: "blue", ColorValue: Color.blue, count: 1) // Stan kolka 2
    
    @State var kolorki: [ColorData] = [
        .init(ColorName: "red", ColorValue: Color.red, count: 1),
        .init(ColorName: "blue", ColorValue: Color.blue, count: 1),
        .init(ColorName: "green", ColorValue: Color.green, count: 0),
        .init(ColorName: "yellow", ColorValue: Color.yellow, count: 0),
        .init(ColorName: "orange", ColorValue: Color.orange, count: 0),
        .init(ColorName: "purple", ColorValue: Color.purple, count: 0),
        .init(ColorName: "black", ColorValue: Color.black, count: 0),
        .init(ColorName: "gray", ColorValue: Color.gray, count: 0),
    ]
    
    // Zmienne stanu przezroczystości
    @State var opacity1: Double = 0.5
    @State var opacity2: Double = 0.5
    
    // Funkcja losująca kolor z tablicy i inkrementująca licznik dla tego koloru
    func randomColorAndIncrementCount() -> ColorData {
        let rIndex = Int.random(in: 0..<kolorki.count)
        kolorki[rIndex].count += 1 // Zwiększamy licznik w tablicy dla wylosowanego koloru
        return kolorki[rIndex] // Zwracamy wylosowany kolor
    }
    
    var body: some View {
        VStack {
            // Widok kółka 1
            VStack {
                Circle()
                    .fill(kolko1.ColorValue)
                    .opacity(opacity1) // Dynamiczna przezroczystość
                    .frame(width: 100)
                    .onTapGesture {
                        // Zmiana przezroczystości kółek po tapnięciu
                        opacity1 = 1.0
                        opacity2 = 0.0
                    }
                
                // Wyświetlanie aktualnego koloru i liczby losowań tego koloru w tablicy
                Text("Kolor: \(kolko1.ColorName), losowania: \(kolko1.count)")
                    .padding(.top, 10)
            }
            
            // Widok kółka 2
            VStack {
                Circle()
                    .fill(kolko2.ColorValue)
                    .opacity(opacity2) // Dynamiczna przezroczystość
                    .frame(width: 100)
                    .onTapGesture {
                        // Zmiana przezroczystości kółek po tapnięciu
                        opacity1 = 0.0
                        opacity2 = 1.0
                    }
                
                // Wyświetlanie aktualnego koloru i liczby losowań tego koloru w tablicy
                Text("Kolor: \(kolko2.ColorName), losowania: \(kolko2.count)")
                    .padding(.top, 10)
            }
            
            // Przyciski do losowania kolorów
            HStack {
                // Losuj kolor dla kółka 1
                Button(action: {
                    let newColor = randomColorAndIncrementCount() // Losowanie i zwiększanie licznika
                    kolko1 = newColor // Zmieniamy stan kółka 1 na nowo wylosowany kolor
                    opacity1 = 0.5 // Reset przezroczystości do 0.5
                    opacity2 = 0.5 // Reset przezroczystości do 0.5
                }) {
                    Text("Losuj kolor 1")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.blue)
                }
                
                // Losuj kolor dla kółka 2
                Button(action: {
                    let newColor = randomColorAndIncrementCount() // Losowanie i zwiększanie licznika
                    kolko2 = newColor // Zmieniamy stan kółka 2 na nowo wylosowany kolor
                    opacity1 = 0.5 // Reset przezroczystości do 0.5
                    opacity2 = 0.5 // Reset przezroczystości do 0.5
                }) {
                    Text("Losuj kolor 2")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(Color.blue)
                }
            }
            .offset(y: 50)
            
            // Dodatkowy przycisk wyświetlania statystyki (w przyszłości można rozwinąć)
            Text("Pokaz statystyke").padding(.top, -5)
                .foregroundColor(Color.blue)
                .offset(y: 50)
        }
        .padding()
        .offset(y: -50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
