require 'test_helper'

class EventPatientsControllerTest < ActionController::TestCase
  setup do
    @event_patient = event_patients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_patients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_patient" do
    assert_difference('EventPatient.count') do
      post :create, event_patient: { event_id: @event_patient.event_id, status_event_patient: @event_patient.status_event_patient }
    end

    assert_redirected_to event_patient_path(assigns(:event_patient))
  end

  test "should show event_patient" do
    get :show, id: @event_patient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_patient
    assert_response :success
  end

  test "should update event_patient" do
    patch :update, id: @event_patient, event_patient: { event_id: @event_patient.event_id, status_event_patient: @event_patient.status_event_patient }
    assert_redirected_to event_patient_path(assigns(:event_patient))
  end

  test "should destroy event_patient" do
    assert_difference('EventPatient.count', -1) do
      delete :destroy, id: @event_patient
    end

    assert_redirected_to event_patients_path
  end
end
