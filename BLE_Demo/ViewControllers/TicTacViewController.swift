//
//  TicTacViewController.swift
//  gaiaDemo
//
//  Created by User on 3/30/19.
//  Copyright © 2019 IQVIS. All rights reserved.
//

import UIKit

class TicTacViewController: UIViewController {

    var ticTacToe = TicTacToe()
    @IBOutlet var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateState()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(sender: UIButton) {
        if sender.title(for: .normal) != "-" {
            return
        }
        var btnTextValue: String
        var btnBoardValue: Int
        switch ticTacToe.checkStatus() {
        case .xTurn:
            btnTextValue = "X"
            btnBoardValue = 1
        case .oTurn:
            btnTextValue = "O"
            btnBoardValue = 2
        default:
            btnTextValue = "-"
            btnBoardValue = 0
        }
        ticTacToe.board[(sender.tag-1)/3][(sender.tag-1)%3] = btnBoardValue
        sender.setTitle(btnTextValue, for: .normal)
        updateState()
    }
    
    @IBAction func btnResetTapped(sender: UIButton) {
        ticTacToe.resetBoard()
        for i in 1...9 {
            let btn = self.view.viewWithTag(i) as! UIButton
            btn.setTitle("-", for: .normal)
        }
        updateState()
    }
    
    @objc func updateState() {
        lblStatus.text = ticTacToe.checkStatus().rawValue
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "homeScreen")
        self.present(nextViewController, animated:true, completion:nil)
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
