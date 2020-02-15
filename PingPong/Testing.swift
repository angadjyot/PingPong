//
//  Testing.swift
//  PingPong
//
//  Created by Angadjot singh on 12/02/20.
//  Copyright © 2020 Angadjot singh. All rights reserved.
//

import Foundation
import UIKit

class Testing{
    
    
    public static func show() -> UIAlertController {
        let actionSheet = UIAlertController(title: "Gameover",  message: "Which one do you prefer?", preferredStyle: .actionSheet)
        
        let menu = UIAlertAction(title: "Go To The Menu", style:  .destructive) { (action) in
            //menuCB()
        }
        
        let yes = UIAlertAction(title: "Restart the game", style:  .default) { (action) in
          //  register_t()
        }
        
        actionSheet.addAction(yes)
        actionSheet.addAction(menu)
        
        return actionSheet
    }
    
    
    
}
