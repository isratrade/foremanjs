# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20141112165600) do

  create_table "architectures", :force => true do |t|
    t.string   "name",                            :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "hosts_count",      :default => 0
    t.integer  "hostgroups_count", :default => 0
  end

  create_table "architectures_operatingsystems", :id => false, :force => true do |t|
    t.integer "architecture_id",    :null => false
    t.integer "operatingsystem_id", :null => false
  end

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         :default => 0
    t.string   "comment"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.datetime "created_at"
    t.string   "remote_address"
    t.text     "auditable_name"
    t.string   "associated_name"
  end

  add_index "audits", ["associated_id", "associated_type"], :name => "associated_index"
  add_index "audits", ["associated_id", "associated_type"], :name => "auditable_parent_index"
  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["id"], :name => "index_audits_on_id"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "auth_sources", :force => true do |t|
    t.string   "type",              :default => "",      :null => false
    t.string   "name",              :default => "",      :null => false
    t.string   "host"
    t.integer  "port"
    t.string   "account"
    t.string   "account_password"
    t.string   "base_dn"
    t.string   "attr_login"
    t.string   "attr_firstname"
    t.string   "attr_lastname"
    t.string   "attr_mail"
    t.boolean  "onthefly_register", :default => false,   :null => false
    t.boolean  "tls",               :default => false,   :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "ldap_filter"
    t.string   "attr_photo"
    t.string   "server_type",       :default => "posix"
    t.string   "groups_base"
  end

  create_table "bookmarks", :force => true do |t|
    t.string  "name"
    t.text    "query"
    t.string  "controller"
    t.boolean "public"
    t.integer "owner_id"
    t.string  "owner_type"
  end

  add_index "bookmarks", ["controller"], :name => "index_bookmarks_on_controller"
  add_index "bookmarks", ["name"], :name => "index_bookmarks_on_name"
  add_index "bookmarks", ["owner_id", "owner_type"], :name => "index_bookmarks_on_owner_id_and_owner_type"

  create_table "cached_user_roles", :force => true do |t|
    t.integer  "user_id",      :null => false
    t.integer  "role_id",      :null => false
    t.integer  "user_role_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "cached_user_roles", ["role_id"], :name => "index_cached_user_roles_on_role_id"
  add_index "cached_user_roles", ["user_id"], :name => "index_cached_user_roles_on_user_id"
  add_index "cached_user_roles", ["user_role_id"], :name => "index_cached_user_roles_on_user_role_id"

  create_table "cached_usergroup_members", :force => true do |t|
    t.integer  "user_id"
    t.integer  "usergroup_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "cached_usergroup_members", ["user_id"], :name => "index_cached_usergroup_members_on_user_id"
  add_index "cached_usergroup_members", ["usergroup_id"], :name => "index_cached_usergroup_members_on_usergroup_id"

  create_table "compute_attributes", :force => true do |t|
    t.integer  "compute_profile_id"
    t.integer  "compute_resource_id"
    t.string   "name"
    t.text     "vm_attrs"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "compute_attributes", ["compute_profile_id"], :name => "index_compute_attributes_on_compute_profile_id"
  add_index "compute_attributes", ["compute_resource_id"], :name => "index_compute_attributes_on_compute_resource_id"

  create_table "compute_profiles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "compute_resources", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "url"
    t.string   "user"
    t.text     "password"
    t.string   "uuid"
    t.string   "type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "attrs"
  end

  create_table "config_group_classes", :force => true do |t|
    t.integer  "puppetclass_id"
    t.integer  "config_group_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "config_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "hosts_count",                :default => 0
    t.integer  "hostgroups_count",           :default => 0
    t.integer  "config_group_classes_count", :default => 0
  end

  create_table "config_templates", :force => true do |t|
    t.string   "name"
    t.text     "template"
    t.boolean  "snippet"
    t.integer  "template_kind_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "locked",           :default => false
    t.boolean  "default",          :default => false
    t.string   "vendor"
  end

  create_table "config_templates_operatingsystems", :id => false, :force => true do |t|
    t.integer "config_template_id", :null => false
    t.integer "operatingsystem_id", :null => false
  end

  create_table "domains", :force => true do |t|
    t.string   "name",             :default => "", :null => false
    t.string   "fullname"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "dns_id"
    t.integer  "hosts_count",      :default => 0
    t.integer  "hostgroups_count", :default => 0
  end

  create_table "environment_classes", :force => true do |t|
    t.integer "puppetclass_id", :null => false
    t.integer "environment_id", :null => false
    t.integer "lookup_key_id"
  end

  add_index "environment_classes", ["environment_id"], :name => "index_environments_puppetclasses_on_environment_id"
  add_index "environment_classes", ["puppetclass_id"], :name => "index_environments_puppetclasses_on_puppetclass_id"

  create_table "environments", :force => true do |t|
    t.string   "name",                            :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "hosts_count",      :default => 0
    t.integer  "hostgroups_count", :default => 0
  end

  create_table "external_usergroups", :force => true do |t|
    t.string  "name",           :null => false
    t.integer "auth_source_id", :null => false
    t.integer "usergroup_id",   :null => false
  end

  add_index "external_usergroups", ["usergroup_id"], :name => "index_external_usergroups_on_usergroup_id"

  create_table "fact_names", :force => true do |t|
    t.string   "name",                               :null => false
    t.datetime "updated_at"
    t.datetime "created_at"
    t.boolean  "compose",    :default => false,      :null => false
    t.string   "short_name"
    t.string   "type",       :default => "FactName"
    t.string   "ancestry"
  end

  add_index "fact_names", ["ancestry"], :name => "index_fact_names_on_ancestry"
  add_index "fact_names", ["name", "type"], :name => "index_fact_names_on_name_and_type", :unique => true

  create_table "fact_values", :force => true do |t|
    t.text     "value"
    t.integer  "fact_name_id", :null => false
    t.integer  "host_id",      :null => false
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "fact_values", ["fact_name_id", "host_id"], :name => "index_fact_values_on_fact_name_id_and_host_id", :unique => true
  add_index "fact_values", ["fact_name_id"], :name => "index_fact_values_on_fact_name_id"
  add_index "fact_values", ["host_id"], :name => "index_fact_values_on_host_id"

  create_table "features", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "features_smart_proxies", :id => false, :force => true do |t|
    t.integer "smart_proxy_id"
    t.integer "feature_id"
  end

  create_table "filterings", :force => true do |t|
    t.integer  "filter_id"
    t.integer  "permission_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "filterings", ["filter_id"], :name => "index_filterings_on_filter_id"
  add_index "filterings", ["permission_id"], :name => "index_filterings_on_permission_id"

  create_table "filters", :force => true do |t|
    t.text     "search"
    t.integer  "role_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.text     "taxonomy_search"
  end

  create_table "host_classes", :force => true do |t|
    t.integer "puppetclass_id", :null => false
    t.integer "host_id",        :null => false
  end

  create_table "host_config_groups", :force => true do |t|
    t.integer  "config_group_id"
    t.integer  "host_id"
    t.string   "host_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "hostgroup_classes", :force => true do |t|
    t.integer "hostgroup_id",   :null => false
    t.integer "puppetclass_id", :null => false
  end

  add_index "hostgroup_classes", ["hostgroup_id"], :name => "index_hostgroups_puppetclasses_on_hostgroup_id"
  add_index "hostgroup_classes", ["puppetclass_id"], :name => "index_hostgroups_puppetclasses_on_puppetclass_id"

  create_table "hostgroups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.integer  "environment_id"
    t.integer  "operatingsystem_id"
    t.integer  "architecture_id"
    t.integer  "medium_id"
    t.integer  "ptable_id"
    t.string   "root_pass"
    t.integer  "puppet_ca_proxy_id"
    t.boolean  "use_image"
    t.string   "image_file",         :limit => 128
    t.string   "ancestry"
    t.text     "vm_defaults"
    t.integer  "subnet_id"
    t.integer  "domain_id"
    t.integer  "puppet_proxy_id"
    t.string   "title"
    t.integer  "realm_id"
    t.integer  "compute_profile_id"
    t.string   "grub_pass",                         :default => ""
  end

  add_index "hostgroups", ["ancestry"], :name => "index_hostgroups_on_ancestry"
  add_index "hostgroups", ["compute_profile_id"], :name => "index_hostgroups_on_compute_profile_id"

  create_table "hosts", :force => true do |t|
    t.string   "name",                                                  :null => false
    t.string   "ip"
    t.datetime "last_compile"
    t.datetime "last_freshcheck"
    t.datetime "last_report"
    t.datetime "updated_at"
    t.integer  "source_file_id"
    t.datetime "created_at"
    t.string   "mac",                                :default => ""
    t.string   "root_pass"
    t.string   "serial"
    t.integer  "puppet_status",       :limit => 8,   :default => 0,     :null => false
    t.integer  "domain_id"
    t.integer  "architecture_id"
    t.integer  "operatingsystem_id"
    t.integer  "environment_id"
    t.integer  "subnet_id"
    t.integer  "ptable_id"
    t.integer  "medium_id"
    t.boolean  "build",                              :default => false
    t.text     "comment"
    t.text     "disk"
    t.datetime "installed_at"
    t.integer  "model_id"
    t.integer  "hostgroup_id"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.boolean  "enabled",                            :default => true
    t.integer  "puppet_ca_proxy_id"
    t.boolean  "managed",                            :default => false, :null => false
    t.boolean  "use_image"
    t.string   "image_file",          :limit => 128
    t.string   "uuid"
    t.integer  "compute_resource_id"
    t.integer  "puppet_proxy_id"
    t.string   "certname"
    t.integer  "image_id"
    t.integer  "organization_id"
    t.integer  "location_id"
    t.string   "type"
    t.string   "otp"
    t.integer  "realm_id"
    t.integer  "compute_profile_id"
    t.string   "provision_method"
    t.string   "primary_interface"
    t.string   "grub_pass",                          :default => ""
  end

  add_index "hosts", ["architecture_id"], :name => "host_arch_id_ix"
  add_index "hosts", ["certname"], :name => "index_hosts_on_certname"
  add_index "hosts", ["compute_profile_id"], :name => "index_hosts_on_compute_profile_id"
  add_index "hosts", ["domain_id"], :name => "host_domain_id_ix"
  add_index "hosts", ["environment_id"], :name => "host_env_id_ix"
  add_index "hosts", ["hostgroup_id"], :name => "host_group_id_ix"
  add_index "hosts", ["installed_at"], :name => "index_hosts_on_installed_at"
  add_index "hosts", ["last_report"], :name => "index_hosts_on_last_report"
  add_index "hosts", ["medium_id"], :name => "host_medium_id_ix"
  add_index "hosts", ["name"], :name => "index_hosts_on_name"
  add_index "hosts", ["operatingsystem_id"], :name => "host_os_id_ix"
  add_index "hosts", ["puppet_status"], :name => "index_hosts_on_puppet_status"
  add_index "hosts", ["source_file_id"], :name => "index_hosts_on_source_file_id"
  add_index "hosts", ["type"], :name => "index_hosts_on_type"

  create_table "images", :force => true do |t|
    t.integer  "operatingsystem_id"
    t.integer  "compute_resource_id"
    t.integer  "architecture_id"
    t.string   "uuid"
    t.string   "username"
    t.string   "name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "iam_role"
    t.boolean  "user_data",           :default => false
    t.string   "password"
  end

  create_table "key_pairs", :force => true do |t|
    t.text     "secret"
    t.integer  "compute_resource_id"
    t.string   "name"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.text     "public"
  end

  create_table "locations_organizations", :id => false, :force => true do |t|
    t.integer "location_id"
    t.integer "organization_id"
  end

  create_table "logs", :force => true do |t|
    t.integer  "source_id"
    t.integer  "message_id"
    t.integer  "report_id"
    t.integer  "level_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "logs", ["level_id"], :name => "index_logs_on_level_id"
  add_index "logs", ["message_id"], :name => "index_logs_on_message_id"
  add_index "logs", ["report_id"], :name => "index_logs_on_report_id"

  create_table "lookup_keys", :force => true do |t|
    t.string   "key"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "puppetclass_id"
    t.text     "default_value"
    t.string   "path"
    t.string   "description"
    t.string   "validator_type"
    t.string   "validator_rule"
    t.boolean  "is_param",            :default => false
    t.string   "key_type"
    t.boolean  "override",            :default => false
    t.boolean  "required",            :default => false
    t.integer  "lookup_values_count", :default => 0
    t.boolean  "merge_overrides"
    t.boolean  "avoid_duplicates"
    t.boolean  "use_puppet_default"
  end

  add_index "lookup_keys", ["key"], :name => "index_lookup_keys_on_key"
  add_index "lookup_keys", ["path"], :name => "index_lookup_keys_on_path"
  add_index "lookup_keys", ["puppetclass_id"], :name => "index_lookup_keys_on_puppetclass_id"

  create_table "lookup_values", :force => true do |t|
    t.string   "match"
    t.text     "value"
    t.integer  "lookup_key_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.boolean  "use_puppet_default", :default => false
  end

  add_index "lookup_values", ["match"], :name => "index_lookup_values_on_match"
  add_index "lookup_values", ["match"], :name => "index_lookup_values_on_priority"

  create_table "mail_notifications", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "mailer"
    t.string   "method"
    t.boolean  "subscriptable",     :default => true
    t.string   "default_interval"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "subscription_type"
  end

  create_table "media", :force => true do |t|
    t.string   "name",        :default => "", :null => false
    t.string   "path",        :default => "", :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "media_path"
    t.string   "config_path"
    t.string   "image_path"
    t.string   "os_family"
  end

  create_table "media_operatingsystems", :id => false, :force => true do |t|
    t.integer "medium_id",          :null => false
    t.integer "operatingsystem_id", :null => false
  end

  create_table "messages", :force => true do |t|
    t.text   "value"
    t.string "digest"
  end

  add_index "messages", ["digest"], :name => "index_messages_on_digest"

  create_table "models", :force => true do |t|
    t.string   "name",                          :null => false
    t.text     "info"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "vendor_class"
    t.string   "hardware_model"
    t.integer  "hosts_count",    :default => 0
  end

  create_table "nics", :force => true do |t|
    t.string   "mac"
    t.string   "ip"
    t.string   "type"
    t.string   "name"
    t.integer  "host_id"
    t.integer  "subnet_id"
    t.integer  "domain_id"
    t.text     "attrs"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "provider"
    t.string   "username"
    t.string   "password"
    t.boolean  "virtual",          :default => false,        :null => false
    t.boolean  "link",             :default => true,         :null => false
    t.string   "identifier"
    t.string   "tag",              :default => "",           :null => false
    t.string   "attached_to",      :default => "",           :null => false
    t.boolean  "managed",          :default => true
    t.string   "mode",             :default => "balance-rr", :null => false
    t.string   "attached_devices", :default => "",           :null => false
    t.string   "bond_options",     :default => "",           :null => false
  end

  add_index "nics", ["host_id"], :name => "index_by_host"
  add_index "nics", ["type", "id"], :name => "index_by_type_and_id"
  add_index "nics", ["type"], :name => "index_by_type"

  create_table "operatingsystems", :force => true do |t|
    t.string   "major",            :limit => 5,  :default => "",    :null => false
    t.string   "name"
    t.string   "minor",            :limit => 16, :default => "",    :null => false
    t.string   "nameindicator",    :limit => 3
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.string   "release_name"
    t.string   "type"
    t.string   "description"
    t.integer  "hosts_count",                    :default => 0
    t.integer  "hostgroups_count",               :default => 0
    t.string   "password_hash",                  :default => "MD5"
    t.string   "title"
  end

  add_index "operatingsystems", ["type"], :name => "index_operatingsystems_on_type"

  create_table "operatingsystems_ptables", :id => false, :force => true do |t|
    t.integer "ptable_id",          :null => false
    t.integer "operatingsystem_id", :null => false
  end

  create_table "operatingsystems_puppetclasses", :id => false, :force => true do |t|
    t.integer "puppetclass_id",     :null => false
    t.integer "operatingsystem_id", :null => false
  end

  create_table "os_default_templates", :force => true do |t|
    t.integer  "config_template_id"
    t.integer  "template_kind_id"
    t.integer  "operatingsystem_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "parameters", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.integer  "reference_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "type"
    t.integer  "priority"
    t.boolean  "hidden_value", :default => false
  end

  add_index "parameters", ["reference_id", "type"], :name => "index_parameters_on_host_id_and_type"
  add_index "parameters", ["type", "reference_id", "name"], :name => "index_parameters_on_type_and_reference_id_and_name", :unique => true
  add_index "parameters", ["type"], :name => "index_parameters_on_type"

  create_table "permissions", :force => true do |t|
    t.string   "name",          :null => false
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "permissions", ["name", "resource_type"], :name => "index_permissions_on_name_and_resource_type"

  create_table "ptables", :force => true do |t|
    t.string   "name",                       :null => false
    t.string   "layout",     :limit => 4096, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "os_family"
  end

  create_table "puppetclasses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "total_hosts",               :default => 0
    t.integer  "hostgroups_count",          :default => 0
    t.integer  "global_class_params_count", :default => 0
    t.integer  "lookup_keys_count",         :default => 0
  end

  add_index "puppetclasses", ["name"], :name => "index_puppetclasses_on_name"

  create_table "realms", :force => true do |t|
    t.string   "name",             :default => "", :null => false
    t.string   "realm_type"
    t.integer  "realm_proxy_id"
    t.integer  "hosts_count",      :default => 0
    t.integer  "hostgroups_count", :default => 0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "realms", ["name"], :name => "index_realms_on_name", :unique => true

  create_table "reports", :force => true do |t|
    t.integer  "host_id",                  :null => false
    t.datetime "reported_at"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "status",      :limit => 8
    t.text     "metrics"
  end

  add_index "reports", ["host_id"], :name => "index_reports_on_host_id"
  add_index "reports", ["reported_at", "host_id"], :name => "index_reports_on_reported_at_and_host_id"
  add_index "reports", ["reported_at"], :name => "index_reports_on_reported_at"
  add_index "reports", ["status"], :name => "index_reports_on_status"

  create_table "roles", :force => true do |t|
    t.string  "name"
    t.integer "builtin"
    t.text    "permissions"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "settings", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.text     "description"
    t.string   "category"
    t.string   "settings_type"
    t.text     "default",       :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "settings", ["category"], :name => "index_settings_on_category"
  add_index "settings", ["name"], :name => "index_settings_on_name", :unique => true

  create_table "smart_proxies", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sources", :force => true do |t|
    t.text   "value"
    t.string "digest"
  end

  add_index "sources", ["digest"], :name => "index_sources_on_digest"

  create_table "subnet_domains", :force => true do |t|
    t.integer  "domain_id"
    t.integer  "subnet_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subnets", :force => true do |t|
    t.string   "network",       :limit => 15
    t.string   "mask",          :limit => 15
    t.integer  "priority"
    t.text     "name"
    t.string   "vlanid",        :limit => 10
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.integer  "dhcp_id"
    t.integer  "tftp_id"
    t.string   "gateway"
    t.string   "dns_primary"
    t.string   "dns_secondary"
    t.string   "from"
    t.string   "to"
    t.integer  "dns_id"
    t.string   "boot_mode",                   :default => "Static", :null => false
    t.string   "ipam",                        :default => "DHCP",   :null => false
  end

  create_table "taxable_taxonomies", :force => true do |t|
    t.integer  "taxonomy_id"
    t.integer  "taxable_id"
    t.string   "taxable_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "taxable_taxonomies", ["taxable_id", "taxable_type", "taxonomy_id"], :name => "taxable_index"
  add_index "taxable_taxonomies", ["taxable_id", "taxable_type"], :name => "index_taxable_taxonomies_on_taxable_id_and_taxable_type"
  add_index "taxable_taxonomies", ["taxonomy_id"], :name => "index_taxable_taxonomies_on_taxonomy_id"

  create_table "taxonomies", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.text     "ignore_types"
    t.string   "ancestry"
    t.string   "title"
  end

  add_index "taxonomies", ["ancestry"], :name => "index_taxonomies_on_ancestry"

  create_table "template_combinations", :force => true do |t|
    t.integer  "config_template_id"
    t.integer  "hostgroup_id"
    t.integer  "environment_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "template_kinds", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tokens", :force => true do |t|
    t.string   "value"
    t.datetime "expires"
    t.integer  "host_id"
  end

  add_index "tokens", ["host_id"], :name => "index_tokens_on_host_id"
  add_index "tokens", ["value"], :name => "index_tokens_on_value"

  create_table "trend_counters", :force => true do |t|
    t.integer  "trend_id"
    t.integer  "count"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "trend_counters", ["trend_id"], :name => "index_trend_counters_on_trend_id"

  create_table "trends", :force => true do |t|
    t.string   "trendable_type"
    t.integer  "trendable_id"
    t.string   "name"
    t.string   "type"
    t.string   "fact_value"
    t.string   "fact_name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "trends", ["fact_value"], :name => "index_trends_on_fact_value"
  add_index "trends", ["trendable_type", "trendable_id"], :name => "index_trends_on_trendable_type_and_trendable_id"
  add_index "trends", ["type"], :name => "index_trends_on_type"

  create_table "user_mail_notifications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "mail_notification_id"
    t.datetime "last_sent"
    t.string   "interval"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "user_roles", :force => true do |t|
    t.integer "owner_id",                       :null => false
    t.integer "role_id"
    t.string  "owner_type", :default => "User", :null => false
  end

  add_index "user_roles", ["owner_id", "owner_type"], :name => "index_user_roles_on_owner_id_and_owner_type"
  add_index "user_roles", ["owner_id"], :name => "index_user_roles_on_owner_id"
  add_index "user_roles", ["owner_type"], :name => "index_user_roles_on_owner_type"

  create_table "usergroup_members", :force => true do |t|
    t.integer "member_id"
    t.string  "member_type"
    t.integer "usergroup_id"
  end

  create_table "usergroups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "admin",      :default => false, :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "mail"
    t.boolean  "admin",                                  :default => false, :null => false
    t.datetime "last_login_on"
    t.integer  "auth_source_id"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.string   "password_hash",           :limit => 128
    t.string   "password_salt",           :limit => 128
    t.string   "locale",                  :limit => 5
    t.string   "avatar_hash",             :limit => 128
    t.integer  "default_organization_id"
    t.integer  "default_location_id"
    t.string   "lower_login"
    t.boolean  "mail_enabled",                           :default => true
  end

  add_index "users", ["lower_login"], :name => "index_users_on_lower_login", :unique => true

  add_foreign_key "architectures_operatingsystems", "architectures", :name => "architectures_operatingsystems_architecture_id_fk"
  add_foreign_key "architectures_operatingsystems", "operatingsystems", :name => "architectures_operatingsystems_operatingsystem_id_fk"

  add_foreign_key "audits", "users", :name => "audits_user_id_fk"

  add_foreign_key "compute_attributes", "compute_profiles", :name => "compute_attributes_compute_profile_id_fk"
  add_foreign_key "compute_attributes", "compute_resources", :name => "compute_attributes_compute_resource_id_fk"

  add_foreign_key "config_templates", "template_kinds", :name => "config_templates_template_kind_id_fk"

  add_foreign_key "config_templates_operatingsystems", "config_templates", :name => "config_templates_operatingsystems_config_template_id_fk"
  add_foreign_key "config_templates_operatingsystems", "operatingsystems", :name => "config_templates_operatingsystems_operatingsystem_id_fk"

  add_foreign_key "domains", "smart_proxies", :name => "domains_dns_id_fk", :column => "dns_id"

  add_foreign_key "environment_classes", "environments", :name => "environment_classes_environment_id_fk"
  add_foreign_key "environment_classes", "lookup_keys", :name => "environment_classes_lookup_key_id_fk"
  add_foreign_key "environment_classes", "puppetclasses", :name => "environment_classes_puppetclass_id_fk"

  add_foreign_key "external_usergroups", "auth_sources", :name => "external_usergroups_auth_source_id_fk"
  add_foreign_key "external_usergroups", "usergroups", :name => "external_usergroups_usergroup_id_fk"

  add_foreign_key "fact_values", "fact_names", :name => "fact_values_fact_name_id_fk"
  add_foreign_key "fact_values", "hosts", :name => "fact_values_host_id_fk"

  add_foreign_key "features_smart_proxies", "features", :name => "features_smart_proxies_feature_id_fk"
  add_foreign_key "features_smart_proxies", "smart_proxies", :name => "features_smart_proxies_smart_proxy_id_fk"

  add_foreign_key "filterings", "filters", :name => "filterings_filters_id_fk"
  add_foreign_key "filterings", "permissions", :name => "filterings_permissions_id_fk"

  add_foreign_key "filters", "roles", :name => "filters_roles_id_fk"

  add_foreign_key "host_classes", "hosts", :name => "host_classes_host_id_fk"
  add_foreign_key "host_classes", "puppetclasses", :name => "host_classes_puppetclass_id_fk"

  add_foreign_key "hostgroup_classes", "hostgroups", :name => "hostgroup_classes_hostgroup_id_fk"
  add_foreign_key "hostgroup_classes", "puppetclasses", :name => "hostgroup_classes_puppetclass_id_fk"

  add_foreign_key "hostgroups", "architectures", :name => "hostgroups_architecture_id_fk"
  add_foreign_key "hostgroups", "compute_profiles", :name => "hostgroups_compute_profile_id_fk"
  add_foreign_key "hostgroups", "domains", :name => "hostgroups_domain_id_fk"
  add_foreign_key "hostgroups", "environments", :name => "hostgroups_environment_id_fk"
  add_foreign_key "hostgroups", "media", :name => "hostgroups_medium_id_fk"
  add_foreign_key "hostgroups", "operatingsystems", :name => "hostgroups_operatingsystem_id_fk"
  add_foreign_key "hostgroups", "ptables", :name => "hostgroups_ptable_id_fk"
  add_foreign_key "hostgroups", "realms", :name => "hostgroups_realms_id_fk"
  add_foreign_key "hostgroups", "smart_proxies", :name => "hostgroups_puppet_ca_proxy_id_fk", :column => "puppet_ca_proxy_id"
  add_foreign_key "hostgroups", "smart_proxies", :name => "hostgroups_puppet_proxy_id_fk", :column => "puppet_proxy_id"
  add_foreign_key "hostgroups", "subnets", :name => "hostgroups_subnet_id_fk"

  add_foreign_key "hosts", "architectures", :name => "hosts_architecture_id_fk"
  add_foreign_key "hosts", "compute_profiles", :name => "hosts_compute_profile_id_fk"
  add_foreign_key "hosts", "compute_resources", :name => "hosts_compute_resource_id_fk"
  add_foreign_key "hosts", "domains", :name => "hosts_domain_id_fk"
  add_foreign_key "hosts", "environments", :name => "hosts_environment_id_fk"
  add_foreign_key "hosts", "hostgroups", :name => "hosts_hostgroup_id_fk"
  add_foreign_key "hosts", "images", :name => "hosts_image_id_fk"
  add_foreign_key "hosts", "media", :name => "hosts_medium_id_fk"
  add_foreign_key "hosts", "models", :name => "hosts_model_id_fk"
  add_foreign_key "hosts", "operatingsystems", :name => "hosts_operatingsystem_id_fk"
  add_foreign_key "hosts", "ptables", :name => "hosts_ptable_id_fk"
  add_foreign_key "hosts", "realms", :name => "hosts_realms_id_fk"
  add_foreign_key "hosts", "smart_proxies", :name => "hosts_puppet_ca_proxy_id_fk", :column => "puppet_ca_proxy_id"
  add_foreign_key "hosts", "smart_proxies", :name => "hosts_puppet_proxy_id_fk", :column => "puppet_proxy_id"
  add_foreign_key "hosts", "subnets", :name => "hosts_subnet_id_fk"
  add_foreign_key "hosts", "taxonomies", :name => "hosts_location_id_fk", :column => "location_id"
  add_foreign_key "hosts", "taxonomies", :name => "hosts_organization_id_fk", :column => "organization_id"

  add_foreign_key "images", "architectures", :name => "images_architecture_id_fk"
  add_foreign_key "images", "compute_resources", :name => "images_compute_resource_id_fk"
  add_foreign_key "images", "operatingsystems", :name => "images_operatingsystem_id_fk"

  add_foreign_key "key_pairs", "compute_resources", :name => "key_pairs_compute_resource_id_fk"

  add_foreign_key "lookup_keys", "puppetclasses", :name => "lookup_keys_puppetclass_id_fk"

  add_foreign_key "lookup_values", "lookup_keys", :name => "lookup_values_lookup_key_id_fk"

  add_foreign_key "media_operatingsystems", "media", :name => "media_operatingsystems_medium_id_fk"
  add_foreign_key "media_operatingsystems", "operatingsystems", :name => "media_operatingsystems_operatingsystem_id_fk"

  add_foreign_key "nics", "domains", :name => "nics_domain_id_fk"
  add_foreign_key "nics", "hosts", :name => "nics_host_id_fk"
  add_foreign_key "nics", "subnets", :name => "nics_subnet_id_fk"

  add_foreign_key "operatingsystems_ptables", "operatingsystems", :name => "operatingsystems_ptables_operatingsystem_id_fk"
  add_foreign_key "operatingsystems_ptables", "ptables", :name => "operatingsystems_ptables_ptable_id_fk"

  add_foreign_key "operatingsystems_puppetclasses", "operatingsystems", :name => "operatingsystems_puppetclasses_operatingsystem_id_fk"
  add_foreign_key "operatingsystems_puppetclasses", "puppetclasses", :name => "operatingsystems_puppetclasses_puppetclass_id_fk"

  add_foreign_key "os_default_templates", "config_templates", :name => "os_default_templates_config_template_id_fk"
  add_foreign_key "os_default_templates", "operatingsystems", :name => "os_default_templates_operatingsystem_id_fk"
  add_foreign_key "os_default_templates", "template_kinds", :name => "os_default_templates_template_kind_id_fk"

  add_foreign_key "realms", "smart_proxies", :name => "realms_realm_proxy_id_fk", :column => "realm_proxy_id"

  add_foreign_key "reports", "hosts", :name => "reports_host_id_fk"

  add_foreign_key "subnet_domains", "domains", :name => "subnet_domains_domain_id_fk"
  add_foreign_key "subnet_domains", "subnets", :name => "subnet_domains_subnet_id_fk"

  add_foreign_key "subnets", "smart_proxies", :name => "subnets_dhcp_id_fk", :column => "dhcp_id"
  add_foreign_key "subnets", "smart_proxies", :name => "subnets_dns_id_fk", :column => "dns_id"
  add_foreign_key "subnets", "smart_proxies", :name => "subnets_tftp_id_fk", :column => "tftp_id"

  add_foreign_key "taxable_taxonomies", "taxonomies", :name => "taxable_taxonomies_taxonomy_id_fk"

  add_foreign_key "template_combinations", "config_templates", :name => "template_combinations_config_template_id_fk"
  add_foreign_key "template_combinations", "environments", :name => "template_combinations_environment_id_fk"
  add_foreign_key "template_combinations", "hostgroups", :name => "template_combinations_hostgroup_id_fk"

  add_foreign_key "tokens", "hosts", :name => "tokens_host_id_fk"

  add_foreign_key "trend_counters", "trends", :name => "trend_counters_trend_id_fk"

  add_foreign_key "user_mail_notifications", "mail_notifications", :name => "user_mail_notifications_mail_notification_id_fk"
  add_foreign_key "user_mail_notifications", "users", :name => "user_mail_notifications_user_id_fk"

  add_foreign_key "user_roles", "roles", :name => "user_roles_role_id_fk"

  add_foreign_key "usergroup_members", "usergroups", :name => "usergroup_members_usergroup_id_fk"

  add_foreign_key "users", "auth_sources", :name => "users_auth_source_id_fk"

end
