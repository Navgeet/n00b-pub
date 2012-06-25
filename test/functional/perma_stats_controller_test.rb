require 'test_helper'

class PermaStatsControllerTest < ActionController::TestCase
  setup do
    @perma_stat = perma_stats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:perma_stats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create perma_stat" do
    assert_difference('PermaStat.count') do
      post :create, perma_stat: { deaths: @perma_stat.deaths, headshots: @perma_stat.headshots, hits: @perma_stat.hits, kills: @perma_stat.kills, name: @perma_stat.name, setinfo_pass: @perma_stat.setinfo_pass, shots: @perma_stat.shots }
    end

    assert_redirected_to perma_stat_path(assigns(:perma_stat))
  end

  test "should show perma_stat" do
    get :show, id: @perma_stat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @perma_stat
    assert_response :success
  end

  test "should update perma_stat" do
    put :update, id: @perma_stat, perma_stat: { deaths: @perma_stat.deaths, headshots: @perma_stat.headshots, hits: @perma_stat.hits, kills: @perma_stat.kills, name: @perma_stat.name, setinfo_pass: @perma_stat.setinfo_pass, shots: @perma_stat.shots }
    assert_redirected_to perma_stat_path(assigns(:perma_stat))
  end

  test "should destroy perma_stat" do
    assert_difference('PermaStat.count', -1) do
      delete :destroy, id: @perma_stat
    end

    assert_redirected_to perma_stats_path
  end
end
