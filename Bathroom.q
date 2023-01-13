//This file was generated from (Academic) UPPAAL 4.1.26-1 (rev. 7BCF30B7363A9518), February 2022

/*
Checks that it holds that no more than 2 processes can be in the bathroom at the same time, nor can the semaphore get a negative value.
A negative value would mean that the P and V operations in the program is not working correctly, or is poorly implemented.
The query is expected to return true if the above holds.
*/
A[] ! (sem[1] < 0 || sem[1] > 2)

/*
There is at least one path that reaches a state where two processes has entered the bathroom and are using its resoruces.
The query is expected to return true since at max two processes are allowed in, and sem[1] == 0 implies that both resources are allocated and used.
*/
E<> (sem[1] == 0)

/*
Checks if it holds that if Erik enters the queue, he will eventually enter the bathroom. 
The query is expected to return true, but returns false. 
This is due to Uppaal not having a fair scheduler and Erik is not enforced\/garanteed to progress from the queue to the bathroom. 
That is, Erik could be stuck in the queue. 
*/
Erik.InQueue --> Erik.InBathroom

/*
Checks if it holds for all possible states, that Erik and Julia will never be within the bathroom queue concurrently.
The query is expected to return true, which proves that only one gender is allowed to queue for the bathroom at a time. 
*/
A[] !(Erik.InQueue && Julia.InQueue)

/*
Ensures that Erik and Julia cannot be inside their critical section at the same time, for any path. 
Expected to return true if mutual exclusion is certain, or false if Erik and Julia can be in the bathroom at the same time.
*/
A[] !(Erik.InBathroom && Julia.InBathroom)

/*
Ensure that there are no deadlocks for any path. Should always return true.
*/
A[] ! deadlock
