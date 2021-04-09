ENTITY portaEND4Entradas IS
PORT(en1,en2,en3,en4:IN BIT;
		s1:OUT BIT
);
END portaEND4Entradas;

ARCHITECTURE comportamento OF portaEND4Entradas IS
BEGIN 
	s1 <= en1 and en2 and en3;
END;