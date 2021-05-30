//
//  Story.swift
//  InstaStory
//
//  Created by Nitin Kachhadiya on 30/05/21.
//

import Foundation

class Story: Codable {
    
    public var storyId:Int = 0
    public let name: String
    public let image: String
    public var statusViewed: Bool = false
    public var animated: Bool = false

    init(storyId: Int, name:String, image: String, statusViewed: Bool = false, animated: Bool = false) {
        
        self.storyId = storyId
        self.name = name
        self.image = image
        self.statusViewed = statusViewed
        self.animated = animated
    }
}
