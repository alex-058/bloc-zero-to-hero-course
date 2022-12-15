# hero_3_bloc_concepts

A new Flutter project.

## Here is document all the takeaways i gathered in the course

### Bloc Provider
Hooks the UI up with the bloc / cubit. 
Here we wrap the whole MaterialApp with the BlocProvider widget, which enables the state of CounterState for the whole application

### Bloc Builder
Receive new state in UI / update UI according to state change.
Wrap the UI element with this widget to be able to access the state. 
Magic component that builds the UI if new state is being emitted.
(we are the blocBuilder who are waiting for the boat)

### Bloc Listener
NEXT



