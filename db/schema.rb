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
    t.string   "email"
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

  create_table "containers", :force => true do |t|
    t.string   "name"
    t.string   "command"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "compute_resource_id"
    t.string   "entrypoint"
    t.string   "cpu_set"
    t.float    "cpu_shares"
    t.string   "memory"
    t.boolean  "tty"
    t.boolean  "attach_stdin",        :default => true
    t.boolean  "attach_stdout",       :default => true
    t.boolean  "attach_stderr",       :default => true
    t.integer  "docker_image_id"
    t.integer  "docker_tag_id"
    t.string   "uuid"
  end

  add_index "containers", ["uuid", "compute_resource_id"], :name => "index_containers_on_uuid_and_compute_resource_id"

  create_table "docker_images", :force => true do |t|
    t.string   "image_id"
    t.integer  "size"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "katello_uuid"
    t.integer  "katello_repository_id"
  end

  add_index "docker_images", ["katello_uuid"], :name => "index_docker_images_on_katello_uuid", :unique => true

  create_table "docker_tags", :force => true do |t|
    t.string   "tag"
    t.integer  "docker_image_id",       :null => false
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "katello_repository_id"
  end

  add_index "docker_tags", ["docker_image_id", "katello_repository_id", "tag"], :name => "katello_repo_docker_tags_image_repo_id", :unique => true
  add_index "docker_tags", ["tag", "katello_repository_id"], :name => "katello_docker_tag_repository_id", :unique => true

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
    t.string   "katello_id"
  end

  add_index "environments", ["katello_id"], :name => "index_environments_on_katello_id"

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

  create_table "foreman_tasks_locks", :force => true do |t|
    t.string  "task_id",       :null => false
    t.string  "name",          :null => false
    t.string  "resource_type"
    t.integer "resource_id"
    t.boolean "exclusive"
  end

  add_index "foreman_tasks_locks", ["resource_type", "resource_id"], :name => "index_foreman_tasks_locks_on_resource_type_and_resource_id"

  create_table "foreman_tasks_tasks", :id => false, :force => true do |t|
    t.string   "id"
    t.string   "type",           :null => false
    t.string   "label"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string   "state",          :null => false
    t.string   "result",         :null => false
    t.string   "external_id"
    t.string   "parent_task_id"
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
    t.integer  "content_source_id"
  end

  add_index "hostgroups", ["ancestry"], :name => "index_hostgroups_on_ancestry"
  add_index "hostgroups", ["compute_profile_id"], :name => "index_hostgroups_on_compute_profile_id"
  add_index "hostgroups", ["content_source_id"], :name => "index_hostgroups_on_content_source_id"

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
    t.integer  "content_source_id"
  end

  add_index "hosts", ["architecture_id"], :name => "host_arch_id_ix"
  add_index "hosts", ["certname"], :name => "index_hosts_on_certname"
  add_index "hosts", ["compute_profile_id"], :name => "index_hosts_on_compute_profile_id"
  add_index "hosts", ["content_source_id"], :name => "index_hosts_on_content_source_id"
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

  create_table "katello_activation_keys", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "organization_id",                           :null => false
    t.integer  "environment_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "user_id"
    t.integer  "max_content_hosts"
    t.integer  "content_view_id"
    t.string   "cp_id"
    t.string   "release_version"
    t.boolean  "unlimited_content_hosts", :default => true
  end

  add_index "katello_activation_keys", ["content_view_id"], :name => "index_activation_keys_on_content_view_id"
  add_index "katello_activation_keys", ["cp_id"], :name => "index_katello_activation_keys_on_cp_id"
  add_index "katello_activation_keys", ["environment_id"], :name => "index_activation_keys_on_environment_id"
  add_index "katello_activation_keys", ["name", "organization_id"], :name => "index_activation_keys_on_name_and_organization_id", :unique => true
  add_index "katello_activation_keys", ["organization_id"], :name => "index_activation_keys_on_organization_id"
  add_index "katello_activation_keys", ["user_id"], :name => "index_activation_keys_on_user_id"

  create_table "katello_capsule_lifecycle_environments", :force => true do |t|
    t.integer "capsule_id"
    t.integer "lifecycle_environment_id"
  end

  add_index "katello_capsule_lifecycle_environments", ["capsule_id"], :name => "index_cle_on_capsule_id"
  add_index "katello_capsule_lifecycle_environments", ["lifecycle_environment_id"], :name => "index_cle_on_lifecycle_environment_id"

  create_table "katello_content_view_components", :force => true do |t|
    t.integer  "content_view_version_id"
    t.integer  "content_view_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "katello_content_view_components", ["content_view_version_id", "content_view_id"], :name => "component_content_views_index"

  create_table "katello_content_view_environments", :force => true do |t|
    t.string   "name"
    t.string   "label",                   :null => false
    t.string   "cp_id"
    t.integer  "content_view_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "environment_id",          :null => false
    t.integer  "content_view_version_id"
  end

  add_index "katello_content_view_environments", ["content_view_id"], :name => "index_content_view_environments_on_content_view_id"
  add_index "katello_content_view_environments", ["cp_id"], :name => "index_cve_cp_id", :unique => true
  add_index "katello_content_view_environments", ["environment_id", "content_view_id"], :name => "index_cve_eid_cv_id", :unique => true
  add_index "katello_content_view_environments", ["environment_id"], :name => "index_content_view_environments_on_environment_id"

  create_table "katello_content_view_erratum_filter_rules", :force => true do |t|
    t.integer  "content_view_filter_id"
    t.string   "errata_id"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "types"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "katello_content_view_filters", :force => true do |t|
    t.integer  "content_view_id"
    t.string   "name",                                 :null => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "type"
    t.boolean  "inclusion",         :default => false, :null => false
    t.boolean  "original_packages", :default => false, :null => false
    t.string   "description"
  end

  add_index "katello_content_view_filters", ["content_view_id"], :name => "index_filters_on_content_view_definition_id"
  add_index "katello_content_view_filters", ["name", "content_view_id"], :name => "index_filters_on_name_and_content_view_definition_id", :unique => true

  create_table "katello_content_view_filters_repositories", :id => false, :force => true do |t|
    t.integer "content_view_filter_id"
    t.integer "repository_id"
  end

  add_index "katello_content_view_filters_repositories", ["content_view_filter_id", "repository_id"], :name => "index_filters_repositories_on_filter_id_and_repository_id", :unique => true
  add_index "katello_content_view_filters_repositories", ["content_view_filter_id"], :name => "index_filters_repositories_on_filter_id"
  add_index "katello_content_view_filters_repositories", ["repository_id"], :name => "index_filters_repositories_on_repository_id"

  create_table "katello_content_view_histories", :force => true do |t|
    t.integer  "katello_content_view_version_id", :null => false
    t.integer  "katello_environment_id"
    t.string   "task_id"
    t.string   "user",                            :null => false
    t.string   "status",                          :null => false
    t.text     "notes"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "katello_content_view_histories", ["katello_content_view_version_id"], :name => "index_cvh_cvvid"
  add_index "katello_content_view_histories", ["katello_environment_id"], :name => "index_cvh_environment_id"

  create_table "katello_content_view_package_filter_rules", :force => true do |t|
    t.integer  "content_view_filter_id"
    t.string   "name"
    t.string   "version"
    t.string   "min_version"
    t.string   "max_version"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "katello_content_view_package_group_filter_rules", :force => true do |t|
    t.integer  "content_view_filter_id"
    t.string   "name"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "uuid"
  end

  create_table "katello_content_view_puppet_environments", :force => true do |t|
    t.integer  "content_view_version_id"
    t.integer  "environment_id"
    t.string   "name"
    t.string   "pulp_id",                 :null => false
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "puppet_environment_id"
  end

  add_index "katello_content_view_puppet_environments", ["content_view_version_id"], :name => "index_cvpe_on_content_view_version_id"
  add_index "katello_content_view_puppet_environments", ["environment_id"], :name => "index_cvpe_on_environment_id"
  add_index "katello_content_view_puppet_environments", ["pulp_id"], :name => "index_cvpe_on_pulp_id"

  create_table "katello_content_view_puppet_modules", :force => true do |t|
    t.integer  "content_view_id"
    t.string   "name"
    t.string   "author"
    t.string   "uuid"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "katello_content_view_puppet_modules", ["content_view_id"], :name => "index_katello_content_view_puppet_modules_on_content_view_id"
  add_index "katello_content_view_puppet_modules", ["name", "author", "content_view_id"], :name => "katello_cv_puppet_modules_name_author", :unique => true
  add_index "katello_content_view_puppet_modules", ["name", "content_view_id"], :name => "katello_cv_puppet_modules_name", :unique => true
  add_index "katello_content_view_puppet_modules", ["uuid", "content_view_id"], :name => "katello_cv_puppet_modules_uuid", :unique => true

  create_table "katello_content_view_repositories", :force => true do |t|
    t.integer  "content_view_id"
    t.integer  "repository_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "katello_content_view_repositories", ["content_view_id", "repository_id"], :name => "cvd_repo_index"

  create_table "katello_content_view_versions", :force => true do |t|
    t.integer  "content_view_id"
    t.integer  "version",               :null => false
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "definition_archive_id"
    t.text     "description"
  end

  add_index "katello_content_view_versions", ["id", "content_view_id"], :name => "cvv_cv_index"

  create_table "katello_content_views", :force => true do |t|
    t.string   "name"
    t.string   "label",                              :null => false
    t.string   "description"
    t.integer  "organization_id"
    t.boolean  "default",         :default => false, :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "composite"
    t.integer  "next_version",    :default => 1,     :null => false
  end

  add_index "katello_content_views", ["name", "organization_id"], :name => "index_content_views_on_name_and_organization_id"
  add_index "katello_content_views", ["organization_id", "label"], :name => "index_content_views_on_organization_id_and_label", :unique => true
  add_index "katello_content_views", ["organization_id"], :name => "index_content_views_on_organization_id"

  create_table "katello_custom_info", :force => true do |t|
    t.string   "keyname"
    t.string   "value",           :default => ""
    t.integer  "informable_id"
    t.string   "informable_type"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "org_default",     :default => false
  end

  add_index "katello_custom_info", ["informable_type", "informable_id", "keyname"], :name => "index_custom_info_on_type_id_keyname"

  create_table "katello_distributors", :force => true do |t|
    t.string   "uuid"
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.integer  "environment_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "content_view_id"
  end

  add_index "katello_distributors", ["content_view_id"], :name => "index_distributors_on_content_view_id"
  add_index "katello_distributors", ["environment_id"], :name => "index_distributors_on_environment_id"

  create_table "katello_environment_priors", :id => false, :force => true do |t|
    t.integer "environment_id"
    t.integer "prior_id",       :null => false
  end

  add_index "katello_environment_priors", ["environment_id"], :name => "index_environment_priors_on_environment_id"
  add_index "katello_environment_priors", ["prior_id"], :name => "index_environment_priors_on_prior_id"

  create_table "katello_environments", :force => true do |t|
    t.string   "name",                               :null => false
    t.text     "description"
    t.boolean  "library",         :default => false, :null => false
    t.integer  "organization_id",                    :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "label",                              :null => false
  end

  add_index "katello_environments", ["label", "organization_id"], :name => "index_environments_on_label_and_organization_id", :unique => true
  add_index "katello_environments", ["name", "organization_id"], :name => "index_environments_on_name_and_organization_id", :unique => true
  add_index "katello_environments", ["organization_id"], :name => "index_environments_on_organization_id"

  create_table "katello_errata", :force => true do |t|
    t.string   "uuid",             :null => false
    t.string   "errata_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.datetime "issued"
    t.datetime "updated"
    t.string   "errata_type"
    t.string   "severity"
    t.string   "title"
    t.text     "solution"
    t.text     "description"
    t.text     "summary"
    t.boolean  "reboot_suggested"
  end

  add_index "katello_errata", ["uuid"], :name => "index_katello_errata_on_uuid", :unique => true

  create_table "katello_erratum_bugzillas", :force => true do |t|
    t.integer "erratum_id", :null => false
    t.string  "bug_id",     :null => false
    t.string  "href"
  end

  add_index "katello_erratum_bugzillas", ["erratum_id", "bug_id", "href"], :name => "katello_erratum_bz_eid_bid_href", :unique => true

  create_table "katello_erratum_cves", :force => true do |t|
    t.integer "erratum_id", :null => false
    t.string  "cve_id",     :null => false
    t.string  "href"
  end

  add_index "katello_erratum_cves", ["erratum_id", "cve_id", "href"], :name => "index_katello_erratum_cves_on_erratum_id_and_cve_id_and_href", :unique => true

  create_table "katello_erratum_packages", :force => true do |t|
    t.integer "erratum_id", :null => false
    t.string  "nvrea",      :null => false
    t.string  "name",       :null => false
    t.string  "filename"
  end

  add_index "katello_erratum_packages", ["erratum_id", "nvrea", "name", "filename"], :name => "katello_erratum_packages_eid_nvrea_n_f", :unique => true

  create_table "katello_gpg_keys", :force => true do |t|
    t.string   "name",            :null => false
    t.integer  "organization_id", :null => false
    t.text     "content",         :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "katello_gpg_keys", ["organization_id", "name"], :name => "index_gpg_keys_on_organization_id_and_name", :unique => true

  create_table "katello_help_tips", :force => true do |t|
    t.string   "key"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "katello_help_tips", ["user_id"], :name => "index_help_tips_on_user_id"

  create_table "katello_host_collections", :force => true do |t|
    t.string   "name",                                      :null => false
    t.text     "description"
    t.integer  "max_content_hosts"
    t.integer  "organization_id",                           :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "unlimited_content_hosts", :default => true
  end

  add_index "katello_host_collections", ["name", "organization_id"], :name => "index_host_collections_on_name_and_organization_id", :unique => true
  add_index "katello_host_collections", ["organization_id"], :name => "index_host_collections_on_organization_id"

  create_table "katello_job_tasks", :force => true do |t|
    t.integer "job_id"
    t.integer "task_status_id"
  end

  add_index "katello_job_tasks", ["job_id"], :name => "index_job_tasks_on_job_id"
  add_index "katello_job_tasks", ["task_status_id"], :name => "index_job_tasks_on_task_status_id"

  create_table "katello_jobs", :force => true do |t|
    t.integer "job_owner_id"
    t.string  "job_owner_type"
    t.string  "pulp_id",        :null => false
  end

  add_index "katello_jobs", ["job_owner_id"], :name => "index_jobs_on_job_owner_id"
  add_index "katello_jobs", ["pulp_id"], :name => "index_jobs_on_pulp_id"

  create_table "katello_key_host_collections", :force => true do |t|
    t.integer "activation_key_id"
    t.integer "host_collection_id"
  end

  add_index "katello_key_host_collections", ["activation_key_id"], :name => "index_key_host_collections_on_activation_key_id"
  add_index "katello_key_host_collections", ["host_collection_id"], :name => "index_key_host_collections_on_host_collection_id"

  create_table "katello_marketing_engineering_products", :force => true do |t|
    t.integer "marketing_product_id"
    t.integer "engineering_product_id"
  end

  add_index "katello_marketing_engineering_products", ["engineering_product_id"], :name => "index_marketing_engineering_products_on_engineering_product_id"
  add_index "katello_marketing_engineering_products", ["marketing_product_id"], :name => "index_marketing_engineering_products_on_marketing_product_id"

  create_table "katello_notices", :force => true do |t|
    t.string   "text",            :limit => 1024,                    :null => false
    t.text     "details"
    t.boolean  "global",                          :default => false, :null => false
    t.string   "level",                                              :null => false
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.string   "request_type"
    t.integer  "organization_id"
  end

  add_index "katello_notices", ["organization_id"], :name => "index_notices_on_organization_id"

  create_table "katello_pools", :force => true do |t|
    t.string   "cp_id",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "katello_pools", ["cp_id"], :name => "index_pools_on_cp_id"

  create_table "katello_products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "cp_id"
    t.integer  "multiplier"
    t.integer  "provider_id",                                     :null => false
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.integer  "gpg_key_id"
    t.string   "type",            :default => "Katello::Product", :null => false
    t.integer  "sync_plan_id"
    t.string   "label",                                           :null => false
    t.integer  "organization_id",                                 :null => false
  end

  add_index "katello_products", ["cp_id"], :name => "index_products_on_cp_id"
  add_index "katello_products", ["gpg_key_id"], :name => "index_products_on_gpg_key_id"
  add_index "katello_products", ["organization_id"], :name => "index_katello_products_on_organization_id"
  add_index "katello_products", ["provider_id"], :name => "index_products_on_provider_id"
  add_index "katello_products", ["sync_plan_id"], :name => "index_products_on_sync_plan_id"

  create_table "katello_providers", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "repository_url"
    t.string   "provider_type"
    t.integer  "organization_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "task_status_id"
    t.string   "docker_registry_url"
  end

  add_index "katello_providers", ["name", "organization_id"], :name => "index_providers_on_name_and_organization_id", :unique => true
  add_index "katello_providers", ["organization_id"], :name => "index_providers_on_organization_id"
  add_index "katello_providers", ["task_status_id"], :name => "index_providers_on_task_status_id"

  create_table "katello_repositories", :force => true do |t|
    t.string   "name"
    t.string   "pulp_id",                                       :null => false
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.integer  "major"
    t.string   "minor"
    t.integer  "gpg_key_id"
    t.string   "cp_label"
    t.integer  "library_instance_id"
    t.string   "content_id"
    t.string   "arch",                    :default => "noarch", :null => false
    t.string   "label",                                         :null => false
    t.integer  "content_view_version_id",                       :null => false
    t.string   "relative_path",                                 :null => false
    t.string   "url"
    t.boolean  "unprotected",             :default => false,    :null => false
    t.string   "content_type",            :default => "yum",    :null => false
    t.integer  "product_id"
    t.integer  "environment_id"
    t.string   "checksum_type"
  end

  add_index "katello_repositories", ["content_view_version_id"], :name => "index_repositories_on_content_view_version_id"
  add_index "katello_repositories", ["cp_label"], :name => "index_repositories_on_cp_label"
  add_index "katello_repositories", ["environment_id"], :name => "index_repositories_on_environment_id"
  add_index "katello_repositories", ["gpg_key_id"], :name => "index_repositories_on_gpg_key_id"
  add_index "katello_repositories", ["library_instance_id"], :name => "index_repositories_on_library_instance_id"
  add_index "katello_repositories", ["product_id"], :name => "index_repositories_on_product_id"
  add_index "katello_repositories", ["pulp_id"], :name => "index_repositories_on_pulp_id"

  create_table "katello_repository_docker_images", :force => true do |t|
    t.integer "docker_image_id", :null => false
    t.integer "repository_id"
  end

  add_index "katello_repository_docker_images", ["docker_image_id", "repository_id"], :name => "katello_repo_docker_imgs_image_repo_id", :unique => true

  create_table "katello_repository_errata", :force => true do |t|
    t.integer "erratum_id",    :null => false
    t.integer "repository_id"
  end

  add_index "katello_repository_errata", ["erratum_id", "repository_id"], :name => "index_katello_repository_errata_on_erratum_id_and_repository_id", :unique => true

  create_table "katello_search_favorites", :force => true do |t|
    t.string   "params"
    t.string   "path"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "katello_search_favorites", ["user_id"], :name => "index_search_favorites_on_user_id"

  create_table "katello_search_histories", :force => true do |t|
    t.string   "params"
    t.string   "path"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "katello_search_histories", ["user_id"], :name => "index_search_histories_on_user_id"

  create_table "katello_sync_plans", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "sync_date"
    t.string   "interval"
    t.integer  "organization_id",                   :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.boolean  "enabled",         :default => true, :null => false
  end

  add_index "katello_sync_plans", ["name", "organization_id"], :name => "index_sync_plans_on_name_and_organization_id", :unique => true
  add_index "katello_sync_plans", ["organization_id"], :name => "index_sync_plans_on_organization_id"

  create_table "katello_system_activation_keys", :force => true do |t|
    t.integer "system_id"
    t.integer "activation_key_id"
  end

  add_index "katello_system_activation_keys", ["activation_key_id"], :name => "index_system_activation_keys_on_activation_key_id"
  add_index "katello_system_activation_keys", ["system_id"], :name => "index_system_activation_keys_on_system_id"

  create_table "katello_system_errata", :force => true do |t|
    t.integer "erratum_id", :null => false
    t.integer "system_id",  :null => false
  end

  add_index "katello_system_errata", ["erratum_id", "system_id"], :name => "katello_system_errata_eid_sid", :unique => true

  create_table "katello_system_host_collections", :force => true do |t|
    t.integer  "system_id"
    t.integer  "host_collection_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "katello_system_host_collections", ["host_collection_id"], :name => "index_system_host_collections_on_host_collection_id"
  add_index "katello_system_host_collections", ["system_id"], :name => "index_system_host_collections_on_system_id"

  create_table "katello_system_repositories", :force => true do |t|
    t.integer "system_id",     :null => false
    t.integer "repository_id"
  end

  add_index "katello_system_repositories", ["system_id", "repository_id"], :name => "katello_system_repositories_sid_rid", :unique => true

  create_table "katello_systems", :force => true do |t|
    t.string   "uuid"
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.integer  "environment_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "type",            :default => "Katello::System"
    t.integer  "content_view_id"
    t.integer  "host_id"
  end

  add_index "katello_systems", ["content_view_id"], :name => "index_systems_on_content_view_id"
  add_index "katello_systems", ["environment_id"], :name => "index_systems_on_environment_id"
  add_index "katello_systems", ["host_id"], :name => "index_katello_systems_on_host_id"

  create_table "katello_task_statuses", :force => true do |t|
    t.string   "type"
    t.integer  "organization_id"
    t.string   "uuid",                           :null => false
    t.string   "state"
    t.text     "result"
    t.text     "progress"
    t.datetime "start_time"
    t.datetime "finish_time"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.text     "parameters"
    t.string   "task_type"
    t.integer  "user_id",         :default => 0, :null => false
    t.integer  "task_owner_id"
    t.string   "task_owner_type"
  end

  add_index "katello_task_statuses", ["organization_id"], :name => "index_task_statuses_on_organization_id"
  add_index "katello_task_statuses", ["task_owner_id"], :name => "index_task_statuses_on_task_owner_id"
  add_index "katello_task_statuses", ["user_id"], :name => "index_task_statuses_on_user_id"
  add_index "katello_task_statuses", ["uuid"], :name => "index_task_statuses_on_uuid"

  create_table "katello_user_notices", :force => true do |t|
    t.integer "user_id"
    t.integer "notice_id"
    t.boolean "viewed",    :default => false, :null => false
  end

  add_index "katello_user_notices", ["notice_id"], :name => "index_user_notices_on_notice_id"
  add_index "katello_user_notices", ["user_id"], :name => "index_user_notices_on_user_id"

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
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.text     "ignore_types"
    t.string   "ancestry"
    t.string   "title"
    t.text     "description"
    t.string   "label"
    t.text     "default_info"
    t.integer  "apply_info_task_id"
    t.boolean  "katello_default",    :default => true, :null => false
  end

  add_index "taxonomies", ["ancestry"], :name => "index_taxonomies_on_ancestry"
  add_index "taxonomies", ["label"], :name => "index_organizations_on_cp_key", :unique => true

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
    t.boolean  "helptips_enabled",                       :default => true
    t.integer  "page_size",                              :default => 25,    :null => false
    t.boolean  "disabled",                               :default => false
    t.text     "preferences"
    t.string   "remote_id"
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

  add_foreign_key "containers", "docker_images", :name => "containers_docker_image_id_fk"
  add_foreign_key "containers", "docker_tags", :name => "containers_docker_tag_id_fk"

  add_foreign_key "docker_tags", "docker_images", :name => "docker_tags_docker_image_id_fk"
  add_foreign_key "docker_tags", "katello_repositories", :name => "docker_tags_katello_repository_id_fk"

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
  add_foreign_key "hostgroups", "smart_proxies", :name => "hostgroups_content_source_id_fk", :column => "content_source_id"
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
  add_foreign_key "hosts", "smart_proxies", :name => "hosts_content_source_id_fk", :column => "content_source_id"
  add_foreign_key "hosts", "smart_proxies", :name => "hosts_puppet_ca_proxy_id_fk", :column => "puppet_ca_proxy_id"
  add_foreign_key "hosts", "smart_proxies", :name => "hosts_puppet_proxy_id_fk", :column => "puppet_proxy_id"
  add_foreign_key "hosts", "subnets", :name => "hosts_subnet_id_fk"
  add_foreign_key "hosts", "taxonomies", :name => "hosts_location_id_fk", :column => "location_id"
  add_foreign_key "hosts", "taxonomies", :name => "hosts_organization_id_fk", :column => "organization_id"

  add_foreign_key "images", "architectures", :name => "images_architecture_id_fk"
  add_foreign_key "images", "compute_resources", :name => "images_compute_resource_id_fk"
  add_foreign_key "images", "operatingsystems", :name => "images_operatingsystem_id_fk"

  add_foreign_key "katello_activation_keys", "katello_content_views", :name => "activation_keys_content_view_id_fk", :column => "content_view_id"
  add_foreign_key "katello_activation_keys", "katello_environments", :name => "activation_keys_environment_id_fk", :column => "environment_id"
  add_foreign_key "katello_activation_keys", "taxonomies", :name => "katello_activation_keys_organization_fk", :column => "organization_id"
  add_foreign_key "katello_activation_keys", "users", :name => "activation_keys_user_id_fk"

  add_foreign_key "katello_capsule_lifecycle_environments", "katello_environments", :name => "katello_capsule_lifecycle_environments_environment_fk", :column => "lifecycle_environment_id"
  add_foreign_key "katello_capsule_lifecycle_environments", "smart_proxies", :name => "katello_capsule_lifecycle_environments_capsule_fk", :column => "capsule_id"

  add_foreign_key "katello_content_view_components", "katello_content_view_versions", :name => "katello_content_view_components_version_fk", :column => "content_view_version_id"
  add_foreign_key "katello_content_view_components", "katello_content_views", :name => "component_content_views_content_view_id_fk", :column => "content_view_id"
  add_foreign_key "katello_content_view_components", "katello_content_views", :name => "katello_content_view_components_view_fk", :column => "content_view_id"

  add_foreign_key "katello_content_view_environments", "katello_content_view_versions", :name => "katello_content_view_environments_version_fk", :column => "content_view_version_id"
  add_foreign_key "katello_content_view_environments", "katello_content_views", :name => "content_view_environments_content_view_id_fk", :column => "content_view_id"
  add_foreign_key "katello_content_view_environments", "katello_environments", :name => "content_view_environments_environment_id_fk", :column => "environment_id"

  add_foreign_key "katello_content_view_erratum_filter_rules", "katello_content_view_filters", :name => "katello_content_view_erratum_filter_rules_filter_fk", :column => "content_view_filter_id"

  add_foreign_key "katello_content_view_filters", "katello_content_views", :name => "katello_content_view_filters_view_fk", :column => "content_view_id"

  add_foreign_key "katello_content_view_filters_repositories", "katello_content_view_filters", :name => "filters_repositories_filter_id_fk", :column => "content_view_filter_id"
  add_foreign_key "katello_content_view_filters_repositories", "katello_content_view_filters", :name => "katello_content_view_filters_repositories_filter_fk", :column => "content_view_filter_id"
  add_foreign_key "katello_content_view_filters_repositories", "katello_repositories", :name => "filters_repositories_repository_id_fk", :column => "repository_id"
  add_foreign_key "katello_content_view_filters_repositories", "katello_repositories", :name => "katello_content_view_filters_repositories_repository_fk", :column => "repository_id"

  add_foreign_key "katello_content_view_histories", "katello_content_view_versions", :name => "content_view_histories_cvh_cvv_id"
  add_foreign_key "katello_content_view_histories", "katello_environments", :name => "content_view_histories_cvh_environment_id"

  add_foreign_key "katello_content_view_package_filter_rules", "katello_content_view_filters", :name => "katello_content_view_package_filter_rules_filter_fk", :column => "content_view_filter_id"

  add_foreign_key "katello_content_view_package_group_filter_rules", "katello_content_view_filters", :name => "katello_content_view_package_group_filter_rules_filter_fk", :column => "content_view_filter_id"

  add_foreign_key "katello_content_view_puppet_environments", "environments", :name => "katello_cvpe_pe_id", :column => "puppet_environment_id"
  add_foreign_key "katello_content_view_puppet_environments", "katello_content_view_versions", :name => "katello_content_view_puppet_environments_view_version_fk", :column => "content_view_version_id"
  add_foreign_key "katello_content_view_puppet_environments", "katello_environments", :name => "katello_content_view_puppet_environments_environment_fk", :column => "environment_id"

  add_foreign_key "katello_content_view_puppet_modules", "katello_content_views", :name => "katello_content_view_puppet_modules_view_fk", :column => "content_view_id"

  add_foreign_key "katello_content_view_repositories", "katello_content_views", :name => "katello_content_view_repostories_content_view_fk", :column => "content_view_id"
  add_foreign_key "katello_content_view_repositories", "katello_repositories", :name => "content_view_definition_repositories_repository_id_fk", :column => "repository_id"
  add_foreign_key "katello_content_view_repositories", "katello_repositories", :name => "katello_content_view_repositories_repository_view_fk", :column => "repository_id"

  add_foreign_key "katello_content_view_versions", "katello_content_views", :name => "content_view_versions_content_view_id_fk", :column => "content_view_id"

  add_foreign_key "katello_content_views", "taxonomies", :name => "katello_content_views_organization_fk", :column => "organization_id"

  add_foreign_key "katello_distributors", "katello_content_views", :name => "distributors_content_view_id_fk", :column => "content_view_id"
  add_foreign_key "katello_distributors", "katello_environments", :name => "distributors_environment_id_fk", :column => "environment_id"

  add_foreign_key "katello_environment_priors", "katello_environments", :name => "environment_priors_environment_id_fk", :column => "environment_id"
  add_foreign_key "katello_environment_priors", "katello_environments", :name => "environment_priors_prior_id_fk", :column => "prior_id"

  add_foreign_key "katello_environments", "taxonomies", :name => "katello_environments_organization_fk", :column => "organization_id"

  add_foreign_key "katello_erratum_bugzillas", "katello_errata", :name => "katello_erratum_bugzillas_errata_id_fk", :column => "erratum_id"

  add_foreign_key "katello_erratum_cves", "katello_errata", :name => "katello_erratum_cves_errata_id_fk", :column => "erratum_id"

  add_foreign_key "katello_erratum_packages", "katello_errata", :name => "katello_erratum_packages_errata_id_fk", :column => "erratum_id"

  add_foreign_key "katello_gpg_keys", "taxonomies", :name => "katello_gpg_keys_organization_fk", :column => "organization_id"

  add_foreign_key "katello_help_tips", "users", :name => "help_tips_user_id_fk"

  add_foreign_key "katello_host_collections", "taxonomies", :name => "katello_host_collections_organization_fk", :column => "organization_id"

  add_foreign_key "katello_job_tasks", "katello_jobs", :name => "job_tasks_job_id_fk", :column => "job_id"
  add_foreign_key "katello_job_tasks", "katello_task_statuses", :name => "job_tasks_task_status_id_fk", :column => "task_status_id"

  add_foreign_key "katello_key_host_collections", "katello_activation_keys", :name => "key_host_collections_activation_key_id_fk", :column => "activation_key_id"
  add_foreign_key "katello_key_host_collections", "katello_host_collections", :name => "key_host_collections_host_collection_id_fk", :column => "host_collection_id"

  add_foreign_key "katello_marketing_engineering_products", "katello_products", :name => "marketing_engineering_products_engineering_product_id_fk", :column => "engineering_product_id"
  add_foreign_key "katello_marketing_engineering_products", "katello_products", :name => "marketing_engineering_products_marketing_product_id_fk", :column => "marketing_product_id"

  add_foreign_key "katello_notices", "taxonomies", :name => "katello_notices_organization_fk", :column => "organization_id"

  add_foreign_key "katello_products", "katello_gpg_keys", :name => "products_gpg_key_id_fk", :column => "gpg_key_id"
  add_foreign_key "katello_products", "katello_providers", :name => "products_provider_id_fk", :column => "provider_id"
  add_foreign_key "katello_products", "katello_sync_plans", :name => "products_sync_plan_id_fk", :column => "sync_plan_id"
  add_foreign_key "katello_products", "taxonomies", :name => "katello_products_organization_fk", :column => "organization_id"

  add_foreign_key "katello_providers", "katello_task_statuses", :name => "providers_task_status_id_fk", :column => "task_status_id"
  add_foreign_key "katello_providers", "taxonomies", :name => "katello_providers_organization_fk", :column => "organization_id"

  add_foreign_key "katello_repositories", "katello_content_view_versions", :name => "repositories_content_view_version_id_fk", :column => "content_view_version_id"
  add_foreign_key "katello_repositories", "katello_environments", :name => "katello_repositories_environment_fk", :column => "environment_id"
  add_foreign_key "katello_repositories", "katello_gpg_keys", :name => "repositories_gpg_key_id_fk", :column => "gpg_key_id"
  add_foreign_key "katello_repositories", "katello_products", :name => "katello_repositories_product_fk", :column => "product_id"
  add_foreign_key "katello_repositories", "katello_repositories", :name => "repositories_library_instance_id_fk", :column => "library_instance_id"

  add_foreign_key "katello_repository_docker_images", "docker_images", :name => "katello_repository_docker_images_docker_image_id_fk"
  add_foreign_key "katello_repository_docker_images", "katello_repositories", :name => "katello_repository_docker_images_repository_id_fk", :column => "repository_id"

  add_foreign_key "katello_repository_errata", "katello_errata", :name => "katello_repository_errata_errata_id_fk", :column => "erratum_id"
  add_foreign_key "katello_repository_errata", "katello_repositories", :name => "katello_repository_errata_repo_id_fk", :column => "repository_id"

  add_foreign_key "katello_search_favorites", "users", :name => "search_favorites_user_id_fk"

  add_foreign_key "katello_search_histories", "users", :name => "search_histories_user_id_fk"

  add_foreign_key "katello_sync_plans", "taxonomies", :name => "katello_sync_plans_organization_fk", :column => "organization_id"

  add_foreign_key "katello_system_activation_keys", "katello_activation_keys", :name => "system_activation_keys_activation_key_id_fk", :column => "activation_key_id"
  add_foreign_key "katello_system_activation_keys", "katello_systems", :name => "system_activation_keys_system_id_fk", :column => "system_id"

  add_foreign_key "katello_system_errata", "katello_errata", :name => "katello_system_errata_errata_id", :column => "erratum_id"
  add_foreign_key "katello_system_errata", "katello_systems", :name => "katello_system_errata_system_id", :column => "system_id"

  add_foreign_key "katello_system_host_collections", "katello_host_collections", :name => "system_host_collections_host_collection_id_fk", :column => "host_collection_id"
  add_foreign_key "katello_system_host_collections", "katello_systems", :name => "system_host_collections_system_id_fk", :column => "system_id"

  add_foreign_key "katello_system_repositories", "katello_repositories", :name => "katello_system_repositories_repo_id_fk", :column => "repository_id"
  add_foreign_key "katello_system_repositories", "katello_systems", :name => "katello_system_repositories_system_id_fk", :column => "system_id"

  add_foreign_key "katello_systems", "hosts", :name => "katello_systems_host_id"
  add_foreign_key "katello_systems", "katello_content_views", :name => "systems_content_view_id_fk", :column => "content_view_id"
  add_foreign_key "katello_systems", "katello_environments", :name => "systems_environment_id_fk", :column => "environment_id"

  add_foreign_key "katello_task_statuses", "taxonomies", :name => "katello_task_statuses_organization_fk", :column => "organization_id"
  add_foreign_key "katello_task_statuses", "users", :name => "task_statuses_user_id_fk"

  add_foreign_key "katello_user_notices", "katello_notices", :name => "user_notices_notice_id_fk", :column => "notice_id"
  add_foreign_key "katello_user_notices", "users", :name => "user_notices_user_id_fk"

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
