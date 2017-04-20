view: name {
  sql_table_name: imdb.name ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: ignore1 {
    type: string
    sql: ${TABLE}.ignore1 ;;
  }

  dimension: ignore2 {
    type: string
    sql: ${TABLE}.ignore2 ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
