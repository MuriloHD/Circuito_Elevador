ENTITY portaNOT IS
PORT(en9:IN BIT;
		s3:OUT BIT
);
END portaNOT;
ARCHITECTURE comportamento OF portaNOT IS 
BEGIN 
	s3<= not en9;
END;