class BarcodegeneratorController < ApplicationController

  require 'barby'
  require 'barby/outputter/html_outputter'
  require 'barby/barcode/code_39'
  require 'barby/barcode/code_128'
  require 'barby/barcode/ean_8'

  def generate

    @barcode = Barby::Code128B.new(params[:ticket_id])

    @outputter = Barby::HtmlOutputter.new(@barcode)

    render 'barcode_generator/Showbarcode'
  end
end
