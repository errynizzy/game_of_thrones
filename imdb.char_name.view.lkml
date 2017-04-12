view: char_name {
  sql_table_name: imdb.char_name ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: [id, name]
  }
}
