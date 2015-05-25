json.extract! @annonce, :id, :titre, :typeProduit, :prixMini, :prixMaxi, :region, :codePostal, :created_at, :updated_at
$('#people_table').append("<%= j render partial: 'table_row', locals: {person: @person } %>");
$('#new_person_modal').modal_success();