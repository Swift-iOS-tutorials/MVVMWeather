//
//  Models.swift
//  MVVMWeather
//
//  Created by Dennis Shar on 23/07/2022.
//

import Foundation

//The actual data

struct WeatherModel:Codable {
    let weather: [WeatherInfo]
    let main: Main
    let name:String
}

struct WeatherInfo:Codable{
    let main:String
    let description:String
}

struct Main:Codable {
    let temp:Float
}

