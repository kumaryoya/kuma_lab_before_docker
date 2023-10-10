# frozen_string_literal: true

# ApplicationHelper module contains utility methods that can be used across the application.
module ApplicationHelper
  def default_meta_tags
    {
      site: 'くまらぼ',
      title: 'くまらぼ',
      reverse: true,
      charset: 'utf-8',
      description: 'ミニアプリ集',
      keywords: 'くまらぼ,ミニアプリ',
      canonical: "https://www.kumalab.top/",
      separator: '|',
      icon: [
        { href: image_url('logo.webp') }
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('logo.webp'),
        locale: 'ja-JP'
      },

      twitter: {
        card: 'summary',
        site: '@kumaryoya',
        image: image_url('logo.webp')
      }
    }
  end
end
