//
//  EventsFirebase.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 29/11/22.
//

import Foundation
import FirebaseFirestore

extension Event {
    static func build(from documents: [QueryDocumentSnapshot]) -> [Event] {
        var events = [Event]()
        for document in documents {
            events.append(Event(title: document["name"] as? String ?? "",
                                imageUrl: document["url"] as? String ?? "",
                                date: document["date"] as? String ?? "",
                                hour: document["hour"] as? String ?? "",
                                pricing: document["pricing"] as? String ?? "",
                                description: document["description"] as? String ?? ""))
        }
        return events
    }
}
