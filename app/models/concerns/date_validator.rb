class DateValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        unless value > DateTime.now
            record.errors[attribute] << (options[:message] || "you can't insert a date before now")
        end
    end

    # questo validator mi controlla che il valore di un determinato attributo di tipo DateTime sia maggiore 
    # del DateTime di adesso
end