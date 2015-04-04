import UIKit

class MemeDataStorage: NSObject {
 
    private static var collection = [Meme]()

    func all() -> [Meme]{
        return MemeDataStorage.collection
    }
    
    func getElementAt(index: Int) -> Meme {
        return all()[index]
    }
    
    func saveMeme(meme: Meme){
        MemeDataStorage.collection.append(meme)
    }
    
    func removeAllMemes(){
        MemeDataStorage.collection = [Meme]()
    }
}