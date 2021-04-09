ENTITY circuito IS
PORT(Gr,b2,b1,li,ls,c: IN BIT;
		s, d:OUT BIT);
END circuito;

ARCHITECTURE comportamento OF circuito IS	
			signal s1		: bit := '0';
			signal s2		: bit := '0';
			signal s1B 		: bit;
			signal s2B 		: bit;
			signal b2B 		: bit;
			signal b1B		: bit;
			signal lsB 		: bit;
			signal liB 		: bit;
			signal GrB		: bit;
			signal n1		: bit;
			signal n2		: bit;
			
			signal n1c1 	: bit; -- saida do and1 
			signal n1c2 	: bit; -- saida and2
			
			signal n2c1 	: bit;
			signal n2c2		: bit;
			
			signal sc1		: bit;
			signal sc2		: bit;
			signal sc3		: bit;
			signal sc4		: bit;
			signal sc5		: bit;
			
			signal dc1		: bit;
			signal dc2		: bit;
			signal dc3		: bit;
			signal dc4		: bit;
			signal dc5		: bit;
			
			-- PortasEND
			component portaEND6Entradas is
				PORT(	en4,en5,en6,en7,en8,en9	: IN BIT;
						s2								: OUT BIT
				);
			end component;
			
			COMPONENT portaEND3Entradas IS
				PORT(en1,en2,en3: IN BIT;
						s1: OUT BIT);
			END COMPONENT;
			
			component portaEND4Entradas is
				port(en1, en2, en3, en4	: in bit;
						s1						: out bit);
			end component;
			
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
			
			COMPONENT portaOR5 IS
				PORT(en1, en2, en3, en4, en5: IN BIT;
						s1: OUT BIT);
			END COMPONENT;
			
			-- Flip Flop
			COMPONENT Registrador IS
				PORT( clk,d1,d2: IN BIT;
						n1,n2: OUT BIT);
			END COMPONENT;
			
			BEGIN
			u1:portaNOT port map(en9=>s1, s3=>s1B);
			u2:portaNOT port map(en9=>s2, s3=>s2B);
			u3:portaNOT port map(en9=>b2, s3=>b2B);
			u4:portaNOT port map(en9=>b1, s3=>b1B);
			u5:portaNOT port map(en9=>ls, s3=>lsB);
			u6:portaNOT port map(en9=>li, s3=>liB);
			u7:portaNOT port map(en9=>Gr, s3=>GrB);
			
			-- n1
			u8:portaEND6Entradas port map(en4=>s1B, en5=>s2B, en6=>b2, en7=>b1B, en8=>lsB ,en9=>Gr, s2=>n1c1);
			u9:portaEND6Entradas port map(en4=>s1, en5=>s2B, en6=>b2, en7=>b1B, en8=>lsB ,en9=>Gr, s2=>n1c2);
			u10:portaOR2 port map(en10=>n1c1,en11=>n1c2,s4=>n1);
			
			-- n2
			u11: portaEND6Entradas port map(en4=>s1B, en5=>s2B, en6=>b2B, en7=>b1, en8=>liB ,en9=>Gr, s2=>n2c1);
			u12: portaEND6Entradas port map(en4=>s1B, en5=>s2, en6=>b2B, en7=>b1, en8=>liB ,en9=>Gr, s2=>n2c2);
			u13: portaOR2 port map(en10=>n2c1,en11=>n2c2,s4=>n2);
			
			-- S
			u14: portaEND6Entradas port map(en4=>s1, en5=>s2B, en6=>b2, en7=>b1B, en8=>lsB ,en9=>Gr, s2=>sc1);
			u15: portaEND3Entradas port map(en1=>s1, en2=>s2B, en3=>b2B, s1=>sc2);
			u16: portaEND4Entradas port map(en1=>s1, en2=>s2B, en3=>b2, en4=>b1, s1=>sc3);
			u17: portaEND3Entradas port map(en1=>s1, en2=>s2B, en3=>ls, s1=>sc4);
			u18: portaEND3Entradas port map(en1=>s1, en2=>s2B, en3=>GrB, s1=>sc5);
			u19: portaOR5 port map(en1=>sc1, en2=>sc2, en3=>sc3, en4=>sc4, en5=>sc5, s1=>s);
			
			-- D
			u20: portaEND6Entradas port map(en4=>s1B, en5=>s2, en6=>b2B, en7=>b1, en8=>liB ,en9=>Gr, s2=>dc1);
			u21: portaEND3Entradas port map(en1=>s1B, en2=>s2, en3=>b1B, s1=>dc2);
			u22: portaEND4Entradas port map(en1=>s1B, en2=>s2, en3=>b2, en4=>b1, s1=>dc3);
			u23: portaEND3Entradas port map(en1=>s1B, en2=>s2, en3=>li, s1=>dc4);
			u24: portaEND3Entradas port map(en1=>s1B, en2=>s2, en3=>GrB, s1=>dc5);
			u25: portaOR5 port map(en1=>dc1, en2=>dc2, en3=>dc3, en4=>dc4, en5=>dc5, s1=>d);
			
			-- Registrador
			u26:Registrador port map(clk=>c, d1=>s1, d2=>s2, n1=>n1, n2=>n2);
			END;
			