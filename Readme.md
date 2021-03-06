![Ruby](https://github.com/dkremez/sp_ruby_app/workflows/Ruby/badge.svg?branch=master&event=push)
[![Coverage](https://dkremez.github.io/sp_ruby_app/badge.svg)](https://github.com/dkremez/sp_ruby_app)

# Ruby Developer Test

## How to run
1. `bundle install`
2. `./parser.rb webserver.log`

## Run tests
1. `bundle exec rspec`

## Final output

![Screen Shot 2020-04-05 at 3 26 33 PM](https://user-images.githubusercontent.com/4772270/78493964-f8e47700-7751-11ea-8a3d-fb16c9750ef4.png)

## Task description

Before you start coding (and let’s be honest, we know that’s what you want to do), please read the following.
- Firstly, the test should take you no more than 2.5 hours to complete.
- Secondly, the test is for us to see how you code and the methodologies you use, what we will be looking for in this test are the following:
    - Functionality
    - Efficiency – We like clean, simple code.
    - Readability
    - Tests (we have 96% test coverage in our code and we aim to keep it that way).
    - Also, we would like to understand your ability to use TDD and OO, so please ensure
these are part of your complete test. This is your chance to show us what you can do,
so use it to show us how you design and code!
    - Feel free to submit your solution as a link to your version control repository

The test is as follows:
1. ruby_app 

### Write a ruby script that:
a. Receives a log as argument (webserver.log is provided) e.g.: `./parser.rb webserver.log`
b. Returns the following:
> list of webpages with most page views ordered from most pages views to less page views e.g.:
```
/home 90 visits /index 80 visits 
```
> list of webpages with most unique page views also ordered e.g.:
```
/about/2 8 unique views /index 5 unique views
```

Finally, have some fun – Feel free to make changes or design something if you think it meets the criteria above, but would produce better outcomes and of course, the sooner you return the test, the quicker we can move the process.

