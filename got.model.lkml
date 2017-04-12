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
  view_label: "Game of Thrones Battles (TV)"
  join: attackers {
    from: character_prediction
    sql_on: ${battle.attacker_king_id} = ${attackers.s_no};;
    relationship: many_to_one
  }
  join: defenders {
    from: character_prediction
    sql_on: ${battle.defender_king_id} = ${defenders.s_no} ;;
    relationship: many_to_one
  }
}

explore: character_list {
  join: character_screentime {
    sql_on: ${character_list.name} = ${character_screentime.name} ;;
    relationship: one_to_one
  }
  join:  character_death_detail {
    sql_on: ${character_death_detail.name} = ${character_list.name} ;;
    relationship: one_to_one
  }
}

#explore: character_prediction {}
#explore: chracter_screentime {}
#explore: chracter_detah_detail {}



# list of characters alive / dead in tv show compared to book
# battles that killed the most characters in book vs. movie
#greatest periods of piece
# who presided over the longest periods of peace (
