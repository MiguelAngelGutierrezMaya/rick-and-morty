//
//  ItemHomeMenuViewModel.swift
//  RickAndMorty
//
//  Created by Keybe on 19/04/23.
//

struct ItemHomeMenuViewModel {
    private let menuItem: MenuItem
    
    init(menuItem: MenuItem) {
        self.menuItem = menuItem
    }
    
    var title: String {
        menuItem.title.capitalized
    }
    var imageName: String {
        menuItem.title
    }
}
