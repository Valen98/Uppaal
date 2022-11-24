//This file was generated from (Academic) UPPAAL 4.1.26-1 (rev. 7BCF30B7363A9518), February 2022

/*

*/
E<> not (sem[0] > 1 && sem[0]< 0)

/*

*/
A[] not (sem[0] > 1 && sem[0] < 0)

/*
Check if Julia can enter his CS
*/
Julia.Wait4CS --> Julia.InCS

/*
Check if Erik can enter his CS
*/
Erik.Wait4CS --> Erik.InCS

/*
Check if Erik and Julia cannot be inside the Critical Section at the same time
*/
E<> not (Erik.InCS && Julia.InCS)

/*
Check if there is a deadlock for all states.
*/
A[] ! deadlock
