//
//  CoreDataManager.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 12.10.2025.
//

import CoreData
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()

    private init() {}


    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FavoritePostsModel")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }


    func savePost(author: String, postDescription: String, image: String, likes: Int, views: Int) {
        let post = FavoritePost(context: context)
        post.author = author
        post.postDescription = postDescription
        post.image = image
        post.likes = Int32(likes)
        post.views = Int32(views)

        saveContext()
    }


    func fetchAllPosts() -> [FavoritePost] {
        let request: NSFetchRequest<FavoritePost> = FavoritePost.fetchRequest()

        do {
            return try context.fetch(request)
        } catch {
            print("Failed to fetch posts: \(error)")
            return []
        }
    }


    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func deleteAllPosts() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = FavoritePost.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
            saveContext()
        } catch {
            print("Failed to delete posts: \(error)")
        }
    }
}
