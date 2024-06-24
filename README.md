# user_record

A new Flutter User Record project.

## Getting Started

## Problem

Flutter app using clean architecture and BLoC (Cubit) for state management. 
Integrate user authentication, analytics, and crash reporting.

## Requirements

1. Platform: Develop the application for both Flutter web and mobile (iOS and
   Android).
2. Architecture: Use clean architecture and BLoC (Cubit) for state management.
3. API Integration: Use a free API from a service like JSONPlaceholder for demonstration purposes.
   Examples: https://jsonplaceholder.typicode.com/users
4. Pages:
   • List Page: Display a list of items retrieved from the API.
   • Detail Page: Display details of a selected item.
5. Authentication:
   • Implement Firebase Authentication (username and password).
   • Include functionality for logging out.
6. Analytics and Crash Reporting:
   • Use Firebase Analytics to track user engagement.
   • Implement Firebase Crashlytics for crash reporting (mobile only).
7. Code Repository:
   • Upload the complete project to a public GitHub repository and share the link.

## Steps

1. Project Setup:
   • Create a new Flutter project.
   • Set up Firebase for both web and mobile.
2. API Integration:
   • Integrate the JSONPlaceholder API to fetch a list of items and details. 
   • Use Dio for HTTP requests.
   • Create an interceptor to share the timing and user id to firebase analytics post or pre call.
3. Authentication:
   • Set up Firebase Authentication for username and password.
   • Implement login and logout functionalities.
4. State Management:
   • Use BLoC (Cubit) for managing the state of the application.
5. UI Implementation:
   • List Page: Display a list of items retrieved from the API. Each item should be tappable to navigate to the detail page.
   • Detail Page: Display detailed information about the selected item.
   • Login Page: Allow users to log in with their username and password.
   • Logout Functionality: Provide a way for users to log out from the application. 
6. Analytics and Crash Reporting:
   • Integrate Firebase Analytics to track user interactions.
   • Set up Firebase Crashlytics for crash reporting (mobile only). 
7. Code Quality:
   • Ensure the code follows clean architecture principles.
   • Write unit tests for the business logic.
   • Document the code appropriately.

## Deliverables

1. A public GitHub repository containing the complete Flutter project.
2. A README file with:
   • Instructions on how to set up and run the project.
   • An overview of the project's structure and architecture.
   • Notes on any assumptions or design decisions made.

## Evaluation Criteria
1. Code Quality: Clean, maintainable, and well-documented code. 
2. Architecture: Proper implementation of clean architecture and BLoC (Cubit). 
3. Functionality: Working authentication, API integration, and navigation. 
4. User Experience: Smooth and intuitive user interface. 
5. Testing: Adequate unit tests for business logic.

## Additional Notes
• Ensure that the application is responsive and works seamlessly on both web and mobile platforms.
• Pay attention to error handling, especially for network requests and authentication.
• Use environment variables to manage API keys and other sensitive information securely.

This test is designed to assess both your technical skills and your ability to deliver a
functional and maintainable Flutter application. Good luck!