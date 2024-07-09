//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by Keybe on 18/03/23.
//

import UIKit

protocol Coordinator {
    var navigation: UINavigationController { get }
    
    func start()
}
