

-- 56. 자동차 대여 기록 별 대여 금액 구하기 Level 4

SELECT B.HISTORY_ID,
        CASE
            WHEN DATEDIFF(B.END_DATE,B.START_DATE)+1 < 7
            THEN ROUND((A.DAILY_FEE)*(DATEDIFF(B.END_DATE,B.START_DATE)+1), 0)
            WHEN DATEDIFF(B.END_DATE,B.START_DATE)+1 < 30
            THEN ROUND((A.DAILY_FEE*0.95)*(DATEDIFF(B.END_DATE,B.START_DATE)+1), 0)
            WHEN DATEDIFF(B.END_DATE,B.START_DATE)+1 < 90
            THEN ROUND((A.DAILY_FEE*0.92)*(DATEDIFF(B.END_DATE,B.START_DATE)+1), 0)
            ELSE ROUND((A.DAILY_FEE*0.85)*(DATEDIFF(B.END_DATE,B.START_DATE)+1), 0)
        END AS FEE
FROM CAR_RENTAL_COMPANY_CAR A JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY B ON A.CAR_ID = B.CAR_ID JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN C ON A.CAR_TYPE = C.CAR_TYPE
WHERE A.CAR_TYPE = '트럭'
GROUP BY B.HISTORY_ID
ORDER BY FEE DESC, B.HISTORY_ID DESC