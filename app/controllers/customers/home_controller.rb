class Customers::HomeController < ApplicationController
  before_filter :authenticate_customer!

  def index

    @customer_dashboard_props = {
      sidebarNavItems: [
        {
          itemString: 'Home',
          itemUrl: '#'
        },
        {
          itemString: 'Notifications',
          itemUrl: '#',
          counter: '3'
        },
        {
          itemString: 'Coupons',
          itemUrl: '#'
        },
        {
          itemString: 'Advertisements',
          itemUrl: '#'
        }
      ],
      sidebarLabelString: 'Menu',
      headerLogo: {
        hrefUrl: '#',
        imgUrl: 'http://findicons.com/files/icons/2141/web_design_creatives/128/small_smile.png'
      },
      menuString: 'Menu',
      searchPlaceholder: 'Search',
      topNavigationLinks: [
        {
          linkUrl: '#',
          linkName: 'Settings'
        },
        {
          linkUrl: '#',
          linkName: 'Support'
        }
      ],
      topNavigationDropdownLinks: [
        {
          linkUrl: '#',
          linkName: 'My Account'
        },
        {
          linkUrl: '#',
          linkName: 'Edit Account'
        },
        {
          linkUrl: '#',
          linkName: 'Logout'
        }
      ],
      topNavigationAvatarLink: 'http://findicons.com/files/icons/2141/web_design_creatives/128/small_smile.png',
      topNavigationAccount: {
        string: 'Account',
        url: '#'
      },
      customerCards: customer_cards_json
    }
  end

  private

  def customer_cards_json
    cards = []
    current_customer.discount_cards.each do |card|
      item = card.to_json
      item['cardLinkUrl'] = '#'
      item['cardType'] = 'discount'
      item['cardCreatedAtString'] = 'Created at'
      cards << item
    end
    cards
  end
end
