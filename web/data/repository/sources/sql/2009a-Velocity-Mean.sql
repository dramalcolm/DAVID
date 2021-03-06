﻿SELECT
	d.subject_id AS "subject",
	p.annotation AS "annotation",
	avg(vehicle_speed_abs) AS "Mean.Velocity"

FROM "2009-onrd-pta".daq d INNER JOIN "2009-onrd-pta".protocol_subject p USING (subject_id)
WHERE d.unique_unix_timestamp BETWEEN p.start_timestamp AND p.end_timestamp
GROUP BY d.subject_id, p.annotation
ORDER BY d.subject_id, p.annotation