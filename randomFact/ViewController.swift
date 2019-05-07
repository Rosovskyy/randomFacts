//
//  ViewController.swift
//  randomFact
//
//  Created by Serhiy Rosovskyy on 5/7/19.
//  Copyright © 2019 Serhiy Rosovskyy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: -Properties
    let joke = ""
    let url = URL(string: "https://geek-jokes.sameerkumar.website/api")!
    var jokes = [""]

    // MARK: -IBOutlets
    @IBOutlet weak var factLabel: UILabel!


    // MARK: -Init

    fileprivate func labelConfiguration() {
        self.factLabel.lineBreakMode = .byWordWrapping
        self.factLabel.numberOfLines = 0
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.labelConfiguration()

        self.getRandomJoke()

    }

    func getRandomColor() -> CGColor {
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())

        return UIColor(red:red, green: green, blue: blue, alpha: 1.0).cgColor
    }

    func getRandomJoke() {
        let task = URLSession.shared.dataTask(with: self.url) { (data, response, error) in
            guard let data = data else { return }

            self.jokes[0] = String(data: data, encoding: .utf8)!
        }
        task.resume()
    }

    func setRandomJoke() {
        self.factLabel.text = self.jokes[0]
        getRandomJoke()
    }

    // MARK: -Actions

    @IBAction func swapJokeTapped(_ sender: Any) {
        self.view.layer.backgroundColor = getRandomColor()

        setRandomJoke()
    }


}

