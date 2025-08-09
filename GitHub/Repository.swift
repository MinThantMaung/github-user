//
//  Repository.swift
//  GitHub
//
//  Created by Min Thant on 02/08/2025.
//
import Foundation

struct Repository: Identifiable {
    var id = UUID()
    var name: String
    var language: String
    var stars: Double
    var description: String
}
