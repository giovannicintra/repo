/*
 * That query aims to show outliers in session duration. The idea is analyze session durations and identify users with significantly shorter session 
 * duration than typical users. Short sessions might indicate bot activity. So, I define the avg time spend per user and filter sessions with more than 
 * 1 event that have a average time lower equal of 10% of Average Time. I define 10% as a start point.
 */

WITH time_difference_db AS (
  SELECT
    a1.*,
    TIMESTAMP_DIFF(next_event_date, event_date, SECOND) time_difference
  FROM (
    SELECT
      df.*,
      COUNT(*) OVER (PARTITION BY session) total_events_session,
      LEAD(event_date) OVER (PARTITION BY session ORDER BY event_date ASC) next_event_date
    FROM `DATA.FUNNEL` df
    ORDER BY event_date
  ) a1
  WHERE total_events_session > 1
  AND next_event_date IS NOT NULL
), med_activity_timing as (
  SELECT
    AVG(td.time_difference) avg_time_difference_all
  FROM time_difference_db td
)
SELECT
  td.session,
  AVG(time_difference) avg_time_difference,
  AVG(mac.avg_time_difference_all) avg_time_difference_all
FROM time_difference_db td
INNER JOIN med_activity_timing mac
  ON 1=1
GROUP BY td.session
HAVING AVG(time_difference) <= AVG(mac.avg_time_difference_all)*0.1