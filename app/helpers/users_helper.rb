module UsersHelper
  def div_for_boolean(value, id=nil)
    class_string = if value 
                     " class='icon-ok'"
                   else
                     ""
                   end
    id_string = if id 
                  " id='#{id}'"
                else
                  ""
                end
  
    raw "<div#{id_string}#{class_string}></div>"
  end
  
end
