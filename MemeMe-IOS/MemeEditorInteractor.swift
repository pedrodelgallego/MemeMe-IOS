
class MemeEditorInteractor {
    let memeDS = MemeDataStorage()
    
    func saveMeme(view: MemeEditorViewController) -> Meme {
        let meme = Meme(topText: view.topTextField.text!, bottomText: view.bottomTextField.text!, imageView: view.imageView)
        
        meme.generateImage(view.MemeEditorView)
        memeDS.saveMeme(meme)
        
        return meme
    }
}
