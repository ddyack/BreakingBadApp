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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return episodes.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath)

        let episode = episodes[indexPath.row]
        cell.textLabel?.text = "Название серии \(episode.title ?? "")"
        cell.detailTextLabel?.text = "Дата выхода \(episode.airDate ?? "")"
        
        return cell
    }
   
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
