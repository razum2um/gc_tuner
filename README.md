# GcTuner

[![Gem Version][GV img]][Gem Version]
[![Build Status][BS img]][Build Status]

Ruby 2.1 has an improved GC with more sophisticated settings params (remember oldschool's REE)

This gem is inspirated by

- [@2kan's slides](http://www.slideshare.net/2kan/gc-in-ruby-rubyc-kiev-2014)
- [@ko1's pdf](http://www.atdot.net/~ko1/activities/2014_rubyconf_ph_pub.pdf)
  See starting from 65'th slide

## Installation

Add my public key:

    gem cert --add <(curl -Ls https://raw.github.com/razum2um/gc_tuner/master/certs/razum2um.pem)

    $ gem install gc_tuner                 # without key
    $ gem install gc_tuner -P HighSecurity # secure, with key added

Or this line to your application's Gemfile:

    gem 'gc_tuner'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gc_tuner

## Usage

TODO: Write usage instructions here

## Further investigation

- MRI 2.1 allows you to track sourcelines of object allocation: see
  [allocation_stats gem](https://github.com/srawlins/allocation_stats)
  and [video intro](http://www.youtube.com/watch?v=ViUvz4FCDxg)

## Contributing

1. Fork it ( https://github.com/razum2um/gc_tuner/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[Gem Version]: https://rubygems.org/gems/gc_tuner
[Build Status]: https://travis-ci.org/razum2um/gc_tuner

[GV img]: https://badge.fury.io/rb/gc_tuner.png
[BS img]: https://travis-ci.org/razum2um/gc_tuner.png
