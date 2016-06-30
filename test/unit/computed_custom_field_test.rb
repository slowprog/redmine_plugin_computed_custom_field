require File.expand_path('../../test_helper', __FILE__)

class ComputedCustomFieldTest < ActiveSupport::TestCase
  fixtures :custom_fields

  def test_create_issue_computed_custom_field
    field = IssueCustomField.new(:name => 'For Issue',
                                 :field_format => 'computed',
                                 :formula => '"%{cf_1}" == "MySQL" ? "I know that" : ""',)
    assert field.save
  end

  def test_create_project_computed_custom_field
    field = ProjectCustomField.new(:name => 'For Project',
                                 :field_format => 'computed',
                                 :formula => '"%{cf_3}" * 2',)
    assert field.save
  end

  def test_create_user_computed_custom_field
    field = UserCustomField.new(:name => 'For User',
                        :field_format => 'computed',
                        :formula => '"%{cf_4}" =~ /$\+7[89]/ ? "RU" : "OTHER"',)
    assert field.save
  end

  def test_create_time_entry_custom_field
    field = TimeEntryCustomField.new(:name => 'For TimeEntry',
                                :field_format => 'computed',
                                :formula => '%{cf_10} == "1" ? "You rock!" : ""',)
    assert field.save
  end

  def test_create_time_entry_activity_custom_field
    field = TimeEntryActivityCustomField.new(:name => 'For TimeEntry',
                                             :field_format => 'computed',
                                             :formula => '%{cf_7} == "1" ? "Sounds great!" : ":("',)
    assert field.save
  end

  #TODO Version, Group, IssuePriority, DocumentCategory
end