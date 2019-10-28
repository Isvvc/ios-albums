//
//  SongTableViewCell.swift
//  Albums
//
//  Created by Isaac Lyons on 10/28/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var addSongButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: Actions
    
    @IBAction func addSong(_ sender: UIButton) {
    }
    
}