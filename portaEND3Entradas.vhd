ENTITY portaEND3Entradas IS
PORT(en1,en2,en3:IN BIT;
		s1:OUT BIT
);
END portaEND3Entradas;

ARCHITECTURE comportamento OF portaEND3Entradas IS
BEGIN 
	s1 <= en1 and en2 and en3;
END;