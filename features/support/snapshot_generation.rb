module SnapshotGeneration

  OUT_DIR = Rails.root.join("features")

  def save_window_png(page, scenario)
    return false unless scenario.respond_to?(:steps)

    snapshot = OUT_DIR+"test_out.png"
    page.save_screenshot(snapshot , :full => true)
    puts "Snapshot saved at: #{snapshot}"
  end

end
