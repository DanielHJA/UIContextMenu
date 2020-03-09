//
//  ViewController.swift
//  ContextMenuTest
//
//  Created by Daniel Hjärtström on 2020-03-09.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIContextMenuInteractionDelegate {
    
    private lazy var button: UIButton = {
        let temp = UIButton()
        temp.setTitle("Set value", for: .normal)
        temp.layer.cornerRadius = 5.0
        temp.setTitleColor(UIColor.white, for: .normal)
        //temp.addTarget(self, action: #selector(didTouchButton), for: .touchUpInside)
        temp.backgroundColor = UIColor.blue
        view.addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        temp.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        temp.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        temp.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        return temp
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        button.isHidden = false
        let interaction = UIContextMenuInteraction(delegate: self)
        button.addInteraction(interaction)
    }
    
    @objc private func didTouchButton() {

    }
    
    private func share() {
        print("share")
    }
    
    private func delete() {
        print("delete")
    }
    
    private func edit() {
        print("edit")
    }

    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (element) -> UIMenu? in
            
            let share = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) { (action) in
                self.share()
            }
            
            let delete = UIAction(title: "Delete", image: UIImage(systemName: "trash")) { (action) in
                self.delete()
            }
            
            let edit = UIAction(title: "Edit", image: UIImage(systemName: "square.and.pencil")) { (action) in
                self.edit()
            }
         
            return UIMenu(title: "Actions", image: nil, identifier: nil, options: [], children: [share, delete, edit])
        }
    }
    
}
