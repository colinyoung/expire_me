I have no clue what this library does.

# Pro Tip

To not have too many boilerplate commits (so you avoid ppl from thinking "WTF?
Why did he/she start with rspec but instantly switched to minitest, and what's
all that nonsense in the readme?") use `git commit --amend` to make changes in
the initial commit rather than creating new commits. Just saying.

# Usage

``` ruby
require 'expire_me'
fail("Dunno how to use %p" % ExpireMe)
```

# Installation

    gem install expire_me

# TODO

* Write code and documentation
* Fix project description in gemspec
* Change testing framework if necessary (see Rakefile, currently RSpec)
* Adjust expire_me.gemspec if your github name is not colinyoung
* Adjust License if your real name is not Colin Young
