view: character_screentime {
  sql_table_name: GameOfThrones.character_screentime ;;

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
    sql: SUBSTR(${portrayed_by_imdb_url}, -8, 7) ;;
  }

  dimension: character_id {
    type: number
    sql: SUBSTR(${imdb_url}, -8, 7) ;;
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
  }
  measure: avg_screentime {
    type: average
   sql: ${TABLE}.screentime ;;
}}
