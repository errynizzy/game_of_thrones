connection: "lookerdata_publicdata"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     sql_on: ${orders.id} = ${order_items.order_id}
#   }
#
#   join: users {
#     sql_on: ${users.id} = ${orders.user_id}
#   }
# }

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



#explore: character_prediction {}
#explore: chracter_screentime {}
explore: character_list {

}



# list of characters alive / dead in tv show compared to book
# battles that killed the most characters in book vs. movie
#greatest periods of piece
# who presided over the longest periods of peace (
