SELECT part_Id, part_Name
FROM production.parts
--WHERE part_id = 89 -- 읽을것으로 예상되는 행 수 1개
WHERE part_Name ='Aline' -- 읽을것으로 예상되는 행 수 100개  (index설정 전)
						 -- >> 읽을것으로 예상되는 행 수 1개 (index설정 후)