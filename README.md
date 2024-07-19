# Welcome to My GitHub Repository test
Hello and welcome to my GitHub repository!

Here, you'll find a collection of projects that I have developed throughout my career. These projects range from interview tasks to personal study exercises. Each project includes a detailed disclaimer and description to provide context and explain its purpose.

I hope you find these projects insightful and useful. If you have any questions or would like to connect, feel free to reach out to me via email at giovanni.cintra@hotmail.com or through my [LinkedIn profile](https://www.linkedin.com/in/giovannicintra/).

Thank you for visiting, and happy coding!

## Project 1
Task 1

You have city-level data about 4 online grocery stores SKUs (inventory, sales, waste). Based on the information there, please provide Commercial and Supply chain teams with relevant insights you extracted from the dataset. Also provide recommendations and hypotheses to validate further. 

Metrics definitions

* SKU - stock keeping unit. Examples: Banana, 1kg; President Cheese, 250 g
* Unique SKUs Listed - Total number of unique SKUs which were in active status and visible in the app.
* Unique SKUs Sold - Total number of unique SKUs which had at least 1 sold item within the period.
* Total of sold SKU items - Total number of all sold SKUs items within the period.
* Sales value before discount (EUR) - Total Sales value of all Sold SKUs items.
* User Discount Value (EUR) - Total discount value for sold SKUs items made for users.
* Total COGS for Sold items (EUR) - Total cost of purchase of all sold SKUs items from the suppliers.
* Waste, # of items - Total number of SKUs items written off due to expiration reasons.

Task 2

Using the following dataset, please answer the questions shown below. In the spreadsheet, use a different tab for each question and include all your calculations, graphs and formulas so we can understand your work. Questions are:

1. Do we have any seasonality in the countries shown?
2. Use your knowledge to predict with the available data, how many orders we will have in March 2020 in each country shown?
3. Please tell us any other valuable insight that you can extract from the data available and what would you do to solve it


## Project 2

Part 1 – Main 

The product owner wants to change the marketing strategy based on customers’ behavior.

1. We need to build a custom purchase funnel based on the tracking data, the funnel will 
show the customer journey from the moment of visiting the website, and viewing a 
product or listing, to the moment of purchase. The main marketing funnel steps you can
add or define yourself. Your main goal is to find details on every stage of the marketing 
funnel.
2. The achieved result must be fixed in metrics that, in your view, describe the user 
behavior on the site.
3. What additional data/information would you need to know the effectiveness of the 
current strategy?
4. The resulting analytical solution should show how the customer journey varies 
depending on what page_type was visited first in the session.

Deliverables: 
* The achieved result must be presented in form of a report/dashboard with any suitable 
BI tool. 
* Calculations are done in SQL or Python.
* The results of the analysis and the logic of the calculations should be presented to the 
product team informatively and to be understandable to the entire team, which 
includes technical and non-technical specialists.

Part 2 - SQL

1. Write an SQL query that will return a number of clients by day that:
    1. only viewed products in their first session;
    2. added only one product to the basket;
    3. placed an order within two days time after the first session.
  
2. Write a query that will return any abnormal (to our view) user behavior. Describe why 
the behavior is unusual.


## Project 3

Mobile Games: A/B Testing & Player Retention

This project is based on a mini project from Datacamp.

Cookie Cats is a hugely popular mobile puzzle game developed by Tactile Entertainment. It's a classic "connect three"-style puzzle game where the player must connect tiles of the same color to clear the board and win the level. It also features singing cats. Check out this short demo

As players progress through the levels of the game, they will occasionally encounter gates that force them to wait a non-trivial amount of time or make an in-app purchase to progress. In addition to driving in-app purchases, these gates serve the important purpose of giving players an enforced break from playing the game, hopefully resulting in that the player's enjoyment of the game being increased and prolonged.

But where should the gates be placed? Initially the first gate was placed at level 30. In this project, we're going to analyze an AB-test where we moved the first gate in Cookie Cats from level 30 to level 40. In particular, we will look at the impact on player retention.
