view: name {
  sql_table_name: imdb.name ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: gender {
    type: string
    case: {
      when: {
        sql: ${gender_base} = "m" OR ${gender_base} = "Male";;
        label: "Male"
      }
      when: {
        sql: ${gender_base} = "f" OR ${gender_base} = "Female" ;;
        label: "Female"
      }
      else: "Not Specified"
    }
  }

  dimension: gender_base {
    type: string
    sql: CASE WHEN ${TABLE}.gender IS NULL THEN ${character_list.gender} ELSE ${TABLE}.gender END ;;
    hidden: yes
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
