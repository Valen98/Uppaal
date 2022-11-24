//This file was generated from (Academic) UPPAAL 4.1.26-1 (rev. 7BCF30B7363A9518), February 2022

/*
Ensure that none of the counter's value can exceed the total number of seats.
*/
E<> ! (nm > 2 || nf > 2)

/*
Checks that both seats will be in use at some point, for any path.
*/
E<> (sem[1] == 2)

/*
Ensures that Erik and Charlie can be in the queue simultaneously.
*/
E<> (Erik.InQueue && Charlie.InQueue)

/*
Ensures that Erik and Julia cannot be queue simultaneously, since they have different genders.
*/
E<> not (Erik.InQueue && Julia.InQueue)

/*
Ensure that Erik and Julia cannot be inside their critical section (use the bathroom) at the same time, for any path.
*/
E<> not (Erik.InBathroom && Julia.InBathroom)

/*
Ensure that Erik and Charlie can use the bathroom simultaneously.
*/
E<> (Erik.InBathroom && Charlie.InBathroom)

/*
Ensure that there are no deadlocks for any path.
*/
A[] ! deadlock
