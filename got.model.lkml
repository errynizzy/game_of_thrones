connection: "lookerdata_publicdata_standard_sql"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project


# explore: battle {
#   label: "Game of Thrones Battles (Book)"
#   description: "Chris Albon's 'The War of the Five Kings Dataset'"
#
#   join: attackers {
#     from: character_prediction
#     sql_on: ${battle.attacker_king_id} = ${attackers.s_no} ;;
#     relationship: many_to_one
#   }
#   join: defenders {
#     from: character_prediction
#     sql_on: ${battle.defender_king_id} = ${defenders.s_no} ;;
#     relationship: many_to_one
#   }

explore: battle {
  label: "Game of Thrones Battles (Book)"
  description: "Chris Albon's 'The War of the Five Kings Dataset'"

  join: attackers {
    sql_on: ${attackers.battle_number} = ${battle.battle_number} ;;
    relationship: one_to_many
  }
  join: attacker_commander_detail {
    from: character_list
    view_label: "Attackers"
    sql_on: ${attackers.attacker_commanders} = ${attacker_commander_detail.name} ;;
    relationship: many_to_one
  }
  join: defenders {
    sql_on: ${defenders.battle_number} = ${battle.battle_number};;
    relationship: one_to_many
  }
  join: defender_commander_detail {
    from: character_list
    sql_on: ${defenders.defender_commanders} = ${defender_commander_detail.name} ;;
    relationship: many_to_one
  }
}


explore: character_prediction{
  join: character_list {
    view_label: "Character Death"
    sql_on: ${character_prediction.name}=${character_list.name} ;;
    relationship: one_to_one
  }
  join: battle_attacker {
    from: battle
    view_label: "Battles Started By"
    type: full_outer
    sql_on: (${character_prediction.s_no} = ${battle_attacker.attacker_king_id}) or false;;
    relationship: one_to_many
  }
  join: battle_defender {
    from: battle
    view_label: "Battles Defended By"
    type: full_outer
    sql_on: ${character_prediction.s_no} = ${battle_defender.defender_king_id} or false ;;
    relationship: one_to_many
  }

}

explore: character_screentime {
join: char_name {
  sql_on: ${char_name.name} = ${character_screentime.name} ;;
  relationship: one_to_one
}
  join: character_death_detail {
    view_label: "Character Death Details"
    sql_on: ${character_screentime.name} = ${character_death_detail.name} ;;
    relationship: one_to_one
  }
join: cast_info {
  sql_on: ${cast_info.person_role_id} = ${char_name.id} ;;
  relationship: many_to_one
}
join: title {
  sql_on: ${cast_info.movie_id} = ${title.id} ;;
  relationship: many_to_one
}
join: name {
  sql_on: ${name.id} = ${cast_info.person_id} ;;
  relationship: one_to_one
}
}

# FULL OUTER JOIN products ON FALSE

#explore: character_prediction {}
#explore: chracter_screentime {}




# list of characters alive / dead in tv show compared to book
# battles that killed the most characters in book vs. movie
#greatest periods of piece
# who presided over the longest periods of peace (
