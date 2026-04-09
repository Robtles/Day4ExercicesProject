//
//  SceneDelegate.swift
//  Day4ExercicesProject
//

import CoreData
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    lazy var persistentContainer: NSPersistentContainer = {
           let container = NSPersistentContainer(name: "Model")
           container.loadPersistentStores { _, error in
               if let error {
                   fatalError("Erreur CoreData : \(error)")
               }
           }
           return container
       }()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let context = persistentContainer.viewContext

        let loader = PokedexLoader()
        let cacheStore = PokedexCacheStore(context: context)
        let preferencesService = PreferencesServiceImpl()

        let repository = PokedexRepository(
            loader: loader,
            cacheStore: cacheStore,
            preferencesService: preferencesService
        )
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(rootViewController: PokemonListViewController(repository: repository))
        window.makeKeyAndVisible()
        self.window = window
    }
}
