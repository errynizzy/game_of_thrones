view: battle {
  sql_table_name: GameOfThrones.battle ;;

  dimension: attacker_1 {
    type: string
    sql: ${TABLE}.attacker_1 ;;
  }

  dimension: attacker_2 {
    type: string
    sql: ${TABLE}.attacker_2 ;;
  }

  dimension: attacker_3 {
    type: string
    sql: ${TABLE}.attacker_3 ;;
  }

  dimension: attacker_4 {
    type: string
    sql: ${TABLE}.attacker_4 ;;
  }

  dimension: attacker_commander {
    type: string
    sql: ${TABLE}.attacker_commander ;;
  }

  dimension: attacker_king {
    type: string
    sql: ${TABLE}.attacker_king ;;
  }

  dimension: attacker_king_id {
    type: number
    sql: ${TABLE}.attacker_king_id ;;
  }

  dimension: attacker_outcome {
    type: string
    sql: ${TABLE}.attacker_outcome ;;
  }

  dimension: attacker_size {
    type: number
    sql: ${TABLE}.attacker_size ;;
  }

  dimension: battle_number {
    type: number
    sql: ${TABLE}.battle_number ;;
  }

  dimension: battle_type {
    type: string
    sql: ${TABLE}.battle_type ;;
  }

  dimension: defender_1 {
    type: string
    sql: ${TABLE}.defender_1 ;;
  }

  dimension: defender_2 {
    type: string
    sql: ${TABLE}.defender_2 ;;
  }

  dimension: defender_3 {
    type: string
    sql: ${TABLE}.defender_3 ;;
  }

  dimension: defender_4 {
    type: string
    sql: ${TABLE}.defender_4 ;;
  }

  dimension: defender_commander {
    type: string
    sql: ${TABLE}.defender_commander ;;
  }

  dimension: defender_king {
    type: string
    sql: ${TABLE}.defender_king ;;
  }

  dimension: defender_king_id {
    type: number
    sql: ${TABLE}.defender_king_id ;;
  }

  dimension: defender_size {
    type: number
    sql: ${TABLE}.defender_size ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: major_capture {
    type: number
    sql: ${TABLE}.major_capture ;;
  }

  dimension: major_death {
    type: number
    sql: ${TABLE}.major_death ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: summer {
    type: number
    sql: ${TABLE}.summer ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
