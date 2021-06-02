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
   
  func makeRequest(request: NewsFeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsFeedService()
    }
    
    switch request {
    case .getNewsFeed:
        service?.getFeed(completion: { [weak self] (revealedPostIds, feed) in
            guard let feed = feed else { return }
            self?.presenter?.presentData(response: .presentNewsFeed(feed: feed, revealPostIds: revealedPostIds))
        })
    case .getUser:
        service?.getUser(completion: { [weak self] (user) in
            self?.presenter?.presentData(response: .presentUserInfo(user: user))
        })
    case .revealPostIds(let postId):
        service?.revealPostIds(forPostId: postId, completion: { [weak self] (revealedPostIds, feed) in
            guard let feed = feed else { return }
            self?.presenter?.presentData(response: .presentNewsFeed(feed: feed, revealPostIds: revealedPostIds))
        })
    case .getNextBatch:
        self.presenter?.presentData(response: .presentFooterLoader)
        service?.getNextBatch(completion: { [weak self] (revealedPostIds, feed) in
            guard let feed = feed else { return }
            self?.presenter?.presentData(response: .presentNewsFeed(feed: feed, revealPostIds: revealedPostIds))
        })
    }
  }
}
