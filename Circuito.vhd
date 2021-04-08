ENTITY circuito IS
PORT(Grades,UP,Donw,LimI,LimS,C: IN BIT;
		Subir,Descer:OUT BIT);
END circuito;

ARCHITECTURE comportamento OF circuito IS
			SIGNAL c1:BIT; -- saida NOT(UP)
			SIGNAL c2:BIT; -- saida NOT(Donw)
			SIGNAL c3:BIT; -- Saida NOT(LimS)
			SIGNAL c4:BIT; -- Saida NOT(LimI)
			-- subida
			SIGNAL c5:BIT; -- Saida (Grades and up and LimI)
			SIGNAL c6:BIT; -- saida (Grades and UP and Donw' and LimS' and LimI')
			SIGNAL C7:BIT; -- saida p/ Registrador;
			-- descida
			SIGNAL c8:BIT; -- saida (Grades and Donw and LimS)
			SIGNAL c9:BIT; -- saida (Grades and UP' and Donw and LimS' and limI)
			SIGNAL c10:BIT; -- saida p/ Registrador
			-- PortasEND
			COMPONENT portaEND3Entradas IS
				PORT(en1,en2,en3: IN BIT;
						s1: OUT BIT);
			END COMPONENT;
			COMPONENT portaEND5Entradas IS
				PORT(en4,en5,en6,en7,en8: IN BIT;
						s2: OUT BIT);
			END COMPONENT;
			-- PORTA NOT
			COMPONENT portaNOT IS
				PORT(en9: IN BIT;
						s3: OUT BIT);
			END COMPONENT;
			-- PORTA OR			
			COMPONENT portaOR2 IS
				PORT(en10,en11: IN BIT;
						s4: OUT BIT);
			END COMPONENT;
			-- Flip Flop
			COMPONENT Registrador IS
				PORT( clk,d1,d2: IN BIT;
						n1,n2: OUT BIT);
			END COMPONENT;
			BEGIN
			--SUBIR 
			u1:portaNOT PORT MAP(en9=>Donw,s3=>c2);
			u2:portaNOT PORT MAP(en9=>limS,s3=>c3);
			u3:portaNOT PORT MAP(en9=>limI,s3=>c4);
			u4:portaEND3Entradas PORT MAP(en1=>UP,en2=>Grades,en3=>LimI,s1=>c5);
			u5:portaEND5Entradas PORT MAP(en4=>Grades,en5=>UP,en6=>c2,en7=>c3,en8=>c4,s2=>c6);
			u6:PortaOR2 PORT MAP(en10=>c5,en11=>c6,s4=>c7);
			--Descer
			u8:PortaNOT PORT MAP(en9=>UP,s3=>c1);
			u9:PortaEND3Entradas PORT MAP(en1=>Grades,en2=>Donw,en3=>LimS,s1=>c8);
			u10:portaEND5Entradas PORT MAP(en4=>Grades,en5=>c1,en6=>Donw,en7=>c3,en8=>c4,s2=>c9);
			u11:portaOR2 PORT MAP(en10=>c8,en11=>c9,s4=>c10);
			--REGISTRADOR
			u12:Registrador PORT MAP(CLK=>c,d1=>c7,d2=>c10,n1=>Subir,n2=>Descer);
			END;
			