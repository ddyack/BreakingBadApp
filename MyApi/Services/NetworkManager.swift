//
//  NetworkManager.swift
//  MyApi
//
//  Created by ddyack on 21.09.2020.
//
import Foundation

class NetworkManager {
    
    private let stringURL = "https://www.breakingbadapi.com/api/characters"
    
    func fetchPersons(clouser: @escaping ([PersonData]) -> Void) {
        guard let personsURL = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: personsURL) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let data = data {
                if let persons = self.parseJSON(with: data) {
                    clouser(persons)
                }
            }
        }.resume()
    }
    
    func parseJSON(with data: Data) -> [PersonData]? {
        let decoder = JSONDecoder()
        do {
            let personsData = try decoder.decode([PersonData].self, from: data)
            return personsData
        } catch let error {
            print(error.localizedDescription)
        }
        return nil
    }
}
