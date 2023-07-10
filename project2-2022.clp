; CLIPS PROJECT
; 1. Name: Nikolaos Papageroudis AEM: 2918
; CLIPS version: 6.31
; The indicative ontology model-based-diagnosis was used.
; Changes were made to "model-based-diagnosis.pont" and "model-based-diagnosis.pins".
; according to the instructions and then merged into file 2918-3251.clp
; The only change made that is not mentioned in the instructions, from the beginning of the code
; up to the point where the rules begin, is the addition of the command (pattern-match reactive)
; in the classes: command, sensor, internal-component, command_data, reading_data

(defclass systemEntity
	(is-a USER)
	(role abstract)
	(single-slot suspect
		(type SYMBOL)
		(allowed-values yes no)
		(default no)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot out
		(type INTEGER)
		(range 0 31)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass command
	(is-a systemEntity)
	(pattern-match reactive)
	(role concrete))

(defclass component
	(is-a systemEntity)
	(role abstract))

(defclass sensor
	(is-a component)
	(pattern-match reactive)
	(role concrete)
	(single-slot theoretical
		(type INTEGER)
		(range 0 31)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot out
		(type INTEGER)
		(range 0 31)
;+		(cardinality 0 0)
		(create-accessor read-write))
	(single-slot reading
		(type INTEGER)
		(range 0 31)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot input
		(type INSTANCE)
		(allowed-classes internal-component)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass internal-component
	(is-a component)
	(pattern-match reactive)
	(role concrete)
	(single-slot short-out
		(type INTEGER)
		(range 0 0)
		(default 0)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot output
		(type INSTANCE)
		(allowed-classes component)
		(create-accessor read-write))
	(single-slot msb-out
		(type INTEGER)
		(range 0 15)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot input2
		(type INSTANCE)
		(allowed-classes systemEntity)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot input1
		(type INSTANCE)
		(allowed-classes systemEntity)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass adder
	(is-a internal-component)
	(role concrete))
	

(defclass multiplier
	(is-a internal-component)
	(role concrete))


(defclass circuit
	(is-a systemEntity)
	(role concrete)
	(multislot outputs
		(type INSTANCE)
		(allowed-classes sensor)
		(create-accessor read-write))
	(multislot has-components
		(type INSTANCE)
		(allowed-classes component)
		(create-accessor read-write))
	(multislot inputs
		(type INSTANCE)
		(allowed-classes command)
		(create-accessor read-write)))

(defclass data
	(is-a USER)
	(role abstract)
	(single-slot clock
		(type INTEGER)
		(range 1 ?VARIABLE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot object
		(type INSTANCE)
		(allowed-classes systemEntity)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot value
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass command_data
	(is-a data)
	(pattern-match reactive)
	(role concrete)
	(single-slot object
		(type INSTANCE)
		(allowed-classes command)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass reading_data
	(is-a data)
	(pattern-match reactive)
	(role concrete)
	(single-slot object
		(type INSTANCE)
		(allowed-classes sensor)
;+		(cardinality 0 1)
		(create-accessor read-write)))
		
(definstances facts
([a1] of  adder

	(input1 [input_1])
	(input2 [input_1])
	(output
		[m1]
		[p1])
	(short-out 0)
	(suspect no))

([a2] of  adder

	(input1 [p1])
	(input2 [p2])
	(output [out1])
	(short-out 0)
	(suspect no))

([circuit_1] of  circuit

	(has-components
		[m1]
		[m2]
		[m3]
		[out1]
		[a1]
		[a2]
		[p1]
		[p2])
	(inputs
		[input_1]
		[input_2]
		[input_3]
		[input_4])
	(outputs [out1])
	(suspect no))

([command_10_inp1] of  command_data

	(clock 10)
	(object [input_1])
	(value 6))

([command_10_inp2] of  command_data

	(clock 10)
	(object [input_2])
	(value 4))

([command_10_inp3] of  command_data

	(clock 10)
	(object [input_3])
	(value 25))

([command_10_inp4] of  command_data

	(clock 10)
	(object [input_4])
	(value 12))

([command_1_inp1] of  command_data

	(clock 1)
	(object [input_1])
	(value 21))

([command_1_inp2] of  command_data

	(clock 1)
	(object [input_2])
	(value 28))

([command_1_inp3] of  command_data

	(clock 1)
	(object [input_3])
	(value 10))

([command_1_inp4] of  command_data

	(clock 1)
	(object [input_4])
	(value 25))

([command_2_inp1] of  command_data

	(clock 2)
	(object [input_1])
	(value 7))

([command_2_inp2] of  command_data

	(clock 2)
	(object [input_2])
	(value 25))

([command_2_inp3] of  command_data

	(clock 2)
	(object [input_3])
	(value 13))

([command_2_inp4] of  command_data

	(clock 2)
	(object [input_4])
	(value 15))

([command_3_inp1] of  command_data

	(clock 3)
	(object [input_1])
	(value 11))

([command_3_inp2] of  command_data

	(clock 3)
	(object [input_2])
	(value 17))

([command_3_inp3] of  command_data

	(clock 3)
	(object [input_3])
	(value 24))

([command_3_inp4] of  command_data

	(clock 3)
	(object [input_4])
	(value 31))

([command_4_inp1] of  command_data

	(clock 4)
	(object [input_1])
	(value 18))

([command_4_inp2] of  command_data

	(clock 4)
	(object [input_2])
	(value 11))

([command_4_inp3] of  command_data

	(clock 4)
	(object [input_3])
	(value 28))

([command_4_inp4] of  command_data

	(clock 4)
	(object [input_4])
	(value 21))

([command_5_inp1] of  command_data

	(clock 5)
	(object [input_1])
	(value 25))

([command_5_inp2] of  command_data

	(clock 5)
	(object [input_2])
	(value 24))

([command_5_inp3] of  command_data

	(clock 5)
	(object [input_3])
	(value 30))

([command_5_inp4] of  command_data

	(clock 5)
	(object [input_4])
	(value 10))

([command_6_inp1] of  command_data

	(clock 6)
	(object [input_1])
	(value 12))

([command_6_inp2] of  command_data

	(clock 6)
	(object [input_2])
	(value 19))

([command_6_inp3] of  command_data

	(clock 6)
	(object [input_3])
	(value 11))

([command_6_inp4] of  command_data

	(clock 6)
	(object [input_4])
	(value 19))

([command_7_inp1] of  command_data

	(clock 7)
	(object [input_1])
	(value 1))

([command_7_inp2] of  command_data

	(clock 7)
	(object [input_2])
	(value 31))

([command_7_inp3] of  command_data

	(clock 7)
	(object [input_3])
	(value 7))

([command_7_inp4] of  command_data

	(clock 7)
	(object [input_4])
	(value 22))

([command_8_inp1] of  command_data

	(clock 8)
	(object [input_1])
	(value 0))

([command_8_inp2] of  command_data

	(clock 8)
	(object [input_2])
	(value 31))

([command_8_inp3] of  command_data

	(clock 8)
	(object [input_3])
	(value 3))

([command_8_inp4] of  command_data

	(clock 8)
	(object [input_4])
	(value 23))

([command_9_inp1] of  command_data

	(clock 9)
	(object [input_1])
	(value 31))

([command_9_inp2] of  command_data

	(clock 9)
	(object [input_2])
	(value 1))

([command_9_inp3] of  command_data

	(clock 9)
	(object [input_3])
	(value 6))

([command_9_inp4] of  command_data

	(clock 9)
	(object [input_4])
	(value 8))

([input_1] of  command

	(suspect no))

([input_2] of  command

	(suspect no))

([input_3] of  command

	(suspect no))

([input_4] of  command

	(suspect no))

([m1] of  sensor

	(input [a1])
	(suspect no))

([m2] of  sensor

	(input [p1])
	(suspect no))

([m3] of  sensor

	(input [p2])
	(suspect no))

([out1] of  sensor

	(input [a2])
	(suspect no))

([p1] of  multiplier

	(input1 [input_2])
	(input2 [a1])
	(output
		[m2]
		[a2])
	(short-out 0)
	(suspect no))

([p2] of  multiplier

	(input1 [input_3])
	(input2 [input_4])
	(output
		[m3]
		[a2])
	(short-out 0)
	(suspect no))

([reading_10_m1] of  reading_data

	(clock 10)
	(object [m1])
	(value 12))

([reading_10_m2] of  reading_data

	(clock 10)
	(object [m2])
	(value 31))

([reading_10_m3] of  reading_data

	(clock 10)
	(object [m3])
	(value 12))

([reading_10_out] of  reading_data

	(clock 10)
	(object [out1])
	(value 28))

([reading_1_m1] of  reading_data

	(clock 1)
	(object [m1])
	(value 10))

([reading_1_m2] of  reading_data

	(clock 1)
	(object [m2])
	(value 24))

([reading_1_m3] of  reading_data

	(clock 1)
	(object [m3])
	(value 26))

([reading_1_out] of  reading_data

	(clock 1)
	(object [out1])
	(value 18))

([reading_2_m1] of  reading_data

	(clock 2)
	(object [m1])
	(value 0))

([reading_2_m2] of  reading_data

	(clock 2)
	(object [m2])
	(value 0))

([reading_2_m3] of  reading_data

	(clock 2)
	(object [m3])
	(value 3))

([reading_2_out] of  reading_data

	(clock 2)
	(object [out1])
	(value 3))

([reading_3_m1] of  reading_data

	(clock 3)
	(object [m1])
	(value 22))

([reading_3_m2] of  reading_data

	(clock 3)
	(object [m2])
	(value 6))

([reading_3_m3] of  reading_data

	(clock 3)
	(object [m3])
	(value 8))

([reading_3_out] of  reading_data

	(clock 3)
	(object [out1])
	(value 14))

([reading_4_m1] of  reading_data

	(clock 4)
	(object [m1])
	(value 4))

([reading_4_m2] of  reading_data

	(clock 4)
	(object [m2])
	(value 12))

([reading_4_m3] of  reading_data

	(clock 4)
	(object [m3])
	(value 12))

([reading_4_out] of  reading_data

	(clock 4)
	(object [out1])
	(value 0))

([reading_5_m1] of  reading_data

	(clock 5)
	(object [m1])
	(value 18))

([reading_5_m2] of  reading_data

	(clock 5)
	(object [m2])
	(value 16))

([reading_5_m3] of  reading_data

	(clock 5)
	(object [m3])
	(value 12))

([reading_5_out] of  reading_data

	(clock 5)
	(object [out1])
	(value 12))

([reading_6_m1] of  reading_data

	(clock 6)
	(object [m1])
	(value 8))

([reading_6_m2] of  reading_data

	(clock 6)
	(object [m2])
	(value 24))

([reading_6_m3] of  reading_data

	(clock 6)
	(object [m3])
	(value 17))

([reading_6_out] of  reading_data

	(clock 6)
	(object [out1])
	(value 9))

([reading_7_m1] of  reading_data

	(clock 7)
	(object [m1])
	(value 2))

([reading_7_m2] of  reading_data

	(clock 7)
	(object [m2])
	(value 0))

([reading_7_m3] of  reading_data

	(clock 7)
	(object [m3])
	(value 26))

([reading_7_out] of  reading_data

	(clock 7)
	(object [out1])
	(value 26))

([reading_8_m1] of  reading_data

	(clock 8)
	(object [m1])
	(value 0))

([reading_8_m2] of  reading_data

	(clock 8)
	(object [m2])
	(value 0))

([reading_8_m3] of  reading_data

	(clock 8)
	(object [m3])
	(value 0))

([reading_8_out] of  reading_data

	(clock 8)
	(object [out1])
	(value 0))

([reading_9_m1] of  reading_data

	(clock 9)
	(object [m1])
	(value 30))

([reading_9_m2] of  reading_data

	(clock 9)
	(object [m2])
	(value 30))

([reading_9_m3] of  reading_data

	(clock 9)
	(object [m3])
	(value 0))

([reading_9_out] of  reading_data

	(clock 9)
	(object [out1])
	(value 30))

)

;====================================================================================================================
;Rules principle


    
; The initial facts of the program are defined. 
; The execution strategy is defined as "mea"
; The time is set to 1
(deffacts ini "initial facts"
	(goal bind-values)
	(set strategy mea)
	(time 1)
)


; The out values of each input are defined for time = ?t
; the value value of [command_1_inp1] is assigned to the out value of [input_1]
; the value value of [command_1_inp2] is assigned to the out value of [input_2]
; ... and so on.
(defrule bind-input-values "set out value of inputs"
	?x <- (goal bind-values)
	(time ?t)
	(object (is-a command_data) (clock ?t) (object ?input) (value ?value))
 =>
	(modify-instance ?input (out ?value))
	
	(printout t "Bind input value " ?input " -> " ?value crlf)
)

; The reading values of each sensor are defined for the time instant time = ?t
; the value value of [reading_1_m1] is assigned to the out value of [m1]
; the value value of [reading_1_m2] is assigned to the out value of [m2]
; ... and so on.
(defrule bind-sensor-values "set reading value of sensors"
	?x <- (goal bind-values)
	(time ?t)
	(object (is-a reading_data) (clock ?t) (object ?sensor) (value ?value))
 =>
	(modify-instance ?sensor (reading ?value))
	
	(printout t "Bind sensor value " ?sensor " -> " ?value crlf)
)

; When the assignment of values is finished the (goal bind-values)
; from the fact list and (goal calc-output) is entered to execute
; the rule for calculating the values of the adders/multipliers
(defrule change-goal-to-calc-output "change goal from bind-values to calc-output"
	?x <- (goal bind-values)
 =>
  	(retract ?x)
  	(assert (goal calc-output))
)


; Calculation of out and msb-out values for each adder/multiplier
; The adder a1 has 2 inputs, ?input1 and ?input2
; ?input1 and ?input2 each have an out value ?value1 and ?value2 respectively, 
; set in bind-input-values
; the out value of a1 is defined as mod( (value1 + value2), 2^5) 
; the msb-out value of a1 is defined as mod( (value1 + value2), 2^4) 
; The same procedure is followed for the other components (p1, p2, a2)
; except that for p1 and p2 multiplication is used instead of addition
(defrule calc-outputs "calculate out and msb-out (missing bit out) value for every component"
	?x <- (goal calc-output)
   	(object (is-a ?component_type) (name ?component_name) (input1 ?input1) (input2 ?input2) )
  	(object (name ?input1) (out ?value1))
  	(object (name ?input2) (out ?value2))
 =>
 	; If the component is a multiplier
	(if (eq ?component_type multiplier)
	then
	;mod( (value1 * value2), 2^5) 
	(modify-instance ?component_name (out (mod (* ?value1 ?value2) 32)))
	;mod( (value1 * value2), 2^4) 
	(modify-instance ?component_name (msb-out (mod (* ?value1 ?value2) 16)))
	
	else ; Otherwise the component is a summator
	;mod( (value1 + value2), 2^5) 
    	(modify-instance ?component_name (out (mod (+ ?value1 ?value2) 32)))
	;mod( (value1 + value2), 2^4) 
	(modify-instance ?component_name (msb-out (mod (+ ?value1 ?value2) 16)))
	)	
	
	(printout t "Calculated 'out' value of " ?component_type " " ?component_name " -> " (send ?component_name get-out) crlf)
	(printout t "Calculated 'msb-out' value of " ?component_type " " ?component_name " -> " (send ?component_name get-msb-out) crlf)
)

; When the calculation of the out and msb-out of each component is finished
; the (goal calc-output) is output from the fact list 
; and the (goal insert-component-out-to-sensor-out) is entered to execute
; the rule for assigning the out values of each component to the out of
; corresponding sensor connected
(defrule change-goal-to-insert-component-out-to-sensor-out "change goal from calc-output to insert-component-out-to-sensor-out"
	?x <- (goal calc-output)
 =>
	(retract ?x)
	(assert (goal insert-component-out-to-sensor-out))
)

; Assign the out value of each component to the sensor 
; to which it is connected.
; The out value of a1 is ?value. a1 is connected to m1
; the out value of m1 becomes ?value.
; ... and so on for each component-sensor
(defrule insert-component-out-to-sensor-out "insert the out of component to the connected sensor"
	?x <- (goal insert-component-out-to-sensor-out)
	(object (is-a sensor) (name ?sensor) (input ?component))
	(object (name ?component) (out ?value))
 =>
	(modify-instance ?sensor (out ?value))
	
	(printout t "Insterted 'out' value from " ?component " to sensor " ?sensor " -> " ?value crlf)
)

; When the value out from the component to the sensor is finished 
; the (goal insert-component-out-to-sensor-out) is exited from the fact list 
; and (find-discrepancy) is entered to execute
; the rule which checks if there is a discrepancy
(defrule change-goal-to-check-discrepancy "change goal from insert-component-out-to-sensor-out to find-discrepancy"
	?x <- (goal insert-component-out-to-sensor-out)
=>
	(retract ?x)
	(assert (goal find-discrepancy))
)

; Checks if there is a sensor where the reading value differs from the out
; i.e. if the reading value assigned to bind-sensor-values is different from
; the out value assigned to insert-component-out-to-sensor-out
; in case of a discrepancy the suspect value is changed from no to yes 
;in the sensor and in the corresponding component to which it is bound
; the (goal find-discrepancy) is output
; and (goal print-type-of-error) is entered to print the error type
(defrule find-discrepancies "check for discrepancies"
	?x <- (goal find-discrepancy)
	(object (is-a sensor) (name ?sensor) (reading ?read) (out ~?read) (input ?internal_component))

 =>
	(modify-instance ?sensor (suspect yes))
	(modify-instance ?internal_component (suspect yes))
	(retract ?x)
	(assert (goal print-type-of-error))
	
	(printout t "Discrepancy detected. Suspects: " ?sensor ", " ?internal_component crlf)
)

; If no discrepancy is found then the corresponding message is printed 
; The (goal find-discrepancy) is output
; and (goal next-round) is entered to change the value t 
; and restart a new round of rule execution for time=time+1
(defrule no-discrepancies "if there are no discrepancies"
	?x <- (goal find-discrepancy)
	(time ?t)
 =>
 	(printout t "No Discrepancy Detected" crlf)
	(printout t "Time: " ?t " ----> Normal Operation!" crlf)
	(retract ?x)
	(assert (goal next-round))
)

; If the reading value of the suspect sensor is 0
; then there is a fault in the component and
; the corresponding message is printed.

(defrule comp-short-cirquit "if sensor's reading value is equal to 0"
	?x <- (goal print-type-of-error)
	(time ?t)
	(object (is-a sensor) (reading 0) (input ?component) (suspect yes))
	(object (is-a ?type_of_component) (name ?component))

=>
	(printout t "Time: " ?t " --> " ?type_of_component " " (instance-name-to-symbol ?component) " error: Short-cirquit!" crlf)
)

; If the reading value of the suspect sensor is
; is equal to the msb-out value of the suspect component
; then there is a fault in the component and
; the corresponding message is printed.
(defrule comp-most-sign-bit-off "if sensor's reading value is equal to component's msb-out value"
	?x <- (goal print-type-of-error)
	(time ?t)
	(object (is-a sensor) (reading ?sensor_input_value) (input ?component) (suspect yes))
	(object (is-a ?type_of_component) (name ?component) (msb-out ?sensor_input_value))

=>
	(printout t "Time: " ?t " --> " ?type_of_component " " (instance-name-to-symbol ?component) " error: Most Significant Bit is off!" crlf)
)

; If the reading value of the suspect sensor is NOT
; equal to the msb-out value of the suspect component
; but is NOT equal to 0 either and yet
; there is a discrepancy
; then there is a fault in the sensor and
; the corresponding message is printed.
(defrule sensor-most-sign-bit-off "if there is still a discrepancy and the last 2 rules didn't find it"
	?x <- (goal print-type-of-error)
	(time ?t)
	(object (is-a sensor) (name ?sensor) (reading ?sensor_input_value&~0) (input ?component) (suspect yes))
	(object (name ?component) (msb-out ~?sensor_input_value))

=>
	(printout t "Time: " ?t " --> " sensor " " (instance-name-to-symbol ?sensor) " error: Short-cirquit!" crlf)
)


; After the type of error is printed, the suspect values of the sensor
; and of the component to which they are connected become "no" again
; the (goal print-type-of-error)
; and (goal next-round) is entered to print the error type
(defrule set-suspect-no "set suspect from yes to no"
	?x <- (goal print-type-of-error)
	(object (is-a sensor) (name ?sensor) (suspect yes))
	(object (is-a component) (name ?component) (suspect yes))
=>
	(modify-instance ?sensor (suspect no))
	(modify-instance ?component (suspect no))
	(retract ?x)
	(assert (goal next-round))
)


; If the value of time is less than 10 
; then the time is increased by 1, so that it starts
; the next cycle of rule execution for time = time + 1
; The (goal next-round) and the (time ?t)
; and inputs (time (+ ?t 1) and (goal bind-values)
(defrule next-round
	?x <- (goal next-round)
	?y <- (time ?t)
	(test (< ?t 10))

 =>
	(retract ?x)
	(retract ?y)
	(assert (time (+ ?t 1)))
	(assert (goal bind-values))
	
	(printout t "=======================================================================================" crlf)
)
