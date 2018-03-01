# ALPHA RUBY DOC

![lang](http://forthebadge.com/images/badges/made-with-ruby.svg) 
![fun](http://forthebadge.com/images/badges/powered-by-electricity.svg) 
![fun](http://forthebadge.com/images/badges/pretty-risque.svg)

[![Build Status](https://img.shields.io/travis/AlphaDaniel/ruby_doc.svg)](https://travis-ci.org/AlphaDaniel/ruby_doc)
[![Gem Version](https://img.shields.io/gem/v/ruby_doc.svg?&label=version&?&colorB=brightgreen)](https://rubygems.org/gems/ruby_doc)
[![Release Date](https://img.shields.io/github/release-date/AlphaDaniel/ruby_doc.svg)](https://github.com/AlphaDaniel/ruby_doc/releases)
[![Downloads](https://img.shields.io/gem/dt/ruby_doc.svg)](https://rubygems.org/gems/ruby_doc)
[![GitHub last commit](https://img.shields.io/github/last-commit/AlphaDaniel/alpha-ruby_doc.svg)](https://github.com/AlphaDaniel/alpha-ruby_doc/commits/master)
[![Changelog](https://img.shields.io/badge/change-log-blue.svg)](https://github.com/AlphaDaniel/alpha-ruby_doc/blob/master/changelog.md)
[![Site](https://img.shields.io/badge/Alpha-Coding-blue.svg?&colorB=0F80C0&?&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAIAAACQKrqGAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyFpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw%2FeHBhY2tldCBiZWdpbj0i77u%2FIiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8%2BIDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTQyIDc5LjE2MDkyNCwgMjAxNy8wNy8xMy0wMTowNjozOSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo4OUY5MDgyNzE4RjQxMUU4QjBCREE1NUVCQkYxMDJFMiIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo4OUY5MDgyODE4RjQxMUU4QjBCREE1NUVCQkYxMDJFMiI%2BIDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjg5RjkwODI1MThGNDExRThCMEJEQTU1RUJCRjEwMkUyIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjg5RjkwODI2MThGNDExRThCMEJEQTU1RUJCRjEwMkUyIi8%2BIDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY%2BIDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8%2BLUvNgAAAAkRJREFUeNocUFtP02AY7td%2BbVfoGFvHzmxjgzEOc0ETb0BvQCFMgfhzvPAQNPwSEm%2BJiTEBEhQvxDsUOQSyMoSxso2Vtmv7de3qp%2B%2FFk%2FfiyXMCoUg4Gk0kUtn00NDau9cHh8dvVt%2B7Tof39uuaYtlOQ6riZ3h0ggqHIwEh1BcIsiwTHBgYTCSqUj0UifC8j4a0CwDDsMg0EDLB3EKJ6%2B0LCIKnh%2Ff5fE3pcndnW2%2FrNMOEI7HceBFZmKafHv%2BGPV4%2F62Ep2tPLewkKbn7%2BdHEuEv%2FPdpyphzNewJuIR2mDHM3nUqlkUOj3%2B%2F33p4r3CgVMgpDCOJLLPV2YG5%2BcrNfrlfIZXH310nEcXddlVfv29Uuz2finZzsYGYo8Odjf3Nm9vhAtsw1xCWRZXaxEgoOf%2BxzHZTMZRVUASZ5Xzre3tm5bius62IeifcGjsnh1c%2BsCcrH0TPD3tzXVw3oUrT09PfN2dU2W78TymWkalAWAcqcCSBuW1ek4zdplRRQ1Q7%2BRpOdLK%2FmJQiQ%2BGIzG2qpG4kCQAkqrURHLDOFqqlqTpNOTE0AQeCbbtmVNjSXTC8svIM6k3MldlyiMhR8Ux%2FMjqXQ282F9HUJ6aXklGhZasrz365DDkt0O6iDD1NXF%2BVmG5apX1x83NnieJwgXWR3HcTOp5HAyjvfBxSDOWHr0OB6Nmggh2%2BF4H0lSXar9p9YIBEMcyxTH8s3WLbQMIxYfnJ19gveq3jRqij4zvzQgBE6PDve%2B%2F%2BjhPMPZNMuwtOv%2BFWAADfsWB%2FHBnC4AAAAASUVORK5CYII%3D)](http://a1phacoding.com/)

---
## A CLI Gem That Scrapes Ruby Documentation

<!--![image](https://images.huffingtonpost.com/2013-08-23-tumblr_m08celcrnT1r3isxuo1_500.gif)-->

**THE ULTIMATE RUBY DEVELOPER REFERENCING TOOL!**

**Alpha Ruby Doc** aims to make Ruby referencing quick and painless. This gem scrapes Ruby documentation and allows users to quickly reference Ruby classes, modules and methods all on your terminal in STYLE!

Features include Search by Name, Paginated Browsing, Full documentation including Syntax and Source Code, Save to Favorites, Source Links, Seamless Navigation, and more.

Have a query? **Run, Hunt, and Done**. Never lose momentum, keep all things in your line of sight, and get right back to coding!



---
## A Look Inside
[![forthebadge](http://forthebadge.com/images/badges/thats-how-they-get-you.svg)](http://forthebadge.com)

![image](https://i.imgur.com/qAW4sNY.gif)

---
### Features:
✓ Search for Ruby Documentation by Class, Module or Method Name

✓ Full documentation including description, syntax and source code!

✓ Save Docs to Favorites! for quick referencing

✓ Browse all Documentation (Paginated Output To Terminal)

✓ Source Links Provided

✓ Easy Navigation

✓ Random Dev Quotes (For fun and motivation) 


---

[![contributions welcome](https://img.shields.io/badge/Contributions%20/%20Feedback%20/%20Requests-welcome-blue.svg?style=flat)](https://github.com/AlphaDaniel/ruby_doc/issues)

---
### To do list:
* Multiple Doc sources
* Add Notes

---
## INSTALLATION

<img src="https://i.imgur.com/AeHWQj8.gif" alt="image" width="790" height="170" align="middle">

#### JUST KIDDING
[![forthebadge](http://forthebadge.com/images/badges/check-it-out.svg)](http://forthebadge.com)

---
#### For Your Application:

Add this line to your application's Gemfile

```ruby
 gem 'ruby_doc'
```

And then execute

     $ bundle

#### For Yourself:

     $ gem install ruby_doc


---
## USAGE

Once installed execute

     $ ruby_doc
    
To exit 

     $ exit!
    
To Learn More (From Main Menu)

     $ ?
     
To List Favorites (From Main Menu)

     $ *
    
---
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/AlphaDaniel/alpha-ruby_doc. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AlphaRefRuby project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ruby_doc/blob/master/CODE_OF_CONDUCT.md).



