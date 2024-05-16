CREATE DATABASE daniil;

CREATE TABLE IF NOT EXISTS daniil.test (
    a Int64,
    b String,
    c Enum8('A' = 0, 'B' = 1, 'C' = 2)
) Engine = Log()
;

INSERT INTO daniil.test
SELECT
    toInt64(floor(randNormal(12, 2))) AS a,
    randomPrintableASCII(5) AS b,
    ['A', 'B', 'C'][toInt32(randBinomial(2, 0.2)) + 1] AS c
FROM numbers(1000000);

SELECT * FROM daniil.test
WHERE 1=1
AND b LIKE '%abc%'
AND a > 10;