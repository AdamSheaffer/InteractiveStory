//
//  Page.swift
//  InteractiveStory
//
//  Created by Adam Sheaffer on 2/23/18.
//  Copyright © 2018 Adam Sheaffer. All rights reserved.
//

import Foundation

class Page {
    let story: Story
    
    typealias Choice = (title: String, page: Page)
    
    var firstChoice: Choice?
    var secondChoice: Choice?
    
    init(story: Story) {
        self.story = story
    }
}

extension Page {
    func addChoiceWith(title: String, story: Story) -> Page {
        return addChoiceWith(title: title, page: Page(story: story))
    }
    
    func addChoiceWith(title: String, page: Page) -> Page {
        switch (firstChoice, secondChoice) {
        case (.some, .some): return self
        case (.none, .none), (.some, .none): firstChoice = (title, page)
        case (.none, .some): secondChoice = (title, page)
        }
        
        return page
    }
}
