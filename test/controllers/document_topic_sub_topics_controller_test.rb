require 'test_helper'

class DocumentTopicSubTopicsControllerTest < ActionController::TestCase
  setup do
    @document_topic_sub_topic = document_topic_sub_topics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:document_topic_sub_topics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create document_topic_sub_topic" do
    assert_difference('DocumentTopicSubTopic.count') do
      post :create, document_topic_sub_topic: { description: @document_topic_sub_topic.description, document_topic_id: @document_topic_sub_topic.document_topic_id, name: @document_topic_sub_topic.name, number: @document_topic_sub_topic.number }
    end

    assert_redirected_to document_topic_sub_topic_path(assigns(:document_topic_sub_topic))
  end

  test "should show document_topic_sub_topic" do
    get :show, id: @document_topic_sub_topic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @document_topic_sub_topic
    assert_response :success
  end

  test "should update document_topic_sub_topic" do
    patch :update, id: @document_topic_sub_topic, document_topic_sub_topic: { description: @document_topic_sub_topic.description, document_topic_id: @document_topic_sub_topic.document_topic_id, name: @document_topic_sub_topic.name, number: @document_topic_sub_topic.number }
    assert_redirected_to document_topic_sub_topic_path(assigns(:document_topic_sub_topic))
  end

  test "should destroy document_topic_sub_topic" do
    assert_difference('DocumentTopicSubTopic.count', -1) do
      delete :destroy, id: @document_topic_sub_topic
    end

    assert_redirected_to document_topic_sub_topics_path
  end
end
