# Quiz

## Running app locally

1. Clone the repo and change into the directory:  
`$ git clone git@github.com:BenRoss92/quiz.git && cd quiz`
2. Install Bundler: `$ gem install bundler`
3. Install gems: `$ bundle`
4. *Optional: Add your own time limits, questions and options inside this spreadsheet - `/app/lib/question_list.csv`*
5. Run tests - To run back-end Ruby unit and feature tests, run `$ rspec`. To run front-end JavaScript unit tests, open the SpecRunner - `$ open spec/javascripts/SpecRunner.html`
6. Run the app - run `$ rackup` and visit http://localhost:9292/ in a browser

## Currently working on

- Rewriting JavaScript using OOP with unit and feature tests
- Rewriting AJAX to use internal API

## User stories

### Done

```
As a player,  
I want only one question to be displayed at a time  
so I can focus my attention.

As a player,  
I want to trigger the next question manually  
so I have time to recover from my grief or elation at the previous question.

As a quiz master,  
I want to provide a list of questions and answers in some sort of file format  
so I can prepare these offline.

As a quiz master,  
I want the ability to assign a different time limit to each question
so the player is kept on their toes.
```

### To Do

```
As a player,  
I want to see a timer displayed with each question  
so I can enjoy a heightened sense of tension.

As a player,  
when I submit an answer I want to know immediately if I was right or wrong  
so I have instant gratification.

As a player,  
if I submit an incorrect answer, I want to see the correct answer  
so I can kick myself later.

As a quiz master,  
I want to ensure the player can't find the answer by inspecting the page  
so that tech-savvy players can't cheat.

As a quiz master,  
I want to prevent the player from submitting an empty answer  
to encourage guessing.

As a quiz master,  
I want to prevent the player from moving to the next question until they have   submitted an answer or the time has run out  
to encourage the player not to give up.
```

## Other To-do's

- Integration testing of API using Rack::Test
- Incorporate headers into CSV file
- Add styling
