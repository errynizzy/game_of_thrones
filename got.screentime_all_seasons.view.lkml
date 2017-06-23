view: screentime_all_seasons {
  sql_table_name: GameOfThrones.screentime_all_seasons ;;

  dimension: character {
    type: string
    sql: ${TABLE}.character ;;
  }

  dimension: season_1_raw {
    hidden: yes
    type: string
    sql: ${TABLE}.season_1 ;;
  }

  dimension: season_1_minutes {
    hidden: yes
    type: number
    sql: CAST(RPAD(${season_1_raw}, STRPOS(${season_1_raw}, ":")-1) AS INT64) ;;
  }

  dimension: season_1_seconds {
    hidden: yes
    type: number
    sql: CAST(SUBSTR(${season_1_raw}, STRPOS(${season_1_raw}, ":")-length(${season_1_raw})) AS INT64) ;;
  }

  dimension: season_1_total_seconds_screentime {
    type: number
    sql: (60*${season_1_minutes})+${season_1_seconds} ;;
  }

  dimension: season_2_raw {
    type: string
    hidden: yes
    sql: ${TABLE}.season_2 ;;
  }

  dimension: season_2_minutes {
    hidden: yes
    type: number
    sql: CAST(RPAD(${season_2_raw}, STRPOS(${season_2_raw}, ":")-1) AS INT64) ;;
  }

  dimension: season_2_seconds {
    hidden: yes
    type: number
    sql: CAST(SUBSTR(${season_2_raw}, STRPOS(${season_2_raw}, ":")-length(${season_2_raw})) AS INT64) ;;
  }

  dimension: season_2_total_seconds_screentime {
    type: number
    sql: (60*${season_2_minutes})+${season_2_seconds} ;;
  }

  dimension: season_3_raw {
    type: string
    hidden: yes
    sql: ${TABLE}.season_3 ;;
  }

  dimension: season_3_minutes {
    hidden: yes
    type: number
    sql: CAST(RPAD(${season_3_raw}, STRPOS(${season_3_raw}, ":")-1) AS INT64) ;;
  }

  dimension: season_3_seconds {
    hidden: yes
    type: number
    sql: CAST(SUBSTR(${season_3_raw}, STRPOS(${season_3_raw}, ":")-length(${season_3_raw})) AS INT64) ;;
  }

  dimension: season_3_total_seconds_screentime {
    type: number
    sql: (60*${season_3_minutes})+${season_3_seconds} ;;
  }

  dimension: season_4_raw {
    type: string
    hidden: yes
    sql: ${TABLE}.season_4 ;;
  }

  dimension: season_4_minutes {
    hidden: yes
    type: number
    sql: CAST(RPAD(${season_4_raw}, STRPOS(${season_4_raw}, ":")-1) AS INT64) ;;
  }

  dimension: season_4_seconds {
    hidden: yes
    type: number
    sql: CAST(SUBSTR(${season_4_raw}, STRPOS(${season_4_raw}, ":")-length(${season_4_raw})) AS INT64) ;;
  }

  dimension: season_4_total_seconds_screentime {
    type: number
    sql: (60*${season_4_minutes})+${season_4_seconds} ;;
  }

  dimension: season_5_raw {
    type: string
    hidden: yes
    sql: ${TABLE}.season_5 ;;
  }

  dimension: season_5_minutes {
    hidden: yes
    type: number
    sql: CAST(RPAD(${season_5_raw}, STRPOS(${season_5_raw}, ":")-1) AS INT64) ;;
  }

  dimension: season_5_seconds {
    hidden: yes
    type: number
    sql: CAST(SUBSTR(${season_5_raw}, STRPOS(${season_5_raw}, ":")-length(${season_5_raw})) AS INT64) ;;
  }

  dimension: season_5_total_seconds_screentime {
    type: number
    sql: (60*${season_5_minutes})+${season_5_seconds} ;;
  }

  dimension: season_6_raw {
    type: string
    hidden: yes
    sql: ${TABLE}.season_6 ;;
  }

  dimension: season_6_minutes {
    hidden: yes
    type: number
    sql: CAST(RPAD(${season_6_raw}, STRPOS(${season_6_raw}, ":")-1) AS INT64) ;;
  }

  dimension: season_6_seconds {
    hidden: yes
    type: number
    sql: CAST(SUBSTR(${season_6_raw}, STRPOS(${season_6_raw}, ":")-length(${season_6_raw})) AS INT64) ;;
  }

  dimension: season_6_total_seconds_screentime {
    type: number
    sql: (60*${season_6_minutes})+${season_6_seconds} ;;
  }

  dimension: total_screentime_seconds {
    type: number
    sql: ${season_1_total_seconds_screentime} + ${season_2_total_seconds_screentime}
    + ${season_3_total_seconds_screentime} + ${season_4_total_seconds_screentime} +
    ${season_5_total_seconds_screentime} + ${season_6_total_seconds_screentime};;
  }

  measure: count {
    type: count
    drill_fields: []
  }


}
