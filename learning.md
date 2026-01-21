# --- 1/21 ---

- Detail :
	- In initial and have to use the reg variable. 
	- $singed() is to changed the way display and calculation, it don't change the number 
	- ASR , Arithmetic Shift right, used to signed number. When shifting, it add 1 in the top bit. 
	- SLR, shift right logic, used to unsigned number. When shifting, it add 0 in the negative number's top bit. add 1 in the postivie number's top bit.
	- and wire have to use assign to set value 
	- Use dump code to create file save change and display ... 
	- use # can delay in the code, and it is accumulative in the block. 
	- use "<=" it would not update the change immediately, it wait until every step in this time finished. Used for flip-flop
    - "=" like C language, it update the change immediately then swith into next line.
	- initial execute once. When it finish, the initial block stop forever. Good for test.
	- always execute repeatedly, use more frequently in module 
	- initial and always both are starting at simulation time 0 
	- instantiate can call other module 
