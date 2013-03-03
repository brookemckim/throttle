# Throttle
Uses ipfw on OSX to simulate slower connection speed. 

## Purpose
Throttle enables the simulation of a slower connection by allowing you to specify an exact bandwidth you would like to experience.

## Usage

### Prerequisites 

*  Mac OSX 10.5, 10.6, 10.7

### Installation 

```bash
gem install throttle
```

### Getting Started
From the command line:

#### Start throttling

Limit traffic to 100 Kilobits per second

```bash
throttle limit 100Kbps
```

#### Current Status

List all current limits in place.

```bash
throttle status
```

#### Remove all limits

```bash
throttle reset
```


#### Bandwidth

Bandwidth must be specified in [Kilo/Mega][bits/Bytes]/s.

*  500Kbps - 500 Kilobits per second
*  1MBps  - 1 Megabyte per second

IPFW doesn't allow bandwidth greater than 268 MBps.

