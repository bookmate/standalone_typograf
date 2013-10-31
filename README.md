# StandaloneTypograf 3

[![Travis CI   ](https://api.travis-ci.org/shlima/standalone_typograf.png)      ](https://travis-ci.org/shlima/standalone_typograf)
[![Code Climate](https://codeclimate.com/github/shlima/standalone_typograf.png) ](https://codeclimate.com/github/shlima/standalone_typograf)
[![Gemnasium   ](https://gemnasium.com/shlima/standalone_typograf.png)          ](https://gemnasium.com/shlima/standalone_typograf)

In development

## Использование

Создайте экземпляр типографа и передайте ему текст как единственный обязательный аргумент:

```ruby
@text = %Q( "Я "читал" стихи Быкова,- сказал он." (c) )
typograph = StandaloneTypograph::Typograph.new(@text)
typograph.prepare #=> «Я „читал“ стихи Быкова,— сказал он.» ©
```

По умолчанию типограф работает в режиме `utf`, если вам необходма подстановка html-кодов, передайте переметр `mode` со значением `html`

```ruby
@text = %Q( "Я "читал" стихи быкова,- сказал он." (c)" )
typograph = StandaloneTypograph::Typograph.new(@text, mode: :html)
typograph.prepare #=> &laquo;Я&nbsp;&bdquo;читал&ldquo; стихи Быкова,&mdash; сказал&nbsp;он.&raquo; &copy;
```

## Обработчики
### Длинное тире
Значение | Замена Utf | Замена Html
--- | --- | ---
- | &mdash; | \&mdash;

```ruby
StandaloneTypograf::Typograf.new(text).processor(:dashes)
```

### Неразрывные пробелы
Значение | Замена Utf | Замена Html
--- | --- | ---
- | &nbsp; | \&nbsp;

Неразрывные пробелы используются при отбивке длинного тире, одно-двухбуквенных слов и некоторых частиц.

```ruby
StandaloneTypograf::Typograf.new(text).processor(:nbspaces)
```

### Мнемоники
Значение | Замена Utf | Замена Html
--- | --- | ---
(c) | © | \&copy;
(tm) | ™ | \&trade;
(r) | ® | \&reg;
+- | ± | \&plusmn;
-> | → | \&rarr;
<- | ← | \&larr;
~= | ≈ | \&asymp;

```ruby
StandaloneTypograf::Typograf.new(text).processor(:mnemonics)
```

### Дроби
Значение | Замена Utf | Замена Html | Html код
--- | --- | --- | ---
1/1 | none | <sup>1</sup>&frasl;<sub>1</sub> | `<sup>1</sup>&frasl;<sub>1</sub>`
1234124/454325 | none | <sup>1234124</sup>&frasl;<sub>454325</sub> | `<sup>1234124</sup>&frasl;<sub>454325</sub>`

Типограф производит замену дробей только в режиме **html**, при этом он генерирует html код используя теги верхнего и нижнего индексов, вследствие чего, количество заменяемых дробей бесконечно.

```ruby
StandaloneTypograf::Typograf.new(text).processor(:fractions)
```

Чтобы отключить замену дробей используйте параметр `exclude` при инициализации

```ruby
StandaloneTypograf::Typograf.new(text, :exclude => :fractions)
```

### Многоточие
Значение | Замена Utf | Замена Html
--- | --- | ---
... | &hellip; | \&hellip;

```ruby
StandaloneTypograf::Typograf.new(text).processor(:ellipsis)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
