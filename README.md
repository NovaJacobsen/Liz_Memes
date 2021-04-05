# Liz_Memes

## What the hell is this
This is an internal joke taken way too far.

The program creates random sentences from a configurable template (or templates)

## Installing
Clone the repo, install bundler and run `bundle install` in the project folder.

## Building standalone application
`bundle exec rake build` will create a windows executable in the `build` directory. This file can be run on a windows machine without ruby.

## Running
running the script by evoking `bundle exec rake run` will create a random sentence from the template.
the script takes a line of input before yielding control, to allow simply double clicking `liz.rb`.

## Config
Configuration is meant to be simple. `config.yml` must contain 2 top level keys
  - `structures:` is a list of possible structures.
    If no `part`s are defined each `structure` is esentially just a sentence that the app could produce.
	If a word in the structure is also defined as a `part`, a random value from that `part` is substituted in.
	When the program is run, it selects a random `structure` then expand all identified `part`s and returns that as a sentence
  - `parts:` for each key put under `part`s it signifies that if this word appears in a `structure` it is not to be taken
    as a literal word, but instead a token to be substituted with a different word (or words).
	Each element of parts should contain a list of replacement values from which to choose from.
	Every time a `structure` contains a word that is also a `part` a random option from that `part` is sampled
    `part`s are not recursively looking for other parts.
	
### Example configs
```
structures:
  - It's a beautiful day.
  - It's been a long week.
parts:  
```

In the example above, only two possible sentences exist. As there are no parts, whichever structure is selected will be printed as is.

```
structures:
  - It's a foo day.
  - It's been a foo week. BAR
parts:
  foo:
    - beautiful
	- long
  BAR:
    - Right?
	- 
```

In this example there are two templates. `foo` can be one of two options (Beautiful or Long), and `BAR` can be one of two options (Nothing or "Right?")
the full list of possible sentences for this config is

  - It's a long day.
  - It's a beautiful day.
  - It's been a long week.
  - It's been a beautiful week.
  - It's been a long week. Right?
  - It's been a beautiful week. Right?
  
Notice that 'parts' are case sensitive!

###