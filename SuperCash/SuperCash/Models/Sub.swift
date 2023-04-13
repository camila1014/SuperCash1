//
//  Sub.swift
//  SuperCash
//
//  Created by Camila Aichele on 3/21/23.
//

import UIKit

class Sub {
    let title: String
    let description: String
    let price: String
    var isSubscribed: Bool

    init(title: String, description: String, price: String) {
        self.title = title
        self.description = description
        self.price = price
    }

}

extension Sub {
    static var mockedSubs: [Sub] {
        return [
            Sub(title: "Netflix",
                description: "can watch movies and tv shows", price: "$20"),
            Sub(title: "Hulu",
                description: "can watch movies and tv shows", price: "$10"),
            Sub(title: "Sephora",
                description: "access to makeup and self care", price: "$5")
        ]
    }
}
