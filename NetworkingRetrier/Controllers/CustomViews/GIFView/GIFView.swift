//
//  GIFView.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 6/18/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import UIKit
import Foundation
class GIFView: UIView, UIScrollViewDelegate {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var baseScrollView: UIScrollView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var GIFCollectionView: UICollectionView!
    @IBOutlet weak var GIFCollectionView1: UICollectionView!
    @IBOutlet weak var GIFCollectionView2: UICollectionView!
    @IBOutlet weak var GIFCollectionView3: UICollectionView!
    @IBOutlet weak var GIFCollectionView4: UICollectionView!

    private var presenter: GIFPresenter?
    
    private var categoriesCollectionViewAdapter: CollectionViewAdapter!
    private var GIFCollectionViewAdapter: CollectionViewAdapter!
    private var GIFCollectionView1Adapter: CollectionViewAdapter!
    private var GIFCollectionView2Adapter: CollectionViewAdapter!
    private var GIFCollectionView3Adapter: CollectionViewAdapter!
    private var GIFCollectionView4Adapter: CollectionViewAdapter!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }

    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.426865671641791))
    }

    
    func customInit() {
        Bundle.main.loadNibNamed("\(GIFView.self)", owner: self, options: nil)
        addSubview(contentView)
        baseScrollView.delegate = self
        setupFrames()
        configurePresenter()
        configureCategoriesCollectionView()
        configureGIFCollectionView()
        configureGIFCollectionView1()
        configureGIFCollectionView2()
        configureGIFCollectionView3()
        configureGIFCollectionView4()
    }
  
    fileprivate func setupFrames() {
        contentView.frame = self.frame
        GIFCollectionView.frame = self.frame
        GIFCollectionView1.frame = self.frame
        GIFCollectionView2.frame = self.frame
        GIFCollectionView3.frame = self.frame
        GIFCollectionView4.frame = self.frame
    }
    
    
    fileprivate func configureCategoriesCollectionView() {
        categoriesCollectionView.register(UINib(nibName: "\(GIFCategoriesCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(GIFCategoriesCell.self)")
        (categoriesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.estimatedItemSize = CGSize(width: 10, height: 10)
        categoriesCollectionViewAdapter = CollectionViewAdapter(items: presenter?.returnGIFCategories() ?? [] , cell: GIFCategoriesCell.self)
        categoriesCollectionViewAdapter.didSelectHandler = { [weak self] indexPath in
            //here adjust the offset for the item selected
            let width = Int(self?.categoriesCollectionView.frame.width ?? 0)
            let xOffsetValue = Float(indexPath.row * width)
            let CGPointXOffset = CGPoint(x: Int(xOffsetValue), y: 0)
            
            // if the current view is not showing proceed, otherwise return
            guard let currentView = GIFViews(rawValue: indexPath.row), Int(xOffsetValue) != Int(self?.baseScrollView.contentOffset.x ?? 0) else {return}
            self?.baseScrollView.setContentOffset(CGPointXOffset, animated: true)
            if currentView == .trendingView {
                self?.presenter?.getTrendingGIFs()
                return
            }
            self?.presenter?.getGIFs(at: currentView)
        }
        categoriesCollectionView.setAdapter(categoriesCollectionViewAdapter)
        categoriesCollectionView.reloadData()
        slideCategoriesToSelectedView()
    }
    
    fileprivate func configureGIFCollectionView() {
       
        GIFCollectionView.register(UINib(nibName: "\(GIFKeyboardCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(GIFKeyboardCell.self)")
        
        GIFCollectionViewAdapter = CollectionViewAdapter(items: presenter?.returnGIFData(.trendingView) ?? [], cell: GIFKeyboardCell.self, cellSize: CGSize(width: (GIFCollectionView.frame.width / 2) - 12, height: 100))
        GIFCollectionView.setAdapter(GIFCollectionViewAdapter)
    }
    
    fileprivate func configureGIFCollectionView1() {
        GIFCollectionView1.register(UINib(nibName: "\(GIFKeyboardCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(GIFKeyboardCell.self)")
        GIFCollectionView1Adapter = CollectionViewAdapter(items: presenter?.returnGIFData(.firstView) ?? [], cell: GIFKeyboardCell.self, cellSize: CGSize(width: (GIFCollectionView1.frame.width / 2) - 12, height: 100))
        GIFCollectionView1.setAdapter(GIFCollectionView1Adapter)
    }
    
    fileprivate func configureGIFCollectionView2() {
       GIFCollectionView2.register(UINib(nibName: "\(GIFKeyboardCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(GIFKeyboardCell.self)")
        GIFCollectionView2Adapter = CollectionViewAdapter(items: presenter?.returnGIFData(.secondView) ?? [], cell: GIFKeyboardCell.self, cellSize: CGSize(width: (GIFCollectionView2.frame.width / 2) - 12, height: 100))
        GIFCollectionView2.setAdapter(GIFCollectionView2Adapter)
    }
    
    fileprivate func configureGIFCollectionView3() {
        GIFCollectionView3.register(UINib(nibName: "\(GIFKeyboardCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(GIFKeyboardCell.self)")

        GIFCollectionView3Adapter = CollectionViewAdapter(items: presenter?.returnGIFData(.thirdView) ?? [], cell: GIFKeyboardCell.self, cellSize: CGSize(width: (GIFCollectionView3.frame.width / 2) - 12, height: 100))
        GIFCollectionView3.setAdapter(GIFCollectionView3Adapter)
    }
    
    fileprivate func configureGIFCollectionView4() {
        GIFCollectionView4.register(UINib(nibName: "\(GIFKeyboardCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(GIFKeyboardCell.self)")

        GIFCollectionView4Adapter = CollectionViewAdapter(items: presenter?.returnGIFData(.fourthView) ?? [], cell: GIFKeyboardCell.self, cellSize: CGSize(width: (GIFCollectionView4.frame.width / 2) - 12, height: 100))
        GIFCollectionView4.setAdapter(GIFCollectionView4Adapter)
    }


    func configurePresenter() {
        presenter = GIFPresenter(TenorGIF())
        presenter?.attachView(view: self)
        presenter?.getTrendingGIFs()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        slideCategoriesToSelectedView()
    }
    
    func slideCategoriesToSelectedView() {
        let width = Int(baseScrollView.frame.width)
        let view = (Int(baseScrollView.contentOffset.x) / width)
        
        // if the current view is not showing proceed, otherwise return
        guard let currentView = GIFViews(rawValue: view) else {return}
         categoriesCollectionView.selectItem(at: IndexPath(item: currentView.rawValue, section: 0), animated: true, scrollPosition: .centeredHorizontally)
        if currentView == .trendingView {
            presenter?.getTrendingGIFs()
            return
        }
        presenter?.getGIFs(at: currentView)
       
    }
}

extension GIFView: GIFPresenterView {
    func setSucceeded(_ view: GIFViews) {
        switch view {
        case .trendingView:
            GIFCollectionViewAdapter.updateItems(presenter?.returnGIFData(.trendingView) ?? [])
            GIFCollectionView.reloadData()
        case .firstView:
            GIFCollectionView1Adapter.updateItems(presenter?.returnGIFData(.firstView) ?? [])
            GIFCollectionView1.reloadData()
        case .secondView:
            GIFCollectionView2Adapter.updateItems(presenter?.returnGIFData(.secondView) ?? [])
            GIFCollectionView2.reloadData()
        case .thirdView:
            GIFCollectionView3Adapter.updateItems(presenter?.returnGIFData(.thirdView) ?? [])
            GIFCollectionView3.reloadData()
        case .fourthView:
            GIFCollectionView4Adapter.updateItems(presenter?.returnGIFData(.thirdView) ?? [])
            GIFCollectionView4.reloadData()
       
        }
    }

}

