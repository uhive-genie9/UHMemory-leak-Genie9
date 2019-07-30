//
//  CollectionViewAdapter.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 6/25/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import UIKit
protocol CellabeDelegate {}
protocol Cellable {
    var cellableDelegate: CellabeDelegate? {get set}
    func configure(_ object: Configurable?)
}

extension Cellable {

    var cellableDelegate: CellabeDelegate? {  get { return nil } set {} }
    
    var identifier: String {return "\(self)"}
}

extension UICollectionView {
    func setAdapter(_ adapter: CollectionViewAdapter) {
        delegate = adapter
        dataSource = adapter
    }
}

class CollectionViewAdapter: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var items: [Configurable]!
    var cell: Cellable.Type
    var cellSize: CGSize?
    var delegate: CellabeDelegate? = nil
    var didSelectHandler: ((IndexPath) -> Void)?
    
    init(items: [Configurable], cell: Cellable.Type, delegate: CellabeDelegate? = nil, cellSize: CGSize? = nil) {
        self.cellSize = cellSize
        self.items = items
        self.cell = cell
        self.delegate = delegate
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectHandler?(indexPath)
    }
    
    func updateItems(_ items: [Configurable]) {
        self.items = items
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cl = collectionView.dequeueReusableCell(withReuseIdentifier: "\(cell.self)", for: indexPath) as! Cellable & UICollectionViewCell
        cl.cellableDelegate = delegate
        cl.configure(items[indexPath.row])
        return cl
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        return cellSize ?? .zero
    }

    
}
