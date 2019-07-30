//
//  GIFPresenter.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 6/18/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation
enum GIFViews: Int {
    case trendingView, firstView, secondView, thirdView, fourthView
}

protocol GIFPresenterView {
    func setSucceeded(_ view: GIFViews)
}
class GIFPresenter {
    private var view: GIFPresenterView?
    private var GIFList = [GIFViews: [GIFItemModel]]()//string is the ID
    private let service: TenorGIF?
    
    init(_ service: TenorGIF) {
        self.service = service
    }
    
    func attachView(view: GIFPresenterView) {
        self.view = view
    }
    
    func detachView() {
        self.view = nil
    }
    
    func getTrendingGIFs() {
        service?.getGIFS(count: 10, completion: {[weak self] GIFS in
            self?.GIFList[.trendingView] = GIFS.results
            self?.view?.setSucceeded(.trendingView)
        })
    }
    
    func getGIFs(at view: GIFViews) {
        if view == .trendingView {
            
        }
        guard let categories = DBHelper.shared.getGIFCategories() else {return}
        
        let searchTerm = categories[view.rawValue].item
        service?.getGIF(using: searchTerm, limit: 10, completion: {[weak self] GIFs in
            self?.GIFList[view] = GIFs.results
            self?.view?.setSucceeded(view)
        })
    }
    
    func returnGIFCategories() -> [GIFCategoryItem] {
        guard let data = DBHelper.shared.getGIFCategories() else {return []}
        return data
    }
        
    func returnGIFData(_ view: GIFViews) -> [GIFItemModel]? {
        return GIFList[view]
    }
    
    func returnGIFItem(_ view: GIFViews, at indexPath: IndexPath) -> GIFItemModel? {
        return GIFList[view]?[indexPath.row]
    }
    
    func returnGIFCount(_ view: GIFViews) -> Int {
        return GIFList[view]?.count ?? 0
    }

    
    
}
