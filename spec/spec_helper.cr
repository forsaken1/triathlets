require "amber_spec"
require "jennifer/adapter/postgres"
require "jennifer"
require "../src/controllers/**"
require "../src/mailers/**"
require "../src/models/**"
require "../src/helpers/**"
require "../config/jennifer_test"

Spec.before_each do
  Jennifer::Adapter.adapter.begin_transaction
end

Spec.after_each do
  Jennifer::Adapter.adapter.rollback_transaction
end
