ENTITY arraymult IS
  PORT (a, b : IN BIT_VECTOR (3 DOWNTO 0);  -- a and b data inputs
        prod : OUT BIT_VECTOR (7 DOWNTO 0));-- prod data output
END arraymult;
--
ARCHITECTURE general_cf OF arraymult IS
  COMPONENT ha PORT (i1, i2 : IN BIT; o1, o2 : OUT BIT); END COMPONENT;
  COMPONENT fa PORT (a, b, ci : IN BIT; co, sum : OUT BIT); END COMPONENT;
  COMPONENT m1 PORT (i1, i2 : IN BIT; o1 : OUT BIT); END COMPONENT;
  COMPONENT m2 PORT (a, b, ci : IN BIT; co, sum : OUT BIT); END COMPONENT;
  COMPONENT m3 PORT (a, b, ci, si : IN BIT; co, sum : OUT BIT); END COMPONENT;
  CONSTANT n : INTEGER := 4;
  TYPE bit_2d IS ARRAY ( 0 TO (n-2), 0 to 2*(n-2)+1) OF BIT;
  SIGNAL row1 : BIT_VECTOR ( 0 TO (n-2));
  SIGNAL rows : bit_2d;
  SIGNAL carr : BIT_VECTOR ( 0 TO (n-2));
BEGIN
  marr : FOR i IN 0 TO n-1 GENERATE
    mrows: FOR j IN 0 TO n-1 GENERATE
             l: IF i = 0  GENERATE
               f: IF j = 0  GENERATE
                    row1_l: m1 PORT MAP (a(j), b(i), prod(i) );
                  END GENERATE;
               r: IF j > 0 AND j < n-1 GENERATE
                    row1_r: m1 PORT MAP (a(j), b(i), row1(j-1) );
                  END GENERATE;
               m: IF j = n-1  GENERATE
                    row1_m: m1 PORT MAP (a(j), b(i), row1(j-1) );
                  END GENERATE;
                END GENERATE;
             s: IF i = 1  GENERATE
               m: IF j = n-1  GENERATE
                    row2_m: m1 PORT MAP (a(j), b(i), rows(i-1, (2*j)-1) );
                  END GENERATE;
               f: IF j = 0  GENERATE
                    row2_f: m2 PORT MAP (a(j), b(i), row1(j),
            rows(i-1,(2*j)), prod(i) );
                  END GENERATE;
               r: IF j > 0 AND j < n-1  GENERATE
                    row2_r: m2 PORT MAP (a(j), b(i), row1(j),
            rows(i-1, (2*j)), rows(i-1, (2*j)-1) );
                  END GENERATE;
                END GENERATE;
         r: IF i > 1 AND i < n  GENERATE
               m: IF j = n-1  GENERATE
                    rows_m: m1 PORT MAP (a(j), b(i), rows(i-1, (2*j)-1) );
                  END GENERATE;
               f: IF j = 0  GENERATE
                    rows_f: m3 PORT MAP
                (a(j), b(i), rows(i-2, (2*j)+1), rows(i-2, (2*j)),
                    rows(i-1, (2*j)), prod(i) );
                  END GENERATE;
               r: IF j > 0 AND j < n-1  GENERATE
                    rows_r: m3 PORT MAP
                (a(j), b(i), rows(i-2, (2*j)+1), rows(i-2, (2*j)),
                    rows(i-1, (2*j)), rows(i-1, (2*j)-1) );
                  END GENERATE;
                END GENERATE;
    END GENERATE;
  END GENERATE;
  lastst : FOR i IN 0 TO n-2 GENERATE
           l: IF i = 0  GENERATE
                lastrow_l: ha PORT MAP ( rows(n-2, (2*i)+1), rows(n-2, (2*i)),
                            carr(i), prod(n+i));
              END GENERATE;
           r: IF i > 0 AND i < n-2  GENERATE
                lastrow_r: fa PORT MAP ( rows(n-2, (2*i)+1), rows(n-2, (2*i)),
                carr(i-1), carr(i), prod(n+i));
              END GENERATE;
           m: IF i = n-2  GENERATE
                lastrow_m: fa PORT MAP ( rows(n-2, (2*i)+1), rows(n-2, (2*i)),
                carr(i-1), prod(n+i+1), prod(n+i));
              END GENERATE;
  END GENERATE;
END general_cf;
