Before do
  # page.current_window.resize_to(1350, 700)
  $gerarF = PgCriarFake.new
  $insereDados = CadastroEmail.new

end

###########################
# Screenshots #
###########################

# Cria os screenshots do teste por cenarios
After do |scenario|
  add_screenshot(scenario)
  if scenario.failed?
  add_browser_logs
  end
end

def add_screenshot(scenario)
  nome_cenario = scenario.name.gsub(/[^A-Za-z0-9]/, '-')
  nome_cenario = nome_cenario.gsub(' ','_').downcase!
  screenshot = "relatorios/screenshots/#{nome_cenario}.png"
  page.save_screenshot(screenshot)
  embed(screenshot, 'image/png', 'Print:)')
end


#########################################
# Logs de Falha do Navegador #
#########################################

# Gera os logs de erro do navegador em caso de falhas no relatorio
def add_browser_logs
  time_now = Time.now
  # Getting current URL
  current_url = Capybara.current_url.to_s
  # Gather browser logs
  logs = page.driver.browser.manage.logs.get(:browser).map {|line| [line.level, line.message]}
  # Remove warnings and info messages
  logs.reject! { |line| ['WARNING', 'INFO'].include?(line.first) }
  logs.any? == true
  embed(time_now.strftime('%Y-%m-%d-%H-%M-%S' + "\n") + ( "Current URL: " + current_url + "\n") + logs.join("\n"), 'text/plain', 'BROWSER ERROR')
end


###########################
# Relatórios #
###########################

# Gera o relatório Json e HTML do teste
at_exit do
  ReportBuilder.json_report_path = 'relatorios/json'
  ReportBuilder.input_path = 'relatorios/json/relatorio_email_gmail.json'
  ReportBuilder.report_path = 'relatorios/html/relatorio_email_gmail'
  ReportBuilder.configure do |config|
    config.report_types = [:json, :html]
    options = {
    report_title: "Automacao QA - Email Gmail",
    color: 'brown',
    additional_info: {'Browser' => 'Chrome', 'Environment' => 'Dev', 'Create By' => 'Tiago Ferreira', 'Data' => Time.now.strftime("%d/%m/%Y")}}
    ReportBuilder.build_report options
    end
end  