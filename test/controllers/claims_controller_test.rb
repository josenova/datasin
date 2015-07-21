require 'test_helper'

class ClaimsControllerTest < ActionController::TestCase
  setup do
    @claim = claims(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:claims)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create claim" do
    assert_difference('Claim.count') do
      post :create, claim: { amount: @claim.amount, claim_status_id: @claim.claim_status_id, claim_type_id: @claim.claim_type_id, client_id: @claim.client_id, date: @claim.date, description: @claim.description, number: @claim.number, policy_id: @claim.policy_id, vehicle_id: @claim.vehicle_id }
    end

    assert_redirected_to claim_path(assigns(:claim))
  end

  test "should show claim" do
    get :show, id: @claim
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @claim
    assert_response :success
  end

  test "should update claim" do
    patch :update, id: @claim, claim: { amount: @claim.amount, claim_status_id: @claim.claim_status_id, claim_type_id: @claim.claim_type_id, client_id: @claim.client_id, date: @claim.date, description: @claim.description, number: @claim.number, policy_id: @claim.policy_id, vehicle_id: @claim.vehicle_id }
    assert_redirected_to claim_path(assigns(:claim))
  end

  test "should destroy claim" do
    assert_difference('Claim.count', -1) do
      delete :destroy, id: @claim
    end

    assert_redirected_to claims_path
  end
end
