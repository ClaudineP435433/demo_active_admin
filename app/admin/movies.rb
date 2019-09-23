ActiveAdmin.register Movie do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #

  # actions :edit, :destroy, :index

  permit_params :id,
    :title,
    :year,
    :syllabus,
    :director_id


  index do
    selectable_column
    column "N°", :id
    column :title
    column :year
    column "Résumé" do |movie|
      movie.syllabus
    end
    column "Réalisation" do |movie|
      movie.director.last_name
    end
    actions
  end

  show do
    attributes_table do
      row "N°", :id
      row :title
      row :year
      row "Résumé" do |movie|
        movie.syllabus
      end
      row "Réalisation" do |movie|
        movie.director.last_name
      end
    end
    panel "Réalisateur en détail" do

    end
  end

  filter :year

  form do |f|
    f.inputs do
      f.input :title
      f.input :year
      f.input :syllabus
      f.input :director
      f.button :submit
    end
  end

end
