class SentMemesInteractor {
    let memeDS = MemeDataStorage()
    
    func getElementAt(index: Int) -> Meme {
        return memeDS.getElementAt(index)
    }
    
    func numberOfMemes() -> Int {
        return memeDS.all().count
    }
}