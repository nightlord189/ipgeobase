# Ipgeobase

Test project on Ruby profession on Hexlet.io.

Module that allows to extract metadata by IP-address:

```
ip_meta = Ipgeobase.lookup('8.8.8.8')
ip_meta.city # Ashburn
ip_meta.country # United States
ip_meta.countryCode # US
ip_meta.lat # 39.03
ip_meta.lon # -77.5
```

## Usage
```rake```