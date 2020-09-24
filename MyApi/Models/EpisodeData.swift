//
//  EpisodeData.swift
//  MyApi
//
//  Created by ddyack on 24.09.2020.
//

struct EpisodeData: Decodable {
    let episodeID: Int?
    let title, season, airDate: String?
    let characters: [String]?
    let episode: String?
    let series: Series?

    enum CodingKeys: String, CodingKey {
        case episodeID = "episode_id"
        case title, season
        case airDate = "air_date"
        case characters, episode, series
    }
}

enum Series: String, Decodable {
    case betterCallSaul = "Better Call Saul"
    case breakingBad = "Breaking Bad"
}
