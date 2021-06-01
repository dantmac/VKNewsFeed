//
//  NewsFeedInteractor.swift
//  VKNewsFeed
//
//  Created by admin on 27.05.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsFeedBusinessLogic {
  func makeRequest(request: NewsFeed.Model.Request.RequestType)
}

class NewsFeedInteractor: NewsFeedBusinessLogic {

  var presenter: NewsFeedPresentationLogic?
  var service: NewsFeedService?
   
    private var revealedPostIds = [Int]()
    private var feedResponse: FeedResponse?
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
  
  func makeRequest(request: NewsFeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsFeedService()
    }
    
    switch request {
    case .getNewsFeed:
        fetcher.getFeed { [weak self] (feedResponse) in
            self?.feedResponse = feedResponse
            self?.presentFeed()
        }
        
    case .getUser:
        fetcher.getUser { (userResponse) in
            self.presenter?.presentData(response: .presentUserInfo(user: userResponse))
        }
        
    case .revealPostIds(let postId):
        revealedPostIds.append(postId)
        presentFeed()
    }
  }
  
    private func presentFeed() {
        guard let feedResponse = feedResponse else { return }
        presenter?.presentData(response: NewsFeed.Model.Response.ResponseType.presentNewsFeed(feed: feedResponse, revealPostIds: revealedPostIds))
    }
}
