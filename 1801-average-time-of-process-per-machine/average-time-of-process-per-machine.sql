SELECT machine_id, 
       ROUND(AVG(CASE WHEN activity_type = 'end' THEN timestamp - 
                               (SELECT timestamp FROM Activity WHERE machine_id = A.machine_id AND process_id = A.process_id AND activity_type = 'start') 
                    END), 3) AS processing_time
FROM Activity A
WHERE activity_type = 'end'
GROUP BY machine_id;
