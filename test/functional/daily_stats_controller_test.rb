require 'test_helper'

class DailyStatsControllerTest < ActionController::TestCase
  setup do
    @daily_stat = daily_stats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:daily_stats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create daily_stat" do
    assert_difference('DailyStat.count') do
      post :create, daily_stat: { deaths: @daily_stat.deaths, headshots: @daily_stat.headshots, hits: @daily_stat.hits, kills: @daily_stat.kills, name: @daily_stat.name, setinfo_pass: @daily_stat.setinfo_pass, shots: @daily_stat.shots }
    end

    assert_redirected_to daily_stat_path(assigns(:daily_stat))
  end

  test "should show daily_stat" do
    get :show, id: @daily_stat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @daily_stat
    assert_response :success
  end

  test "should update daily_stat" do
    put :update, id: @daily_stat, daily_stat: { deaths: @daily_stat.deaths, headshots: @daily_stat.headshots, hits: @daily_stat.hits, kills: @daily_stat.kills, name: @daily_stat.name, setinfo_pass: @daily_stat.setinfo_pass, shots: @daily_stat.shots }
    assert_redirected_to daily_stat_path(assigns(:daily_stat))
  end

  test "should destroy daily_stat" do
    assert_difference('DailyStat.count', -1) do
      delete :destroy, id: @daily_stat
    end

    assert_redirected_to daily_stats_path
  end
end
