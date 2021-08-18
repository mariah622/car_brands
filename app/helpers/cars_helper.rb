module CarsHelper
    def new_header_brand 
        if @brand 
            content_tag(:h1, "Create a #{@brand.name} Car:")
        else 
            content_tag(:h1, "Create Car: ")
        end 
    end


end

