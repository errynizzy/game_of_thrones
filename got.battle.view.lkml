view: battle {
  sql_table_name: GameOfThrones.battle ;;

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    primary_key: yes
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: battle_number {
    type: number
    sql: ${TABLE}.battle_number ;;
    hidden: yes
  }

  dimension: battle_type {
    type: string
    sql: ${TABLE}.battle_type ;;
  }

  dimension: major_death {
    type: yesno
    sql: ${TABLE}.major_death = 1 ;;
  }

  dimension: major_capture {
    type: number
    sql: ${TABLE}.major_capture = 1 ;;
  }

  dimension: summer {
    type: number
    sql: ${TABLE}.summer ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: attacker_army_size {
    type: number
    sql: ${TABLE}.attacker_size ;;
    group_label: "Army Sizes"
  }

  dimension: defender_army_size {
    type: number
    sql: ${TABLE}.attacker_size ;;
    group_label: "Army Sizes"

  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
