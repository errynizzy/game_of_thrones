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
    }

    dimension: attacker_king_id {
      type: number
      sql: ${TABLE}.attacker_king_id ;;
    }

    dimension: major_death {
      type: yesno
      sql: ${TABLE}.major_death = 1 ;;
    }

    dimension: defender_king_id {
      type: number
      sql: ${TABLE}.defender_king_id ;;
    }

    dimension: major_capture {
      type: yesno
      sql: ${TABLE}.major_capture = 1 ;;
    }

    dimension: attacker_king {
      type: string
      sql: ${TABLE}.attacker_king ;;
    }

    dimension: defender_king {
      type: string
      sql: ${TABLE}.defender_king ;;
    }

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

    dimension: attacker_outcome {
      type: string
      sql: ${TABLE}.attacker_outcome ;;
    }

    dimension: battle_type {
      type: string
      sql: ${TABLE}.battle_type ;;
    }

    dimension: attacker_size {
      type: number
      sql: ${TABLE}.attacker_size ;;
    }

    dimension: defender_size {
      type: number
      sql: ${TABLE}.defender_size ;;
    }

    dimension: attacker_commander {
      type: string
      sql: ${TABLE}.attacker_commander ;;
    }

    dimension: defender_commander {
      type: string
      sql: ${TABLE}.defender_commander ;;
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

    measure: count {
      type: count_distinct
      sql:  ${name} ;;

    }

    set: detail {
      fields: [
        name,
        year,
        battle_number,
        attacker_king_id,
        defender_king_id,
        attacker_king,
        defender_king,
        attacker_1,
        attacker_2,
        attacker_3,
        attacker_4,
        defender_1,
        defender_2,
        defender_3,
        defender_4,
        attacker_outcome,
        battle_type,
        major_death,
        major_capture,
        attacker_size,
        defender_size,
        attacker_commander,
        defender_commander,
        summer,
        location,
        region,
        note
      ]
    }


}
