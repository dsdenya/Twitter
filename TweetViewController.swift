//
//  TweetViewController.swift
//  Twitter
//
//  Created by Aloha on 10/4/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTestView.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var tweetTestView: UITextView!
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tweet(_ sender: Any) {
        if(!tweetTestView.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetTestView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: {(Error) in
                print("Error posting tweet \(Error) ")
                self.dismiss(animated: true, completion: nil)

            })
        } else {
            self.dismiss(animated: true, completion: nil)

            
        }
        
        
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
