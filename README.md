# SocialSecurityNumber

This small Gem adds useful methods to your Ruby or Ruby on Rails app to validate for national identification numbers.

Find version information in the CHANGELOG.

## Suppoted countries and numbers:

* Belgium National Register Number (Rijksregisternummer)
* Canadian Social Insurance Numbers (SINs)
* Chinese Resident Identity Card Number
* Czech birth numbers
* Germany Steuer-IdNr
* Denmark Personal Identification Number (Det Centrale Personregister (CPR))
* Estonian Personal Identification Code (Isikukood (IK))
* Finland Personal Identity Code (Finnish: henkilötunnus (HETU))
* France INSEE code
* Ireland Personal Public Service Number (PPS No)
* Iceland personal and organisation identity code (Kennitala)
* Italy tax code for individuals (Codice fiscale)
* Latvian Personal Code (Personas kods)
* Lithuania Personal Code (Asmens kodas)
* Mexico Unique Population Registry Code (Clave Única de Registro de Población (CURP))
* Netherlands Citizen's Service Number (Burgerservicenummer)
* Norway birth number (Fødselsnummer)
* Pakistan computerised national identity card number (CNIC)
* Spain National Identity Document (Documento Nacional de Identidad (DNI)) number
* Sweden Personal Identity Number (Personnummer)
* Swiss social security numbers
* United Kingdom National Insurance number (NINO)
* United Kingdom National Health Service number
* United Kingdom CHI (Community Health Index) number
* U.S. Social Security number (SSN)
* U.S. Individual Taxpayer Identification Number (ITIN)
* U.S. Employer Identification Number (EIN)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'social_security_number'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install social_security_number

## Usage
The country_code should always be a ISO 3166-1 alpha-2 (http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2).
```ruby
# Options:
#   :number => Civil number.
#   :country_code => Some fallback code (eg. 'nl').
#   :birth_date => Birth date (eg. 'yyyy-mm-dd').
#   :gender => Gender (eg. 'famale').
```
Validations
```ruby
SocialSecurityNumber::Validator.new({number:'Some number', country_code:'nl'}).valid? # => true

SocialSecurityNumber::Validator.new({number:'Some number', country_code:'nl', birth_date: 'yyyy-mm-dd'}).valid? # => true

SocialSecurityNumber::Validator.new({number:'Some number', country_code:'nl'}) # => #<SocialSecurityNumber::Validator:0x000000021e2420 @civil_number="Some number", @country_code="NL", @birth_date=birth_date from civil number information, @gender=gender from civil number information>

civil_number = SocialSecurityNumber::Validator.new({number:'Some number', country_code:'nl'})
civil_number.valid? # => false
civil_number.error # => "birth date 1933-09-25 dont match 1933-09-24"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Don't forget to add tests and run rspec before creating a pull request :)

See all contributors on https://github.com/samesystem/social_security_number/graphs/contributors .

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SocialSecurityNumber project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/samesystem/social_security_number/blob/master/CODE_OF_CONDUCT.md).
