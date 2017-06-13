view: battle {
  sql_table_name: GameOfThrones.battle ;;

    filter: house {
      type: string
      suggestions: ["Frey", "Greyjoy", "Lannister", "Stark"]
    }

  dimension: is_house_in_battle {
#     hidden: yes
    type: yesno
    sql: {% condition house %} ${attacker_house_1} {% endcondition %} OR
      {% condition house %} ${defender_house_1} {% endcondition %}
      ;;
  }

  measure: count_battles_house {
    type: count
    description: "The number of battles taking place for selected house."
    filters: {
      field: is_house_in_battle
      value: "yes"
    }
  }

  measure: total_battles_count {
    type: count
    description: "The number of battles taking place."
  }

  measure: percentage_of_battles_fought {
    type: number
    sql: ${count_battles_house}/NULLIF(${total_battles_count},0) ;;
    value_format_name: percent_0
  }



    dimension: house_won {
      hidden: yes
      type: yesno
      sql: ${is_house_in_battle}
      and ${attacker_win} = 'win' ;;
    }
    measure: win_count {
      type: sum
      sql: case when ${house_won} then 1 else 0 end  ;;
    }

    measure: win_rate {
      type: number
      sql: ${win_count}/nullif(${count_battles_house},0) ;;
      value_format_name: percent_0
    }

#   measure: total_attacker_wins {
#     type: sum
#     sql: case when ${attacker_win} = 'win' then 1 else 0 end ;;
#   }

    dimension: name {
      type: string
      sql: ${TABLE}.name ;;
      primary_key: yes
      description: "The name of the battle."
    }

    dimension: year {
      type: number
      sql: ${TABLE}.year ;;
      description: "The year of the battle."
    }

    dimension: battle_number {
      type: number
      sql: CAST(${TABLE}.battle_number AS INT64) ;;
      description: "A unique ID number for the battle."
    }

    dimension: is_battle_test {
      type: yesno
      sql: ${battle_number} is not null;;
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
      description: "The attacker's king. A slash indicators that the king charges over the course of the war. For example, 'Joffrey/Tommen Baratheon' is coded as such because one king follows the other in the Iron Throne."
    }

    dimension: defender_king {
      type: string
      sql: ${TABLE}.defender_king ;;
      description: "The defender's king."
    }

    dimension: attacker_house_1 {
      type: string
      sql: ${TABLE}.attacker_1 ;;
      group_label: "Attacker Houses"
      description: "Major house attacking."
    }

    dimension: attacker_house_2 {
      type: string
      sql: ${TABLE}.attacker_2 ;;
      group_label: "Attacker Houses"
      description: "Major house attacking."
    }

    dimension: attacker_house_3 {
      type: string
      sql: ${TABLE}.attacker_3 ;;
      group_label: "Attacker Houses"
      description: "Major house attacking."
    }

    dimension: attacker_house_4 {
      type: string
      sql: ${TABLE}.attacker_4 ;;
      group_label: "Attacker Houses"
      description: "Major house attacking."
    }

    dimension: defender_house_1 {
      type: string
      sql: ${TABLE}.defender_1 ;;
      group_label: "Defender Houses"
      description: "Major house defending."
    }

    dimension: defender_house_2 {
      type: string
      sql: ${TABLE}.defender_2 ;;
      group_label: "Defender Houses"
      description: "Major house defending."
    }

    dimension: defender_house_3 {
      type: string
      sql: ${TABLE}.defender_3 ;;
      group_label: "Defender Houses"
      description: "Major house defending."
    }

    dimension: defender_house_4 {
      type: string
      sql: ${TABLE}.defender_4 ;;
      group_label: "Defender Houses"
      description: "Major house defending."
    }

    dimension: attacker_win {
      type: string
      sql: ${TABLE}.attacker_outcome ;;
      description: "The outcome from the perspective of the attacker. Categories: win, loss, draw."
    }

    dimension: battle_type {
      type: string
      sql: ${TABLE}.battle_type ;;
      description: "A classification of the battle's primary type. Categories: *pitched_battle*: Armies meet in a location and fight. This is also the baseline category. ambush: A battle where stealth or subterfuge was the primary means of attack. siege: A prolonged of a fortied position. razing: An attack against an undefended position"
    }

    dimension: attacker_size {
      type: number
      sql: ${TABLE}.attacker_size ;;
      description: "The size of the attacker's force. No distinction is made between the types of soldiers such as cavalry and footmen."
    }

    dimension: defender_size {
      type: number
      sql: ${TABLE}.defender_size ;;
      description: "The size of the defenders's force. No distinction is made between the types of soldiers such as cavalry and footmen."
    }

    dimension: battle_size_ratio {
      type: number
      sql: 1.0*${attacker_size}/nullif(${defender_size},0) ;;
      value_format_name: decimal_2
    }

    dimension: was_size_advantage {
      type: yesno
      sql: ${defender_size} > 1.0 ;;
    }

    dimension: attacker_commander {
      type: string
      sql: ${TABLE}.attacker_commander ;;
      description: "Major commanders of the attackers. Commander's names are included without honoric titles and commandders are seperated by commas."
    }

    dimension: defender_commander {
      type: string
      sql: ${TABLE}.defender_commander ;;
      description: "Major commanders of the defener. Commander's names are included without honoric titles and commandders are seperated by commas."
    }

    dimension: summer {
      type: yesno
      sql: ${TABLE}.summer = 1 ;;
      description: "Was it summer?"
    }

    dimension: location {
      type: string
      sql: ${TABLE}.location ;;
      description: "The location of the battle."
    }

    dimension: region {
      type: string
      sql: ${TABLE}.region ;;
      description: "The region where the battle takes place. "
    }

    measure: count_robb_stark_defending {
      type: count_distinct
      sql: ${name} ;;
      filters:
        {
          field: defender_king
          value: "Robb Stark"
      }
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
        attacker_house_1,
        attacker_house_2,
        attacker_house_3,
        attacker_house_4,
        defender_house_1,
        defender_house_2,
        defender_house_3,
        defender_house_4,
        attacker_win,
        battle_type,
        major_death,
        major_capture,
        attacker_size,
        defender_size,
        attacker_commander,
        defender_commander,
        summer,
        location,
        region
      ]
    }


}
