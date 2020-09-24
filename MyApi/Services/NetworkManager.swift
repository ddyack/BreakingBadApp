//
//  NetworkManager.swift
//  MyApi
//
//  Created by ddyack on 21.09.2020.
//
import Foundation
import Alamofire

class NetworkManager {
    
    private let charactersURL = "https://www.breakingbadapi.com/api/characters"
    private let episodesURL = "https://breakingbadapi.com/api/episodes"
    
    func fetchPersons(clouser: @escaping ([PersonData]) -> Void) {
        guard let personsURL = URL(string: charactersURL) else { return }
        
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
    
    func fetchEpisodes(completionHandler: @escaping ([EpisodeData]) -> Void) {
        AF.request(episodesURL).validate().responseJSON { (dataResponse) in
            var episodes: [EpisodeData] = []
            
            switch dataResponse.result {
            case .success(let value):
                
                guard let episodesData = value as? [[String: Any]] else { return }
                
                for episodeData in episodesData {
                    let episode = EpisodeData(episodeID: episodeData["episode_id"] as? Int,
                                              title: episodeData["title"] as? String,
                                              season: episodeData["season"] as? String,
                                              airDate: episodeData["air_date"] as? String,
                                              characters: episodeData["characters"] as? [String],
                                              episode: episodeData["episode"] as? String,
                                              series: episodeData["series"] as? Series)
                    episodes.append(episode)
                }
                completionHandler(episodes)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
