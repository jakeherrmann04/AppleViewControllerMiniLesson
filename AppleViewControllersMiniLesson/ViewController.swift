//
//  ViewController.swift
//  AppleViewControllersMiniLesson
//
//  Created by Jake Herrmann on 11/5/15.
//  Copyright © 2015 Jake Herrmann. All rights reserved.
//

import UIKit
import MessageUI
import SafariServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cameraButtnClicked(sender: AnyObject) {
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        
        let alert = UIAlertController(title: "Select Photo Option", message: nil, preferredStyle: .ActionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
            alert.addAction(UIAlertAction(title: "Camera Roll", style: .Default, handler: { (_) -> Void in
                
                imagePicker.sourceType = .PhotoLibrary
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }))
        
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.SavedPhotosAlbum){
            alert.addAction(UIAlertAction(title: "Camera", style: .Default, handler: { (_) -> Void in
                
                imagePicker.sourceType = .Camera
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }))
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    @IBAction func mailButtonClicked(sender: AnyObject) {
       
        if(MFMailComposeViewController.canSendMail()){
            let mailComposer = MFMailComposeViewController()
            mailComposer.mailComposeDelegate = self

            mailComposer.setSubject("Hey Mike")
            mailComposer.setMessageBody("I hope this snow is treating you right", isHTML: false)
            
            self.presentViewController(mailComposer, animated: true, completion: nil)

        }
        
        
    }
        
    
    
    @IBAction func activityButtonClicked(sender: AnyObject) {
        let activity = UIActivityViewController(activityItems: [UIActivityTypeMail, UIActivityTypeMessage], applicationActivities: [])
     
        
        self.presentViewController(activity, animated: true, completion: nil)
        
    }
    @IBAction func webButtonClicked(sender: AnyObject) {

        let svc = SFSafariViewController(URL: NSURL(string: "https://www.facebook.com/michaeliscool?fref=ts")!)
        self.presentViewController(svc, animated: true, completion: nil)
        
    }
}

