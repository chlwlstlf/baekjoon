-- 54. 카테고리 별 도서 판매량 집계하기 Level 3

SELECT A.CATEGORY, SUM(B.SALES) AS TOTAL_SALES
FROM BOOK A JOIN BOOK_SALES B ON A.BOOK_ID = B.BOOK_ID
WHERE B.SALES_DATE BETWEEN '2022-01-01' AND '2022-01-31'
GROUP BY A.CATEGORY 
ORDER BY A.CATEGORY