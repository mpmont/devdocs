module Docs
  class Codeigniter < UrlScraper
    self.name = 'CodeIgniter'
    self.type = 'sphinx'
    self.base_url = 'https://codeigniter.com/userguide3/'
    self.root_path = 'index.html'
    self.links = {
      home: 'https://codeigniter.com/',
      code: 'https://github.com/bcit-ci/CodeIgniter'
    }

    html_filters.push 'codeigniter/entries', 'sphinx/clean_html'

    options[:container] = '.document'

    options[:skip] = %w(
      license.html
      changelog.html
      DCO.html
      general/welcome.html
      general/requirements.html
      general/credits.html
      libraries/index.html
      helpers/index.html
    )

    options[:skip_patterns] = [
      /\Acontributing/,
      /\Adocumentation/,
      /\Ainstallation\/upgrade/
    ]

    options[:attribution] = <<-HTML
      &copy; 2014&ndash;2019 British Columbia Institute of Technology<br>
      Licensed under the MIT License.
    HTML

    version '3' do
      self.release = '3.1.8'
    end

    def get_latest_version(opts)
      tags = get_github_tags('codeigniter4', 'codeigniter4', opts)
      tags[0]['name'][1..-1]
    end
  end
end
