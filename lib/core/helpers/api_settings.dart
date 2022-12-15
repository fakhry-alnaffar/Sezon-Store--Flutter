class ApiSettings{
  static const _baseUrl = "http://phplaravel-741008-2486387.cloudwaysapps.com/api/";
  static const login = "${_baseUrl}login";
  static const register = "${_baseUrl}register";
  static const registerPage = "${_baseUrl}registerPage";
  static const home = "${_baseUrl}home-page";
  static const favorites = "${_baseUrl}favorites";
  static const favorite = "${_baseUrl}favorite";
  static const vendorDetails = "${_baseUrl}vendor/{id}";
  static const vendorsUnderCategory = "${_baseUrl}type-of-vendors/{id}";
  static const product = "${_baseUrl}products/{id}";
  static const categories = "${_baseUrl}categories";
  static const changePassword = "${_baseUrl}change-password-when-login";
  static const editProfile = "${_baseUrl}update-profile";
  static const getPrice = "${_baseUrl}get-price";
  static const notification = "${_baseUrl}notification";
  static const addressBook = "${_baseUrl}address-book/{id}";
  static const removeAddressRook = "${_baseUrl}remove-address-book/{id}";
  static const getProductsWithOffer = "${_baseUrl}get-products-with-offer/{id}";
  static const cartPage = "${_baseUrl}cart-page";
  static const checkOrder = "${_baseUrl}check-order";
  static const makeOrder = "${_baseUrl}make-order";
  static const checkout = "${_baseUrl}checkout";
  static const orderState = "${_baseUrl}order-states";
  static const addOrDeleteFormCart = "${_baseUrl}add-delete-form-cart";
}