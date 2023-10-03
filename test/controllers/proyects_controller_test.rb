# frozen_string_literal: true

require 'test_helper'

class ProyectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proyect = proyects(:one)
  end

  test 'should get index' do
    get proyects_url, as: :json
    assert_response :success
  end

  test 'should create proyect' do
    assert_difference('Proyect.count') do
      post proyects_url,
           params: { proyect: { comment: @proyect.comment, company: @proyect.company, status: @proyect.status } }, as: :json
    end

    assert_response :created
  end

  test 'should show proyect' do
    get proyect_url(@proyect), as: :json
    assert_response :success
  end

  test 'should update proyect' do
    patch proyect_url(@proyect),
          params: { proyect: { comment: @proyect.comment, company: @proyect.company, status: @proyect.status } }, as: :json
    assert_response :success
  end

  test 'should destroy proyect' do
    assert_difference('Proyect.count', -1) do
      delete proyect_url(@proyect), as: :json
    end

    assert_response :no_content
  end
end
