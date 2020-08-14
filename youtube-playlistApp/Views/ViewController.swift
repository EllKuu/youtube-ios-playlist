//
//  ViewController.swift
//  youtube-playlistApp
//
//  Created by elliott kung on 2020-08-13.
//  Copyright © 2020 elliott kung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self
        model.getVideos()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // confirm that a video was selected
        guard tableView.indexPathForSelectedRow != nil else { return }
        // get a ref to the vid that was tapped on
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        // get ref to the detail VC
        let detailVC = segue.destination as! DetailViewController
        // set the vid property of the VC
        detailVC.video = selectedVideo
    }
    
    // MARK: model delegate methods
    func videosFetched(_ videos: [Video]) {
        // set returned videos to our video property
        self.videos = videos
        // refresh the tableview
        tableView.reloadData()
    }
    
    // MARK: - tableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        // configure cell with data
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
        // return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}

