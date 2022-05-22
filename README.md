# Movies
This app shows a list of the most popular movies

# Scenarios

## Story - Online user
As an online user, I want the app to automatically load the updated list of the most popular movies, so I will know which are the most interesting movies. 

## Acceptance criteria
### #1
- Given a user with internet connectivity
- When the user requests to see the most popular movies
- Then the app should display the most popular movies
- And update the cache with the new movies

## Story - Offline user
As an offline user, I want the app to automatically load the cached popular movies, so I will always see the most interesting movies. 

### #1
- Given a user without internet connectivity
- And the cache is empty
- When the user requests to see the most popular movies
- Then the app should display an connectivity error

### #2
- Given a user without internet connectivity
- And the cache is NOT empty
- When the user requests to see the most popular movies
- Then the app should display the cached popular movies 

## Use cases
### Load the most popular movies from URL - Use Case
Data (Input): 
 - URL
 
Primary course (happy path): 
 1. Excecute command to load most popular movies with the provided URL
 2. System downloads data from the URL
 3. System validates URL data response
 4. System creates the Movie items from the response
 5. System delivers Movie items

Invalid response - Data error: 
 1. System delivers an error
 
No connectivity:
 1. System delivers an error

### Load the most popular movies from Cache - Use Case
Data (Input): 
 - None
 
Primary course (happy path): 
 1. Excecute command to fetch the most popular movies
 2. System fetches the cached data 
 3. System creates Movie items from cached data
 4. System delivers the cached Movie items

Invalid response - Data error: 
 1. System delivers an error
 
Empty cache:
 1. System delivers an empty cache error
 
### Save the most popular movies - Use Case
Data (Input): 
 - Most popular movies
 
Primary course (happy path): 
 1. Excecute command to save the most popular movies with the list of popular movies
 2. System encodes the list of items
 3. System timestamps the new items
 4. System replace the cache with the new data
 3. System delivers a success message

Operation fails: 
 1. System delivers an error

### Third part services 
This project uses the `The Movie Database` (`www.themoviedb.org`) services to get the movies information. 
