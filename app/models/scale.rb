class Scale < ActiveRecord::Base
  has_many :member_scales, dependent: :destroy
  validates :date, :type_scale , presence: true	
  accepts_nested_attributes_for :member_scales, reject_if: :all_blank, allow_destroy: true
  
  has_enumeration_for :type_scale, with: TypeScale, create_helpers: true
  
  scope :sorted, -> { order(:date) }
  
  def month      
      case date.month
        when 1
          "Janeiro"
        when 2
          "Fevereiro"        
        when 3 
          "Março"        
        when 4        
          "Abril"        
        when 5        
          "Maio"        
        when 6
          "Junho"        
        when 7
          "Julho"        
        when 8
          "Agosto"        
        when 9
          "Setembro"        
        when 10
          "Outubro"        
        when 11
          "Novembro"        
        when 12
          "Dezembro"        
      end
  end
end
