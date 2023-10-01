module ApplicationHelper
  def render_tab(name, path, active_tab)
    active_class = active_tab == path ? 'bg-blue-500 text-white' : 'text-blue-500 hover:text-blue-800'
    content_tag :li, class: '-mb-px mr-1' do
      link_to name, path, class: "inline-block py-2 px-4 #{active_class} font-semibold"
    end
  end
end
