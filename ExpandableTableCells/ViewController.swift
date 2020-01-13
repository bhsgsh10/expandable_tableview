//
//  ViewController.swift
//  ExpandableTableCells
//
//  Created by Bhaskar Ghosh on 1/12/20.
//  Copyright © 2020 Bhaskar Ghosh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Constants:
    let longDescription = "Dummy description Dummy description Dummy description Dummy description Dummy description Dummy description Dummy description Dummy description Dummy description Dummy description Dummy description Dummy description Dummy description Dummy description Dummy description"
    let shortDescription = "Tap on me to read more"
    
    @IBOutlet weak var tableView: UITableView!
    var expandedLabel: UILabel!
    var indexOfCellToExpand: Int!
    var indexOfCellToCollapse: Int!
    var previousExpanded: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        indexOfCellToExpand = -1
        tableView.register(UINib(nibName: "SymbolTableViewCell", bundle: nil), forCellReuseIdentifier: "CellID")
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID") as! SymbolTableViewCell
        cell.delegate = self
        cell.symbolImageView.image = UIImage(named: "Odal.png")
        cell.titleLabel.text = "Dummy title"
        cell.descriptionLabel.text = getDescriptionText(selectedRowIndex: indexPath.row)
        cell.descriptionLabel.tag = indexPath.row
//        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.expandCell(sender:)))
//        cell.descriptionLabel.addGestureRecognizer(tap)
        cell.descriptionLabel.isUserInteractionEnabled = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print(indexOfCellToExpand)
        var height: CGFloat = 220.0
        
        if indexPath.row == indexOfCellToExpand {
            height =  UITableView.automaticDimension
            
        }
        if indexPath.row == indexOfCellToCollapse {
            height = 220.0
        }
        return height
    }
    
    func expandCell(label: UILabel)
    {
        //let label = sender.view as! UILabel
        
        let cell: SymbolTableViewCell = self.tableView.cellForRow(at: IndexPath(row: label.tag, section: 0)) as! SymbolTableViewCell
        cell.descriptionLabel.sizeToFit()
        cell.descriptionLabel.text = longDescription
        self.expandedLabel = cell.descriptionLabel
        self.indexOfCellToCollapse = self.indexOfCellToExpand
        self.indexOfCellToExpand = label.tag
        
        if indexOfCellToCollapse == indexOfCellToExpand {
            resetIndices()
        }
        cell.isExpanded = true
        tableView.reloadData()
//        self.tableView.reloadRows(at: [IndexPath(row: label.tag, section: 0)], with: .fade)
        self.tableView.scrollToRow(at: IndexPath(row: label.tag, section: 0), at: .top, animated: true)
    }
    
    func resetIndices() {
        indexOfCellToExpand = -1
        indexOfCellToCollapse = -1
    }
    
    func getDescriptionText(selectedRowIndex: Int) -> String {
        if selectedRowIndex == indexOfCellToExpand && indexOfCellToExpand != indexOfCellToCollapse {
            return longDescription
        } else {
            return shortDescription
        }
    }
    
}

extension ViewController: SymbolTableViewCellDelegate {
    func symbolCellOpenButtonTapped(sender: SymbolTableViewCell) {
        expandCell(label: sender.descriptionLabel)
    }
}

