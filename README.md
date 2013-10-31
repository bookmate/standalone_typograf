# StandaloneTypograf 3.0.0

[![Travis CI   ](https://api.travis-ci.org/shlima/standalone_typograf.png)      ](https://travis-ci.org/shlima/standalone_typograf)
[![Code Climate](https://codeclimate.com/github/shlima/standalone_typograf.png) ](https://codeclimate.com/github/shlima/standalone_typograf)
[![Gemnasium   ](https://gemnasium.com/shlima/standalone_typograf.png)          ](https://gemnasium.com/shlima/standalone_typograf)

In development

## Длинное тире
Значение | Заменяется
--- | ---
- | — 

```ruby
StandaloneTypograf::Typograf.new(text).processor(:dasherize)
```

## Мнемоники
Значение | Заменяется
--- | ---
(c) | ©
(tm) | ™
(r) | ®
+- | ±
-> | →
<- | ←
~= | ≈

```ruby
StandaloneTypograf::Typograf.new(text).processor(:mnemonics)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
