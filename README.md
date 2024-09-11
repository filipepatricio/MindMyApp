#  MindMyApp

## Architecture

### MVVM - Model View ViewModel

- Model representing the Data 
- View displays user interface
- ViewModel interacts as a bridge between View (user interactions) with the Model (changing the data) 

Basically the user interacts with the View -> sending an action to the ViewModel -> the ViewModel updates the data (Model) -> Model notify ViewModel about any change -> ViewModel changes the state of the View

 For notification handling it is used ObservableObject, @Published, @StateObject, @EnvironmentObject - 
 https://developer.apple.com/documentation/combine/observableobject
 https://developer.apple.com/documentation/combine/published
 https://developer.apple.com/documentation/swiftui/stateobject

## Project Structure

The project is organized with the following structure :
    
    - Services (Networking/Local Repositories)
    - Models (Data)
    - Core 
        - Feature 1
            - ViewModels 
            - Views
        - Feature 2
            - ViewModels
            - Views
        ...
    - Assets
    
This struct help us to organize ViewModels and View into different main features (e.g. Home, OrganizationDetail, etc.).

The project also depends from an external Package/Lib "MindMyLib" which is responsible for providing the external network api endpoint requests
