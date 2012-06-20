require 'test_helper'

class RoundStatsControllerTest < ActionController::TestCase
  setup do
    @round_stat = round_stats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:round_stats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create round_stat" do
    assert_difference('RoundStat.count') do
      post :create, round_stat: { deaths: @round_stat.deaths, headshots: @round_stat.headshots, hits: @round_stat.hits, kills: @round_stat.kills, name: @round_stat.name, setinfo_pass: @round_stat.setinfo_pass, shots: @round_stat.shots }
    end

    assert_redirected_to round_stat_path(assigns(:round_stat))
  end

  test "should show round_stat" do
    get :show, id: @round_stat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @round_stat
    assert_response :success
  end

  test "should update round_stat" do
    put :update, id: @round_stat, round_stat: { deaths: @round_stat.deaths, headshots: @round_stat.headshots, hits: @round_stat.hits, kills: @round_stat.kills, name: @round_stat.name, setinfo_pass: @round_stat.setinfo_pass, shots: @round_stat.shots }
    assert_redirected_to round_stat_path(assigns(:round_stat))
  end

  test "should destroy round_stat" do
    assert_difference('RoundStat.count', -1) do
      delete :destroy, id: @round_stat
    end

    assert_redirected_to round_stats_path
  end
end
