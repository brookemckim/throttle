# Throttle
Uses ipfw on Mac OSX to simulate slower connection speed. 

## Purpose
Many times I've found myself needing to test applications on slower connections. However, that is never an easy task. Throttle allows you to simulate a slower connection by allowing you to specify an exact bandwidth you would like to experience.

## Development
At the moment the code is REAAAAAAL ugly and needs much improvement. There are also a lot more features I would like to add. Mostly being able to specify source and destination ip:port so you can filter which traffic will be throttled. Also the ability to have multiple filters going at once. Right now you can only have one.

## Usage

### Prerequisites 

*  Mac OSX 10.5, 10.6, 10.7
*  ruby 1.8.7
*  rubygems

### Installation 

```
gem install throttle
```

### Getting Started
From the command line:

#### Start throttling

Limit traffic to 100 Kilobits per second
```
throttle limit 100Kbit/s
```

#### Current Status

List all current limits in place.

```
throttle status
```


#### Bandwidth

Bandwidth must be specified in [Kilo/Mega][bits/Bytes]/s.

*  500Kbp/s - 500 Kilobytes per second
*  1MBp/s   - 1 Megabyte per second

