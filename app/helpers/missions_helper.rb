module MissionsHelper
    def mission_due_date(due_date)
        if due_date.nil?
            I18n.t('not_set')
        else
            due_date.strftime("%m/%d %H:%M")
        end
    end
end
