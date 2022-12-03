//
//  KomodoApp.swift
//  Komodo
//
//  Created by Vishal Puppala on 10/29/22.
//

import SwiftUI
import CoreML

@main
struct KomodoApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject var recordingObject=AudioRecorder()

    
    //let model = content()
    init(){
        print("hi")
        print(NSHomeDirectory())

    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
