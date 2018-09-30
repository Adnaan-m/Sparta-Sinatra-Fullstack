# Sparta-Sinatra-Fullstack
The following ReadME describes information on how the creation process went to create a functional server-side/front-end web application. The use of Ruby and Sinatra were both used to create the database and link them to the website. Postgres allowed the database functionality and HTML/CSS provided the front end framework.

### Languages used
* Ruby - Sinatra
* SQL
* HTML
* CSS

### How to download
1. Search for Adnaan-m in GitHub. [Click Here](https://github.com/Adnaan-m/Sparta-Sinatra-Fullstack) for the link.
2. Search for the Sparta-Sinatra-Fullstack repository.
3. Download the files displayed.

### Challenges
1. This task was most difficult from all tasks given. The fact that the SQL statements would not merge well with the ruby side to display the correct information, made the task very frustrating. It took almost a day to realise what the bug was which also gave a relief on the latter followed by anger for not spotting the issue sooner. As it stood, the idea was to display country (table 1) information followed by the cities(table 2) within that country. However, both tables included a 'name' which was required at the time. As a result, even though SQL could relate the difference, the Ruby function to hydrate the fields could not. Sounds like a simple fix doesn't it? It was. 
2. The second issue was the matter of implying CSS and SASS. Eventhough the correct filepaths were provided on the script file, the changes to the web application would not commit.

### Learning points
1. The biggest learning point which has been identified previously but not taken in to account is the scope of looking at the bigger picture when focusing on a bug. 
2. It is understandable why alot of companies use Postgres, it is very functional and easy to use.