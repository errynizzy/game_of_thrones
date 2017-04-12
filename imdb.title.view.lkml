view: title {
  sql_table_name: imdb.title ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: episode_nr {
    type: number
    sql: ${TABLE}.episode_nr ;;
  }

  dimension: episode_of_id {
    type: number
    sql: ${TABLE}.episode_of_id ;;
  }

  dimension: i1 {
    type: string
    sql: ${TABLE}.i1 ;;
  }

  dimension: i2 {
    type: string
    sql: ${TABLE}.i2 ;;
  }

  dimension: i3 {
    type: string
    sql: ${TABLE}.i3 ;;
  }

  dimension: kind_id {
    type: number
    sql: ${TABLE}.kind_id ;;
  }

  dimension: production_year {
    type: number
    sql: ${TABLE}.production_year ;;
  }

  dimension: season_nr {
    type: number
    sql: ${TABLE}.season_nr ;;
  }

  dimension: series_year {
    type: string
    sql: ${TABLE}.series_year ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: [id]
  }
}
