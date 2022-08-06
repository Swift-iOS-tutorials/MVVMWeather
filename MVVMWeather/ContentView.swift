//
//  ContentView.swift
//  MVVMWeather
//
//  Created by Dennis Shar on 23/07/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                Text(viewModel.timezone).font(.system(size: 32))
                Text(viewModel.temp).font(.system(size: 44))
                Text(viewModel.title).font(.system(size: 24))
                Text(viewModel.description).font(.system(size: 24))
            }.navigationTitle("Weather MVVM")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
            .preferredColorScheme(.dark)
            
    }
}
