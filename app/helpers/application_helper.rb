module ApplicationHelper
  def new_render_org_tree(org_tree)
    return if org_tree.blank?
    #puts org_tree.inspect
    ret = ''
    org_tree.each do |org_id, children|
      org = Organization.find(org_id)
      puts org.name.inspect
      next unless org # Just in case there's some bad data
      ret += render(partial: 'application/new_org', locals: {org: org, children: children})
    end
    ret.html_safe
  end
end
