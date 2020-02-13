//
//  InstructionsViewController.swift
//  PingPong
//
//  Created by Angadjot singh on 12/02/20.
//  Copyright © 2020 Angadjot singh. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tableview: UITableView!
    
    var arr = ["Ball will continuosly strike in between the paddles.","Both the players will try their best to save the ball and does not allow to go beyond the paddles.","The player who misses the ball to strike will result in the increment of scoe of the opposite player.","The player with  highest score will win the game."]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let index = arr[indexPath.row]
        
        if let x = cell.viewWithTag(1) as? UILabel{
            x.text = index
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    @IBAction func close(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
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
