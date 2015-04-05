
import UIKit

class MemeEditorNavigatorMock: MemeEditorNavigator {
    var presentActivityWasCalled = false
    var imagePickerWasCalledWithSourceType: UIImagePickerControllerSourceType!
    
    override func presentActivity(meme: Meme){
        presentActivityWasCalled = true
    }

    override func presentImagePicker(delegate: MemeEditorPresenter, sourceType: UIImagePickerControllerSourceType){
        imagePickerWasCalledWithSourceType = sourceType
    }

}

class MemeEditorInteractorMock: MemeEditorInteractor {
    var saveMemeWasCalled = false
    
    override func saveMeme(view: MemeEditorViewController) -> Meme {
        saveMemeWasCalled = true
        return Fixture.validMeme()
    }
    
    
}