enum Environment { development, staging, qa, production }

class UrlConfig {
  static const String login = 'login';
  static const String register = 'register';
  static const String forgotPassword = 'forgot-password';
  static const String resetPassword = 'reset-password';
  static const String verificationPinRequest = 'verification-pin/request';
  static const String verificationPinConfirm = 'verification-pin/confirm';

  static const String saveIndustry = 'artisan/industry/save';
  static const String listIndustry = 'artisan/industry/list';
  static const String deleteIndustry = 'artisan/industry/delete';
  static const String overviewPayment = 'clartisaniartisanent/payment/overview';
  static const String transactionPayment = 'artisan/payment/transactions';
  static const String depositPayment = 'artisan/payment/deposit';

  static const String listCard = 'artisan/payment/card/list';
  static const String saveCard = 'artisan/card/save';
  static const String removeCard = 'artisan/card/remove';
  static const String savedProfileList = 'saved-profiles/list';

  static const String profileBioUpdate = 'artisan/profile/update-bio';
  static const String profileLocationUpdate = 'artisan/profile/update-location';
  static const String profileAvatarUpdate = 'artisan/profile/update-avatar';

  static const String saveGig = 'client/gig/save';
  static const String removeAttachment = 'client/attachments/remove';

  static const String listBid = 'client/gig/bids/list';
  static const String acceptOrDeclineBid = 'client/bids/accept-or-decline';
  static const String chatList = 'chat/list';
  static const String savedGig = 'saved-gigs/list';
  static const String savedGigSave = 'saved-gigs/save';
  static const String savedProfile = 'saved-profiles/save';

  static const String gigList = 'gig/list';
  static const String gigDetails = 'gig/details';
  static const String gigCategory = 'gig/categories';
  static const String gigSkill = 'gig/skills';

  static const String industry = 'industry/fetch';
  static const String reviewList = 'review/list';
  static const String reviewSave = 'review/save';
  static const String listOfArtisans = 'user/artisan/list';
}
