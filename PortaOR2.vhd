ENTITY PortaOR2 IS
	PORT(en10,en11: IN BIT;
			s4: OUT BIT);
END PortaOR2;

ARCHITECTURE comportamento OF PortaOR2 IS 
BEGIN
	s4 <= en10 OR en11;
			
END;		