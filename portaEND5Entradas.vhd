ENTITY portaEND5Entradas IS
PORT(en4,en5,en6,en7,en8:IN BIT;
		s2:OUT BIT
);
END portaEND5Entradas;

ARCHITECTURE comportamento OF portaEND5Entradas IS
BEGIN 
	s2 <= en4 and en5 and en6 and en7 and en8;
END;