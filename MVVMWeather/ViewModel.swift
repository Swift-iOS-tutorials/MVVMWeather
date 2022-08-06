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
    
    init(){
        fetchWeather()
    }
    
    func fetchWeather(){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=32.0853&lon=34.7818&units=metric&appid=aa2df23d347d91a01f286584e35f2b7e") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {data,_,error in
            guard let data = data, error == nil else {
                return
            }
            
            //convert data to model
            do {
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.title = model.weather.first?.main ?? "No Title"
                    self.description = model.weather.first?.description ?? "No Description"
                    self.temp =  "\(model.main.temp)°"
                    self.timezone = model.name
                }
                
            }catch{
                print("Failed")
            }
        }
        task.resume()
    }
}
