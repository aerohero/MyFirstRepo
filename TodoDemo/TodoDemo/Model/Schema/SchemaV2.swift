//
//  SchemaV2.swift
//  TodoDemo
//
//  Created by Sean on 1/21/25.
//

import Foundation
import SwiftData

enum SchemaV2: VersionedSchema {
    static var versionIdentifier = Schema.Version(2, 0, 0)
    
    static var models: [any PersistentModel.Type] {
        [SchemaV2.TodoItem.self, Category.self]
    }
    
    @Model
    final class TodoItem: Identifiable, Hashable {
        var id: String = UUID().uuidString
        var title: String = ""
        var dueDate: Date? // 추가
        var category: Category? = nil // 추가
        var isCompleted: Bool = false
        var createdAt: Date = Date()
        var priority: Priority = Priority.medium
        
        init(title: String,
             isCompleted: Bool = false,
             priority: Priority = Priority.medium,
             dueDate: Date? = nil,
             category: Category? = nil,
             createdAt: Date = Date()) {
            self.title = title
            self.isCompleted = isCompleted
            self.priority = priority
            self.dueDate = dueDate
            self.category = category
            self.createdAt = createdAt
        }
    }
}
