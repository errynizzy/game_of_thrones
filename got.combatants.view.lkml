


# select SPLIT(defender_commander, ",") AS defender_commanders, * from GameOfThrones.battle ;;



view: attackers {
  derived_table: {
    sql:
    WITH x AS (SELECT SPLIT(attacker_commander,',')AS arr, *  from GameOfThrones.battle)
    SELECT arr_item as attacker_commanders, name, battle_number FROM x, UNNEST(arr) as arr_item
    ;;


    persist_for: "24 hours"
  }

  dimension: battle_name {
    type: string
    sql: ${TABLE}.name ;;
    hidden: yes
    description: "name of battle"
  }

  dimension: battle_number {
    type: number
    sql: ${TABLE}.battle_number ;;
    hidden: yes
    description: "unique id for the battle"
  }

  dimension:  pk_key {
    type: string
    sql: concat(${battle_name}, ${attacker_commanders}) ;;
    primary_key: yes
    hidden: yes
    description: "unique primary key for purposes of generating the counts"
  }

  dimension: attacker_commanders {
    type: string
    sql: ${TABLE}.attacker_commanders ;;
    description: "names of the commanders leading the attacking army"
  }
#
#   dimension: attacker_1 {
#     type: string
#     sql: ${TABLE}.attacker_1 ;;
#     group_label: "Attacker Houses"
#   }
#
#   dimension: attacker_2 {
#     type: string
#     sql: ${TABLE}.attacker_2 ;;
#     group_label: "Attacker Houses"
#   }
#
#   dimension: attacker_3 {
#     type: string
#     sql: ${TABLE}.attacker_3 ;;
#     group_label: "Attacker Houses"
#   }
#
#   dimension: attacker_4 {
#     type: string
#     sql: ${TABLE}.attacker_4 ;;
#     group_label: "Attacker Houses"
#   }
#
#   dimension: attacker_king {
#     type: string
#     sql: ${TABLE}.attacker_king ;;
#   }
#
#   dimension: attacker_king_id {
#     type: number
#     sql: ${TABLE}.attacker_king_id ;;
#   }
#
#   dimension: attacker_outcome {
#     type: string
#     sql: ${TABLE}.attacker_outcome ;;
#   }
#
#   measure: commander_count {
#     type: count
#   }
# }
}
view: defenders {
  derived_table: {
    sql:
    WITH x AS (SELECT SPLIT(defender_commander,',')AS arr, *  from GameOfThrones.battle)
    SELECT arr_item as defender_commanders, name, battle_number FROM x, UNNEST(arr) as arr_item ;;
    persist_for: "24 hours"
  }

  dimension: battle_name {
    type: string
    sql: ${TABLE}.name ;;
    hidden: yes
    description: "name of battle"
  }

  dimension: battle_number {
    type: number
    sql: ${TABLE}.battle_number ;;
    hidden: yes
    description: "unique id for the battle"
  }

  dimension:  pk_key {
    type: string
    sql: concat(${battle_name}, ${defender_commanders}) ;;
    primary_key: yes
    hidden: yes
    description: "primary key generated to make the counts work"
  }

  dimension: defender_commanders {
    type: string
    sql: ${TABLE}.defender_commanders ;;
    description: "names of the commanders leading the attacking army"
  }

#
#   dimension: defender_1 {
#     type: string
#     sql: ${TABLE}.defender_1 ;;
#     group_label: "Defender Houses"
#   }
#
#   dimension: defender_2 {
#     type: string
#     sql: ${TABLE}.defender_2 ;;
#     group_label: "Defender Houses"
#   }
#
#   dimension: defender_3 {
#     type: string
#     sql: ${TABLE}.defender_3 ;;
#     group_label: "Defender Houses"
#   }
#
#   dimension: defender_4 {
#     type: string
#     sql: ${TABLE}.defender_4 ;;
#     group_label: "Defender Houses"
#   }

  measure: commander_count {
    type: count
    description: "number of commanders"
  }
}
