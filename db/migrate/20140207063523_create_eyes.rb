class CreateEyes < ActiveRecord::Migration
  def change
    create_table :eyes do |t|
      t.integer :phr_id
      t.datetime :date

      t.float :glass_od_sph
      t.float :glass_od_cyl
      t.integer :glass_od_axis
      t.float :glass_od_prism
      t.string :glass_od_base
      t.float :glass_od_add
      
      t.float :glass_os_sph
      t.float :glass_os_cyl
      t.integer :glass_os_axis
      t.float :glass_os_prism
      t.string :glass_os_base
      t.float :glass_os_add

      t.float :cont_od_pwr
      t.float :cont_od_bc
      t.float :cont_od_dia
      t.float :cont_od_cyl
      t.integer :cont_od_axis
      t.float :cont_od_add
      t.string :cont_od_colour
      t.string :cont_od_brand
      
      t.float :cont_os_pwr
      t.float :cont_os_bc
      t.float :cont_os_dia
      t.float :cont_os_cyl
      t.integer :cont_os_axis
      t.float :cont_os_add
      t.string :cont_os_colour
      t.string :cont_os_brand

      t.string :comment    

      t.timestamps
    end
    add_index :eyes, [:phr_id, :date]
  end
end
