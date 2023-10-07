# frozen_string_literal: true

# ApplicationHelper module contains utility methods that can be used across the application.
module ApplicationHelper
  def default_meta_tags
    {
      title: 'くまらぼ', reverse: true, charset: 'utf-8', canonical: request.original_url, separator: '|',
      og: { title: :title, type: 'website', url: request.original_url, image: image_url('logo.webp'), local: 'ja-JP' },
      twitter: { card: 'summary', image: image_url('logo.webp') }
    }
  end
end
