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

      customerCards: [
        {
          cardName: 'Awesome Card 1',
          cardDescription: 'This is the very first card in this service.',
          cardLinkUrl: '#',
          cardType: 'discount',
          cardCreatedAt: Date.today.to_s,
          cardCreatedAtString: 'Created at'
        },
        {
          cardName: 'Awesome Card 2',
          cardDescription: 'This is the very second card in this service.',
          cardLinkUrl: '#',
          cardType: 'discount',
          cardCreatedAt: Date.today.to_s,
          cardCreatedAtString: 'Created at'
        },
        {
          cardName: 'Awesome Card 3',
          cardDescription: 'This is the very third card in this service.',
          cardLinkUrl: '#',
          cardType: 'discount',
          cardCreatedAt: Date.today.to_s,
          cardCreatedAtString: 'Created at'
        },
        {
          cardName: 'Awesome Card 4',
          cardDescription: 'This is the very fourth card in this service.',
          cardLinkUrl: '#',
          cardType: 'discount',
          cardCreatedAt: Date.today.to_s,
          cardCreatedAtString: 'Created at'
        },
        {
          cardName: 'Awesome Card 5',
          cardDescription: 'This is the very fifth card in this service.',
          cardLinkUrl: '#',
          cardType: 'discount',
          cardCreatedAt: Date.today.to_s,
          cardCreatedAtString: 'Created at'
        }
      ]
    }
  end
end
