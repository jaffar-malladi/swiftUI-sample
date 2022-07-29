//
//  ContentViewLineChart.swift
//  SerarchBarApp
//
//  Created by Jaffar Malladi on 29/07/22.
//

import SwiftUI

struct Stock {
    let price: Double
}

private func getHistoricalStock() -> [Stock] {
    var stocks = [Stock]()
    
    for _ in 1...20 {
        let stock = Stock(price: Double.random(in: 100...300))
        stocks.append(stock)
    }
    return stocks
}

private func getYearlyLabels() -> [String] {
    return (2015...2021).map {  String($0)}
}

struct ContentViewLineChart: View {
    
    let price = getHistoricalStock().map { Int($0.price)}
    let labels = getYearlyLabels()
    var body: some View {
        
        NavigationView {
            VStack {
                LineChartView(values: price, labels: labels)
                    .foregroundColor(.white)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .navigationTitle("Stocks")
        }
    }
}

struct ContentViewLineChart_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewLineChart()
    }
}
