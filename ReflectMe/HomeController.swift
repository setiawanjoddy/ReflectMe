//
//  ViewController.swift
//  ReflectMe
//
//  Created by James Barlian on 03/04/20.
//  Copyright © 2020 Group 11 - Apple Developer Academy. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var greetingsLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var homeTableView: UITableView!
    var currentDate = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.delegate = self
        homeTableView.dataSource = self
        GetTime()
        GetCurrentDate()
        
    }
    
    func GetTime () {
       
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
        case 6..<12:
            greetingsLabel.text = "Good Morning,"
        case 12..<17:
            greetingsLabel.text = "Good Afternoon,"
        case 17..<22:
            greetingsLabel.text = "Good Evening,"
        default:
            greetingsLabel.text = "Good Night,"
        }
        
        
    }
    
    func GetCurrentDate() {
        // Gets tne current date
        let currentDateTime = Date()

        // Initialize formatter and set style
        let format = DateFormatter()
        format.dateStyle = .long

        dateLabel.text = format.string(from: currentDateTime)
        currentDate = format.string(from: Date())
    }
    
//    function Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeTableViewCell
        cell.labelDate.text = currentDate
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}

