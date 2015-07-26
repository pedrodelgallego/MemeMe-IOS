Architechture
=============

A simplify version of the VIPER architecture[1], [2]

[1] http://www.objc.io/issue-13/viper.html
[2] https://realm.io/news/altconf-brice-pollock-250-days-shipping-with-swift-and-viper/

Interactor
----------
An Interactor represents a single use case in the app. It contains the business logic to manipulate model objects (Entities) to carry out a specific task. The work done in an Interactor is independent of any type of UI. The same Interactor could be used in an iOS app or a console application.

Because the Interactor is a PONSO (Plain Old NSObject) which primarily contains logic it is easy to develop using TDD.

Entity
------
Entities are the model objects manipulated by an Interactor. Entities are only manipulated by the Interactor. The Interactor never passes Entities to the presentation layer (i.e. Presenter).

Data Store
-----------
The Data Store is responsible for providing Entities to an Interactor. As an Interactor applies its business logic it will typically retrieve Entities from the Data Store, manipulate the Entities and then put the updated Entities back in the Data Store. The Data Store manages the persistence of the Entities. Entities do not know about the Data Store, so Entities do not know how to persist themselves.

Presenter
---------
The Presenter is a PONSO which mainly consists of logic to drive the UI. It gathers input from user interactions so it can send requests to an Interactor. The Presenter also receives results from an Interactor and converts the results into a form that is efficient to display in a View.

Entities are never passed from the Interactor to the Presenter. Instead, simple data structures that have no behavior are passed from the Interactor to the Presenter. This prevents any “real work” from being done in the Presenter. The Presenter can only prepare the data for display in the View.

View
----

The View is passive. It waits for the Presenter to give it content to display; it never asks the Presenter for data. Methods defined for a View (e.g. LoginView for a login screen) should allow a Presenter to communicate at a higher level of abstraction, expressed in terms of its content and not how that content is to be displayed. The Presenter does not know about the existence of UILabel, UIButton, etc. The Presenter only knows about the content it maintains and when it should be displayed. It is up to the View to determine how the content is displayed.

The View is an abstract interface, defined in Objective-C with a protocol. A UIViewController, or one of its subclasses, will implement the View protocol. For example, a login screen might have:

Navigator
---------
Routing handles navigation from one screen to another as defined in the wireframes. A Wireframe object in responsible for routing. The Wireframe object owns the UIWindow, UINavigationController, etc. 

Since the Presenter contains the logic to react to user inputs, it is the Presenter that knows when to navigate to another screen.