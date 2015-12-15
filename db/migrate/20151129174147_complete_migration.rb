class CompleteMigration < ActiveRecord::Migration
  def change

    create_table :questions do |t|
      t.string :problem

      t.timestamps null: false
    end
    create_table :challenges do |t|
      t.string :name
      t.boolean :alive

      t.timestamps null: false
    end
    create_table :answers do |t|
      t.boolean :correct
      t.string :answer_body
      t.references :question
      t.timestamps null: false
    end
    create_table :messages do |t|
      t.references :sender, index: true, foreign_key: true
      t.references :receiver, index: true, foreign_key: true
      t.string :subject
      t.text :content

      t.timestamps null: false
    end
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
    create_table :participations do |t|
      t.boolean :complete
      t.references :user, index: true, foreign_key: true
      t.references :challenge, index: true, foreign_key: true
      t.timestamps null: false
    end
    create_table :tags do |t|
      t.string :name
      t.timestamps null: false
    end
    create_table :selections do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :feeder, index: true, foreign_key: true
      t.timestamps null: false
    end
    create_table :elements do |t|
      t.references :challenge, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.timestamps null: false
    end
    create_table :feeders do |t|
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
    create_table :feeds do |t|
      t.integer :priority
      t.references :feeder, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.timestamps null: false
    end
    create_table :repleys do |t|
      t.references :user, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.references :answer, index: true, foreign_key: true
      t.timestamps null: false
    end
    create_table :ties do |t|
      t.references :question, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
    create_table :groups do |t|
      t.string :name

      t.timestamps null: false
    end
    create_table :memberships do |t|
      t.references :user, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end

  end
end
