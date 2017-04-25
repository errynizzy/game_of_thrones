view: character_screentime {
  derived_table: {
    sql: SELECT *
    , INTEGER(SUBSTR(GameOfThrones.character_screentime.imdb_url, -8, 7)) as character_id
    , INTEGER(SUBSTR(GameOfThrones.character_screentime.portrayed_by_imdb_url, -8, 7)) as actor_id
      from  GameOfThrones.character_screentime ;;

    persist_for: "24 hours"
  }

  dimension: episodes {
    type: string
    sql: ${TABLE}.episodes ;;
  }

  dimension: imdb_url {
    type: string
    sql: ${TABLE}.imdb_url ;;
    hidden: yes
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: portrayed_by_imdb_url {
    type: string
    sql: ${TABLE}.portrayed_by_imdb_url ;;
    hidden: yes
  }

  dimension: actor_id {
    type: number
    sql: ${TABLE}.actor_id ;;
  }

  dimension: character_id {
    type: number
    sql: ${TABLE}.character_id ;;
  }

  dimension: portrayed_by_name {
    type: string
    sql: ${TABLE}.portrayed_by_name ;;
  }

  dimension: screentime {
    type: number
    sql: ${TABLE}.screentime ;;
  }

  measure: count {
    type: count
    drill_fields: [name, portrayed_by_name]
  }
  measure: total_screentime {
    type: sum
    sql: ${TABLE}.screentime ;;
    value_format_name: decimal_1
  }
  measure: avg_screentime {
    type: average
   sql: ${TABLE}.screentime ;;
  value_format_name: decimal_0
}}
