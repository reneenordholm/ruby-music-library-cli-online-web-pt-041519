module Concerns::Findable

  def find_by_name(name)
    self.all.detect{|a| a.name == name}
  end

  def find_or_create_by_name(name)
    if find_by_name(name)
        find_by_name(name)
    else
      create(name)
    end
  end

  def create(name)
    created_item = self.new(name)
    created_item.save
    created_item
  end
end