Ch 0) About me
  * Work at Frame.io
    - At Frame.io, we’re powering the future of creative collaboration. Over
      500,000 video professionals use Frame.io to seamlessly share media and
      gather timestamped feedback from team members and clients. Simply put, we
      help companies create better video, together.
  * monkeypatchr on twitter and instagram... elijahkim on github
  * Been writing elixir for about 3 years
  * Terrible stage fright / Never spoke at a conference before / Crazy amounts
    of imposter syndrome / I'm about to do some live coding.
    Good luck to all of you.

Ch 1) What is an event bus?
  * https://github.com/google/guava/wiki/EventBusExplained
  * http://www.rribbit.org/eventbus.html

  * EventBus allows publish-subscribe-style communication between components
    without requiring the components to explicitly register with one another
    (and thus be aware of each other).
  * For some reason my research is all Java stuff? Why do they like event
    busses so much?

  * Example:
  Traffic Intersection:

  At a major traffic intersection you can think of the traffic light as an
  eventbus and the cars waiting as the consumers.

  The lights are events getting passed to the cars.

  The cars don't necessarily have to know about each other and depend on the
  traffic light as the source of truth.

  * Jargon:
  EventBus -- The object responsible for passing messages and receiving
  messages to fire off.
  Message -- Any object that may be posted to the bus.
  Consumer, Listener, Subscriber, Component -- The object that wants to
  receive events.
  Posting -- The sending of an event from the event bus to
  its consumers.

Ch 2) Why use an event bus?
  * Pros and Cons of using an event bus
    Pros
      - Logic for a particular side effect is isolated
      - It isolates errors
      - Bringing up a new consumer is extremely easy

    Cons
      - Integration testing can be difficult
      - Deployment could be harder
      - Have to worry about dropped messages

Ch 3) Build a simple event bus
  *REQUIREMENTS*
  1) Subscribe to event bus
  2) Notify event to the event bus
  3) Broadcast events
  4) Don't overload consumers

  1) Simple single process based event bus
  2) Same thing with `Task.async_stream`
  3) Using `Flow`

Ch 4) How it's going for us
  * How we use it
    - Webhooks case study
    - Segment Batcher
    - Auditing
  * Extending it
    - Persistence Layer
    - Retry Layer
    - Channels
  * Metrics










# Simple bus

```
Benchmarking basic_bus...

Name                ips        average  deviation         median         99th %
basic_bus       0.00990       1.68 min     ±0.00%       1.68 min       1.68 min
```

# Task.async_stream

```
Benchmarking basic_bus...

Name                ips        average  deviation         median         99th %
basic_bus        0.0495        20.20 s     ±0.00%        20.20 s        20.20 s
```

# GenStage

```
Benchmarking basic_bus...

Name                ips        average  deviation         median         99th %
basic_bus        0.0990        10.10 s   ±223.52%      0.00392 s        50.49 s
```
