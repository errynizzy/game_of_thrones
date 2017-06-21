view: screentime_all_seasons {
  sql_table_name: GameOfThrones.screentime_all_seasons ;;

  dimension: character {
    type: string
    sql: ${TABLE}.character ;;
  }

  dimension: season_1 {
    type: string
    sql: ${TABLE}.season_1 ;;
  }

  dimension: season_2 {
    type: string
    sql: ${TABLE}.season_2 ;;
  }

  dimension: season_3 {
    type: string
    sql: ${TABLE}.season_3 ;;
  }

  dimension: season_4 {
    type: string
    sql: ${TABLE}.season_4 ;;
  }

  dimension: season_5 {
    type: string
    sql: ${TABLE}.season_5 ;;
  }

  dimension: season_6 {
    type: string
    sql: ${TABLE}.season_6 ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
