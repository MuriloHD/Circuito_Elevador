entity Registrador is
	port( clk,d1,d2: in bit;
			n1,n2: out bit
	);
end Registrador;

architecture behavior of Registrador is
begin
	process(clk)
	begin
		if(clk'event and clk = '1') then
			n1<=d1;
			n2<=d2;
		end if;
	end process;
end behavior;