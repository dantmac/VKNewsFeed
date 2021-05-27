//
//  NewsFeedPresenter.swift
//  VKNewsFeed
//
//  Created by admin on 27.05.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsFeedPresentationLogic {
  func presentData(response: NewsFeed.Model.Response.ResponseType)
}

class NewsFeedPresenter: NewsFeedPresentationLogic {
  weak var viewController: NewsFeedDisplayLogic?
  
  func presentData(response: NewsFeed.Model.Response.ResponseType) {
  
    switch response {
    case .some:
        print(".some Presenter")
    case .presentNewsFeed:
        print(".presentNewsFeed Presenter")
        viewController?.displayData(viewModel: .displayNewsFeed)
    }
  }
  
}
