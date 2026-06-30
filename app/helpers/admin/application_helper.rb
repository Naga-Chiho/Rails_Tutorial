module Admin
    module ApplicationHelper
        def admin_page_title(page_title = '')
            base_title = 'Railsチュートリアル(管理者)'

            page_title.empty? ? base_title : page_title + " | " + base_title
        end
    end
end
