# Changelog

## 0.1.4 (2018-06-17)

* Actually set `dummy_password` to `X` if it wasn't provided.
* Use wrap method instead of `Kernel#Array` since it behaves different than expected on a Hash.
* Use `Time::parse` instead of `Time#iso801` because Woodpecker API doesn't return a valid ISO8601 date.

## 0.1.3 (2018-05-17)

* Send `Content-Type: application/json` on POST requests to the API.

## 0.1.2 (2016-08-17)

### Changes

* Remove `require "pry"` from `lib/woodpecker.rb`. I should be kicked for that.

## 0.1.1 (2016-08-02)

### Changes

* `add_prospects_campaign` and `add_prospects_list` now use Kernel#Array so that users don't have to wrap single objects.

## 0.1.0 (2016-08-02)

* Initial release.
