# slash_task

This is a completed task for internship program from SLASH INFO.


## Setup Instructions

To set up and run the project, follow these steps:

1. **Ensure you have a stable internet connection**: This is necessary because the project relies on several packages that need to be downloaded from the internet.

2. **Clone the repository**:
    ```sh
    git clone <repository_url>
    ```

3. **Navigate to the project directory**:
    ```sh
    cd <project_directory>
    ```

4. **Install the required packages**:
    ```sh
    flutter pub get
    ```

5. **Run the application**:
    ```sh
    flutter run
    ```

Make sure to follow these instructions carefully to set up and run the project successfully.

## Architecture

This project follows the Clean Architecture and MVVM (Model-View-ViewModel) design patterns. The main layers are:

- **Data Layer**: Contains the data models and repository classes.
  - `lib/data/models/`: Data models used in the application.
  - `lib/data/repo/`: Repository classes that handle data operations.

- **Domain Layer**: Contains the business logic.
  - `lib/domain/entities/`: Entity classes that define the core data structures.
  - `lib/domain/usecases/`: Use case classes that encapsulate business logic.

- **Presentation Layer**: Contains the UI and state management classes.
  - `lib/presentation/bloc/`: BLoC (Business Logic Component) classes for state management.
  - `lib/presentation/views/`: UI components, organized into screens and widgets.
    - `lib/presentation/views/screens/`: Individual screens of the application.
    - `lib/presentation/views/widgets/`: Reusable UI components.

The `main.dart` file serves as the entry point of the application.
