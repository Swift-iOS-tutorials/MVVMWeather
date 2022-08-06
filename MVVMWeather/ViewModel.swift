//
//  ViewModel.swift
//  MVVMWeather
//
//  Created by Dennis Shar on 23/07/2022.
//

import Foundation

//Data needed by the view

class WeatherViewModel: ObservableObject{
    // published means that every time this item is updated every view that holds this model will be updated. 
    @Published var title: String = "-"
    @Published var description: String = "-"
    @Published var temp: String = "-"
    @Published var timezone: String = "-"
}
