Arrival::API
---
Backend API that allows for GEO queries against list of stations and returns a set of CTA train and bus (soon!) arrival times.

## Installation
TODO: You're going to need mongo, gdal, and ruby 2.1

## Usage

```BASH
rake db:seed
rake db:indexes:create
rackup
```

```curl "localhost:9292/v1/stations?lat=41.9234183&lng=-87.7021779&buffer=1000"```

```JSON
[
    {
        "route": "Blue",
        "station": "California",
        "destination": "O'Hare",
        "arrival_time": "2014-05-17T15:33:58-05:00"
    },
    {
        "route": "Blue",
        "station": "California",
        "destination": "O'Hare",
        "arrival_time": "2014-05-17T15:41:49-05:00"
    },
    {
        "route": "Blue",
        "station": "California",
        "destination": "Forest Park",
        "arrival_time": "2014-05-17T15:41:58-05:00"
    },
    {
        "route": "Blue",
        "station": "Logan Square",
        "destination": "O'Hare",
        "arrival_time": "2014-05-17T15:35:58-05:00"
    },
    {
        "route": "Blue",
        "station": "Logan Square",
        "destination": "Forest Park",
        "arrival_time": "2014-05-17T15:37:58-05:00"
    },
    {
        "route": "Blue",
        "station": "Logan Square",
        "destination": "O'Hare",
        "arrival_time": "2014-05-17T15:44:49-05:00"
    }
]
```

## Contributing

1. Fork it ( https://github.com/ebenoist/arrival-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
