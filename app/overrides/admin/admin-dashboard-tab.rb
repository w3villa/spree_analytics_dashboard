	Deface::Override.new(
  :virtual_path => "spree/layouts/admin",
  :name => "admin-dashboard-tab",
  :insert_bottom => "[data-hook='admin_tabs']",
  :partial => "spree/admin/hooks/dashboard_tab",
  :disabled => false
)
