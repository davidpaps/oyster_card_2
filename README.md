# Oystercard

Week 2 Afternoon Challenge at Makers. This was a collaborative exercise, pairing every day with a different member of the cohort. The objectives of the week were to continue to learn to test drive a object orientated program. It focused more on Unit tests, Mocking, Stubbing tests, and to break classes into several, abiding by the SRP and Encapsulation principals.

**The functionality of the app:**

The app built on last weeks project principles, this time mimicking the Oyster Card infastructure. A user can:

- Instantiate a new Oyster Card
- Top up the balance of the Oyster Card
- Tap in to a Station
- Tap out of a Station
- Error message if a user is trying to top up and the upper limit is exceeded
- Error message if trying to tap in to a station with insufficient credit
- A user can track their Journey History, balance, and if they are currently in a journey.
- A user can check if they are int he middle of a journey
- A penalty fare is given if a journey has not been finished before starting a new one

---

## How to Run

Clone this repo, and from the command line navigate to the [_oystercard_](OYSTERCARD). In the command line type:

```
irb
```

This will start the Ruby REPL. Then type the following:

```
require './lib/oystercard.rb'
```

This will require the files you need to instantiate new Oyster Card objects. This can be done by the following commands:

```
oystercard = New Oystercard
```

This will return a Hexadecimal number, indicating the creation of the new objects. You can then type in the following in the command line to action the objects accordingly:

```
oystercard.balance
oystercard.top_up(50)
oystercard.touch_in("Aldgate")
oystercard.touch_out("Liverpool Street")
oystercard.journey_log
oystercard.in_journey
```

---

To run the test suite (RSpec), in the command line type:

```
rspec
```

This will display 19 passing tests with 100% coverage.
