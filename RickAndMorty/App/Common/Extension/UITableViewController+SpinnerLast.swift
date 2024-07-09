//
//  UITableViewController+SpinnerLast.swift
//  RickAndMorty
//
//  Created by Keybe on 11/07/23.
//

import UIKit

extension UITableViewController {
    func addSpinnerLastCell() {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.startAnimating()
        spinner.frame = CGRect(x: .zero, y: .zero, width: tableView.bounds.width, height: CGFloat(ViewValues.defaultHeightCell))
        tableView.tableFooterView = spinner
    }
    
}
