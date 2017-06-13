view: character_death_detail {
  sql_table_name: GameOfThrones.character_death_detail ;;

  dimension: name {
    hidden: yes
    type: string
    sql: ${TABLE}.name ;;
    primary_key: yes
  }

  dimension: death_episode {
    type: string
    sql: ${TABLE}.death_episode ;;
    order_by_field: death_episode_number
  }

  dimension: death_episode_number {
    type: number
    sql: CAST(${TABLE}.death_episode as INT64);;
  }

  dimension: death_season {
    type: number
    sql: CAST(${TABLE}.death_season as INT64) ;;
  }

  dimension: execution {
    type: string
    sql: ${TABLE}.execution ;;
  }

  dimension: likelihood_of_return {
    type: number
    sql: ${TABLE}.likelihoodOfReturn ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
