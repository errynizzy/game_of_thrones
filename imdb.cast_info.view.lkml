view: cast_info {
  sql_table_name: imdb.cast_info ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: movie_id {
    type: number
    sql: ${TABLE}.movie_id ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: nr_order {
    type: number
    sql: ${TABLE}.nr_order ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}.person_id ;;
  }

  dimension: person_role_id {
    type: number
    sql: ${TABLE}.person_role_id ;;
  }

  dimension: role_id {
    type: number
    sql: ${TABLE}.role_id ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: [id]
  }
}
