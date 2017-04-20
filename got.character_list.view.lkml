view: character_list {
  sql_table_name: GameOfThrones.character_death ;;

  dimension: member_of_house {
    type: string
    sql: CASE WHEN ${TABLE}.Allegiances LIKE '%House%' THEN LTRIM(SUBSTR(${TABLE}.Allegiances, LENGTH("House "), LENGTH(${TABLE}.Allegiances))) END ;;
  }

  dimension: allegiances {
    type: string
    sql: ${TABLE}.Allegiances ;;
  }

  dimension: total_house_allegiance {
    type: string
    sql: CASE WHEN ${TABLE}.Allegiances LIKE '%House%' THEN LTRIM(SUBSTR(${TABLE}.Allegiances, LENGTH("House "), LENGTH(${TABLE}.Allegiances))) ELSE LTRIM(${TABLE}.Allegiances) END ;;
  }

  dimension: book_intro_chapter {
    type: number
    sql: ${TABLE}.Book_Intro_Chapter ;;
  }

  dimension: book_of_death {
    type: number
    sql: ${TABLE}.Book_of_Death ;;
  }


  dimension: second_book {
    label: "2. A Clash of Kings"
    type: number
    sql: ${TABLE}.CoK ;;
    group_label: "Book Appearances"
  }

  dimension: death_chapter {
    type: number
    sql: ${TABLE}.Death_Chapter ;;
  }

  dimension: death_year {
    type: number
    sql: ${TABLE}.Death_Year ;;
  }


  dimension: fifth_book {
    label: "5. A Dance With Dragons"
    type: yesno
    sql: ${TABLE}.DwD = 1;;
    group_label: "Book Appearances"

  }

  dimension: fourth_book {
    label: "4. A Feast of Crows"
    type: yesno
    sql: ${TABLE}.FfC = 1;;
    group_label: "Book Appearances"
  }

  dimension: gender {
    type: string
    case: {
      when: {
        sql: ${TABLE}.Gender = 1 ;;
        label: "Male"
      }
      when: {
        sql: ${TABLE}.Gender = 0 ;;
        label: "Female"
      }
      else: "Not Specified"

    }
  }


  dimension: first_book_appearance {
    label: "1. A Game Of Thrones"
    type: yesno
    sql: ${TABLE}.GoT = 1 ;;
    group_label: "Book Appearances"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
    primary_key: yes
  }

  dimension: nobility {
    type: yesno
    sql: ${TABLE}.Nobility = 1 ;;
  }

  dimension: third_book {
    label: "3. A Storm of Swords"
    type: number
    sql: ${TABLE}.SoS ;;
    group_label: "Book Appearances"
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
