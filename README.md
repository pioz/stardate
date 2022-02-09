# Stardate

Calculates the Star Trek stardate and vice versa (Star Trek: The Next
Generation convention).

## Installation

Add this line to your application's Gemfile:

    gem 'ruby-stardate'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-stardate

## Usage

    2.0.0-p247 :001 > require 'stardate'
     => true

    2.0.0-p247 :005 > t = Time.now + 400.years
     => 2413-11-26 18:35:34 +0100
    2.0.0-p247 :006 > t.to_stardate
     => 90902.9

    2.0.0-p247 :007 > 1513.1.to_time
     => 2324-07-06 10:44:32 +0200

### Change the base date

The default base date is `2323-1-1 = 0.0`. You can switch to the other standard
base date `2005-1-1 = 58000.0` with

```ruby
  Stardate.set_base_date_to_2005
```

and switch back with

```ruby
  Stardate.set_base_date_to_2323
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
