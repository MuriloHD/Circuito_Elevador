ENTITY PortaOR5 IS
	PORT(en1, en2, en3, en4, en5: IN BIT;
			s1: OUT BIT);
END PortaOR5;

ARCHITECTURE comportamento OF PortaOR5 IS 
BEGIN
	s1 <= en1 or en2 or en3 or en4;
			
END;		