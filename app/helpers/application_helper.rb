module ApplicationHelper
  def new_render_org_tree(org_tree)
    return if org_tree.blank?
    ret = ''
    org_tree.each do |org_id, children|
      org = Organization.find(org_id)
      next unless org # Just in case there's some bad data
      ret += render(partial: 'application/new_org', locals: {org: org, children: children})
    end
    ret.html_safe
  end
end
