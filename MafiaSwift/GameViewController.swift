//
//  GameViewController.swift
//  MafiaSwift
//
//  Created by Michael Reining on 1/26/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    var model: Model?
    var citizensCount: Int = 0
    
    @IBOutlet weak var citizensLeftLabel: UILabel!
    private let reuseIdentifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        citizensCount = model!.players.count - 1
        citizensLeftLabel.text = "Citizens Left: \(citizensCount)"

    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model!.players.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as UICollectionViewCell
        cell.backgroundColor = UIColor.blueColor()
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("\(indexPath.row)")
        let cell = collectionView.cellForItemAtIndexPath(indexPath)

        if model!.players[indexPath.row] == 1 {
            println("You found the mafia!")
            cell?.backgroundColor = UIColor.greenColor()

            let alert = UIAlertController(title: "You got the mafia!", message: "Success.  Mafia found just in time!", preferredStyle: .Alert)
            let action = UIAlertAction(title: "Awesome!", style: .Default, handler: nil)
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
            
        } else {
            cell?.backgroundColor = UIColor.redColor()
            citizensCount -= 1
            citizensLeftLabel.text = "Citizens Left: \(citizensCount)"

        }
        if citizensCount == 0 {
            let alert = UIAlertController(title: "Game Over!", message: "The Mafia has killed everyone!", preferredStyle: .Alert)
            let action = UIAlertAction(title: ":(", style: .Default, handler: nil)
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        }
        
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if model!.players.count > 9 {
            return CGSize(width: 50, height: 50)
        }
        return CGSize(width: 75, height: 75)
    }
    
    
    
}
