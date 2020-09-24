//
//  EpisodesTableViewController.swift
//  MyApi
//
//  Created by ddyack on 24.09.2020.
//

import UIKit

class EpisodesTableViewController: UITableViewController {
    
    var networkManager = NetworkManager()
    var episodes: [EpisodeData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.fetchEpisodes() { episodes in
            self.episodes = episodes
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        episodes.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath)

        let episode = episodes[indexPath.row]
        cell.textLabel?.text = episode.title
        cell.detailTextLabel?.text = "Дата выхода \(episode.airDate ?? "")"
    
        return cell
    }
   
}
