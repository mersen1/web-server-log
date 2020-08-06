# Description
Write a ruby script that:
 - Receives a log as argument (webserver.log is provided) e.g.: ./parser.rb webserver.log
- Returns the following:
  - list of webpages with most page views ordered from most pages views to less page views e.g.:<br />
    /home 90 visits /index 80 visits etc... 
  - list of webpages with most unique page views also ordered e.g.:<br />
    /about/2 8 unique views /index 5 unique views etc...

# Installation

Before running the script execute the command:

```sh
  bundle
```

# Usage

To receive the results of the program run `bin/parser`command with the file path.

```sh
  bin/parser webserver.log
```

# RSpec

To check specs run:

```sh
  rspec
```
# Possible Improvements

Add file validations: incorrect file format, missing file, invalid data structure.


# Approaches

To complete the test DDD and TDD approaches were used.

Repository Pattern was used to store line entities, Service Objects were used to handle entity data and Presenters were used to show results correctly. <br />
Also Template Method and Strategy patterns were used.
