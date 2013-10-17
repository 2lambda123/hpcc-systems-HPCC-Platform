IMPORT STD;

ds1 := DATASET(2, TRANSFORM({UNSIGNED line}, SELF.line := COUNTER) , LOCAL);

summary := TABLE(ds1, { COUNT(GROUP) }, LOCAL);
COUNT(NOFOLD(summary)) = CLUSTERSIZE;
COUNT(ds1) = 2 * CLUSTERSIZE;
SUM(ds1, line) = 3 * CLUSTERSIZE;
