// Created by Prof. H in 2022
// Part of the PriceCheckFB project
// Using Swift 5.0
// Qapla'


import Combine
import Combine
import FirebaseFirestore
// import Firebase modules here


class LocationRepository: ObservableObject {
  // Set up properties here
  private let path: String = "locations"
  private let store = Firestore.firestore()

  
  @Published var locations: [Location] = []
   private var cancellables: Set<AnyCancellable> = []

  
  init() {
    get()
  }

  func get() {
    .addSnapshotListener { querySnapshot, error in
           if let error = error {
             print("Error getting books: \(error.localizedDescription)")
             return
           }

           self.books = querySnapshot?.documents.compactMap { document in
             try? document.data(as: Book.self)
           } ?? []
         }
  }
}
