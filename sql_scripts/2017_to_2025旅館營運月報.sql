create or replace view tourism_db.2017_to_2025旅館營運月報
as (
SELECT
    gh.地區,
    gh.年月,
    gh.住用數,
    gh.房間數,
    gh.客房收入,
    gh.餐廳收入,
    gh.總營業收入,
    '一般旅館' as 旅館類別
FROM tourism_db.general_hotel AS gh
UNION ALL
SELECT
    ah.地區,
    ah.年月,
    ah.住用數,
    ah.房間數,
    ah.客房收入,
    ah.餐廳收入,
    ah.總營業收入,
    case when ah.`類型` = '國際' then '國際觀光旅館' else '一般觀光旅館' end as 旅館類別
FROM tourism_db.administration_hotel AS ah
);
