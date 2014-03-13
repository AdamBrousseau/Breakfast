class ContactPdf < Prawn::Document

  def initialize(contacts)
    super()

    #Header
    bounding_box [bounds.left, bounds.top], :width  => bounds.width do
        font "Times-Roman"
        text "Contacts", :align => :center, :size => 25
        text "<br>", :inline_format => true
        stroke_horizontal_rule
        text "<br>", :inline_format => true
    end  

    #Formatting for printing each contact record
    @contacts=contacts
    @contacts.each do |contact|
    	font "Times-Roman", :size => 13
    	text "Name\: #{contact.name}"
    	text "Primary Phone\: #{contact.phone1}"
    	text "Secondary Phone\: #{contact.phone2}"
    	text "Email\: #{contact.email}"
    	text "Description\: #{contact.description}"
    	text "<br>", :inline_format => true   
        stroke do
			stroke_color '#d3d3d3'
			dash(5, space: 2, phase: 0)
			horizontal_line(0, 230)
		end
		text "<br>", :inline_format => true
    end

    #Footer
    number_pages "<page>", { :start_count_at => 0, :page_filter => :all, :at => [bounds.right - 50, 0], :align => :right, :size => 12 }
  end

end