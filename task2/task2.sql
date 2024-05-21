CREATE TABLE test.wine_reviews (
    id UInt32,
    country String,
    description String,
    title String,
    points UInt8,
    price Float64,
    province String,
    region_1 String,
    region_2 String,
    taster_name String,
    taster_twitter_handle String,
    designation String,
    winery String,
    variety String
) ENGINE = MergeTree()
PRIMARY KEY points
;

-- clickhouse-client -u default --format_csv_delimiter="," --query "insert into test.wine_reviews FORMAT CSV" --ask-password < winemag-data-130k-v2_.csv

SELECT COUNT(*) FROM test.wine_reviews;

--    ┌─COUNT()─┐
-- 1. │  129971 │
--    └─────────┘

SELECT
    COUNT(*)
    FROM test.wine_reviews
WHERE 1=1
AND country != ''
AND price != 0
;

--    ┌─COUNT()─┐
-- 1. │  120916 │
--    └─────────┘

SELECT country, MAX(price) AS price FROM test.wine_reviews
WHERE country != ''
GROUP BY country
;

--    ┌─country────────────────┬─price─┐
--  1. │ Romania                │   320 │
--  2. │ Uruguay                │   130 │
--  3. │ Chile                  │   400 │
--  4. │ Turkey                 │   120 │
--  5. │ Ukraine                │    13 │
--  6. │ US                     │  2013 │
--  7. │ Hungary                │   764 │
--  8. │ Brazil                 │    60 │
--  9. │ Slovenia               │    90 │
-- 10. │ Morocco                │    40 │
-- 11. │ India                  │    20 │
-- 12. │ Israel                 │   150 │
-- 13. │ Peru                   │    68 │
-- 14. │ China                  │    18 │
-- 15. │ Portugal               │  1000 │
-- 16. │ Canada                 │   120 │
-- 17. │ France                 │  3300 │
-- 18. │ Egypt                  │     0 │
-- 19. │ Georgia                │    40 │
-- 20. │ Armenia                │    15 │
-- 21. │ Italy                  │   900 │
-- 22. │ Greece                 │    79 │
-- 23. │ Spain                  │   770 │
-- 24. │ Mexico                 │   108 │
-- 25. │ Lebanon                │    75 │
-- 26. │ Slovakia               │    16 │
-- 27. │ Cyprus                 │    21 │
-- 28. │ Austria                │  1100 │
-- 29. │ England                │    95 │
-- 30. │ Moldova                │    42 │
-- 31. │ Germany                │   775 │
-- 32. │ Bulgaria               │   100 │
-- 33. │ Croatia                │    65 │
-- 34. │ Serbia                 │    42 │
-- 35. │ Argentina              │   230 │
-- 36. │ Luxembourg             │    30 │
-- 37. │ Switzerland            │   160 │
-- 38. │ Macedonia              │    20 │
-- 39. │ New Zealand            │   130 │
-- 40. │ Australia              │   850 │
-- 41. │ Czech Republic         │    45 │
-- 42. │ South Africa           │   330 │
-- 43. │ Bosnia and Herzegovina │    13 │
--     └────────────────────────┴───────┘

SELECT country, MAX(price) AS price FROM test.wine_reviews
WHERE country != ''
GROUP BY country
ORDER BY price DESC
LIMIT 10
;

--     ┌─country───┬─price─┐
--  1. │ France    │  3300 │
--  2. │ US        │  2013 │
--  3. │ Austria   │  1100 │
--  4. │ Portugal  │  1000 │
--  5. │ Italy     │   900 │
--  6. │ Australia │   850 │
--  7. │ Germany   │   775 │
--  8. │ Spain     │   770 │
--  9. │ Hungary   │   764 │
-- 10. │ Chile     │   400 │
--     └───────────┴───────┘

SELECT
    country, AVG(price) AS mean_price, CORR(price, points) AS price_points_corr
    FROM test.wine_reviews
WHERE 1=1
AND country != ''
AND price != 0
GROUP BY country
ORDER BY mean_price DESC
;

--     ┌─country────────────────┬─────────mean_price─┬────price_points_corr─┐
--  1. │ Switzerland            │  85.28571428571429 │   0.1013870965055609 │
--  2. │ England                │  51.68115942028985 │  0.28046597981593735 │
--  3. │ Germany                │  42.25754716981132 │   0.4531207846758714 │
--  4. │ France                 │ 41.139120162016205 │  0.40582940239431303 │
--  5. │ Hungary                │ 40.648275862068964 │  0.34423687739482245 │
--  6. │ Italy                  │ 39.663769658271256 │   0.5280726946460931 │
--  7. │ US                     │   36.5734635584631 │   0.4530788645224963 │
--  8. │ Canada                 │  35.71259842519685 │   0.3185085961155101 │
--  9. │ Australia              │  35.43766346992153 │   0.4661981376737632 │
-- 10. │ Israel                 │ 31.768916155419223 │   0.3454494557740517 │
-- 11. │ Austria                │  30.76277241872097 │   0.3928412620935174 │
-- 12. │ Lebanon                │ 30.685714285714287 │   0.3142184495572154 │
-- 13. │ Spain                  │ 28.215274608245853 │  0.47111225730853296 │
-- 14. │ New Zealand            │  26.93178519593614 │  0.48396098257544046 │
-- 15. │ Mexico                 │ 26.785714285714285 │   0.4715997771111346 │
-- 16. │ Uruguay                │  26.40366972477064 │   0.3646964116174172 │
-- 17. │ Portugal               │  26.21825641025641 │    0.440234963138789 │
-- 18. │ Croatia                │ 25.450704225352112 │   0.3579814578832992 │
-- 19. │ Slovenia               │            24.8125 │   0.4561737694177019 │
-- 20. │ South Africa           │ 24.668986852281517 │   0.5661969033960911 │
-- 21. │ Turkey                 │ 24.633333333333333 │   0.2377986740860615 │
-- 22. │ Argentina              │ 24.510117145899894 │   0.5681677225978861 │
-- 23. │ Serbia                 │               24.5 │   0.6671395322819317 │
-- 24. │ Czech Republic         │              24.25 │   0.5516841649059677 │
-- 25. │ Brazil                 │  23.76595744680851 │   0.2881570641169772 │
-- 26. │ Luxembourg             │ 23.333333333333332 │ -0.38769905726763276 │
-- 27. │ Greece                 │ 22.364425162689805 │  0.15353150306051597 │
-- 28. │ Chile                  │ 20.786458333333332 │  0.48030711410095156 │
-- 29. │ Morocco                │               19.5 │ 0.014873838506049772 │
-- 30. │ Georgia                │ 19.321428571428573 │  0.03867241595806428 │
-- 31. │ Peru                   │            18.0625 │   0.3262564060096904 │
-- 32. │ China                  │                 18 │                  nan │
-- 33. │ Moldova                │  16.74576271186441 │   0.5732452766075953 │
-- 34. │ Cyprus                 │ 16.272727272727273 │   0.2967582959948686 │
-- 35. │ Slovakia               │                 16 │                  nan │
-- 36. │ Macedonia              │ 15.583333333333334 │   0.2580129009675806 │
-- 37. │ Romania                │ 15.241666666666667 │  0.10090329158557716 │
-- 38. │ Bulgaria               │ 14.645390070921986 │   0.3614583482278049 │
-- 39. │ Armenia                │               14.5 │                    1 │
-- 40. │ India                  │ 13.333333333333334 │   0.7071067811865476 │
-- 41. │ Bosnia and Herzegovina │               12.5 │                   -1 │
-- 42. │ Ukraine                │  9.214285714285714 │ -0.22541273731227002 │
--     └────────────────────────┴────────────────────┴──────────────────────┘
