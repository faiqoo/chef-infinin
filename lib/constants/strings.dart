abstract class Strings {
  static const emailRegex =
      '^[A-Za-z0-9](\\.?[A-Za-z0-9_-]){0,}@[A-Za-z0-9-]+\\.([A-Za-z]{1,6}\\.)?[A-Za-z]{2,6}\$';

  static const databaseName = 'exot_db';

  static const locale = 'locale';
  static const hiLocale = 'hi';
  static const enLocale = 'en';
  static const countryCodeKey = 'countryCode';
  static const usCountryValue = 'US';
  static const inCountryValue = 'IN';

  static const password = 'Password';
  static const emailAddress = 'Username or email';
  static const scan = 'Scan';
  static const signIn = 'Sign in';
  static const next = 'Next';
  static const signInContinue = 'to continue to Exto Platform';

  static const projectName = 'exto';
  static const version = 'version';
  static const rememberMe = 'Remember me';
  static const forgotPassword = 'Forgot password?';
  static const forgotPasswordMessage = 'Fill the form to reset your password';
  static const sendResetLink = 'Send link';
  static const returnTo = 'Return to ';
  static const sentSuccessfully = 'Link sent successfully';
  static const checkInstruction =
      'Please check your email and follow the instructions to reset your password.';

  static const invalidUsernamePassword =
      'Please enter valid username and password !';

  static const platform = 'Platform';
  static const extoSubTitle = 'Project Monitoring Tool';
  static const point1 = 'Does not sell or trade your data';
  static const point2 = 'Is certified for information security';
  static const point3 = 'Encrypts and secures your data';

  //Tenant screen
  static const chooseCustomers = 'Choose customer';
  static const multipleCustomersMsg =
      'You are associated with multiple customers. Please select a customer to continue.';

  // Errors
  static const workflowRefIdError =
      'Workflow Step and Forms are not linked. Contact system administrator';
  static const formInvalid = 'Form is invalid';
  static const noPermissionToAction =
      'This user has no permission to do any action';
  static const requiredFields = 'Please enter valid mobile number';

  static const signUpFields = 'All fields are required';
  static const invalidUrl = 'Invalid URL';
  static const qrNotScanned = 'No QR Code scanned.';

  static const logout = 'Logout';
  static const home = 'Go to home screen';
  static const dashboard = 'Dashboard';
  static const progressAndChecklist = 'Progress & Checklist';
  static const customForm = 'Custom Forms';
  static const search = 'Search';

  static const failedOperation = 'Operation Failed';
  static const customersScreenTitle = 'Customers';
  static const workspaceScreenTitle = 'Workspace';
  static const projectsScreenTitle = 'Projects';
  static const modulesScreenTitle = 'Modules';
  static const recordsScreenTitle = 'Records';
  static const formsScreenTitle = 'Forms';

  static const styleHeightKey = 'height';
  static const checkListTitleLabel = 'Sno : ';
  static const checkListDescLabel = 'Description : ';
  static const checkListNoteLabel = 'Note : ';
  static const checkListAnswerLabel = 'Answers : ';
  static const checkListAttachmentActionLabel = 'Attachment';
  static const checkListIssueActionLabel = 'Issue';
  static const checkListNewActionLabel = 'new';

  static const customerSelection = 'Customer Selection';
  static const customerSelectionMenuItem = 'Select Customer';
  static const projectSelectionMenuItem = 'Select Project';

  static const storageOperationsFailure = 'storage operation failed : ';
  static const emptyData = 'No Data Available.';
  static const requiredField = 'This field is required';
  static const no = 'No';
  static const yes = 'Yes';
  static const confirmationTitle = 'Confirmation';
  static const confirmMessage = 'Are you sure?';
  static const exitApplication = 'Do you want to exit Exto?';
  static const logoutApplication = 'Do you want to log out?';

  //Workflow messages
  static const workflowAccessNotFound = 'Workflow access not found';
  static const lackOfPermission = 'You do not have permission to this module';
  static const noWorkFlowId = 'No Workflow Id Found';
  static const mandatoryIndicator = ' *';

  //filter texts
  static const filterCombinationAnd = 'Match All';
  static const filterCombinationOr = 'Match Any';
  static const filterApplyButtonText = 'Apply';
  static const filterCancelButtonText = 'Cancel';
  static const filterAddRuleButtonText = 'Add Rule';
  static const filterRemoveRuleButtonText = 'Remove Rule';

  static const attachFrom = 'Attach from';
  static const gallery = 'Gallery';
  static const camera = 'Camera';
  static const widgets = 'Widgets';
  static const wfComment = 'WF Comments';
  static const generalAttachments = 'General Attachments';
  static const checkListAttachments = 'Checklist attachments';
  static const responsiblePerson = 'Responsible Person';
  static const deleteButtonText = 'Delete';
  static const scannerPlatformError = 'Failed to get platform version.';
  static const downloadFileError =
      'Error on downloading the file, please try again later.';
  static const needPermissions = 'Need permissions to save file in the storage';
  static const openSettings = 'Please enable permissions from app settings';
  static const downloadBasePath = '/storage/emulated/0/Download/';
  static const unknownError = 'Something went wrong';

  // Map keys
  static const dataKey = 'data';
  static const isLocalKey = 'is_local';
  static const idKey = '_id';
  static const refIdKey = 'refID';
  static const metaKey = 'meta';
  static const createdAtKey = 'created_at';
  static const createdByKey = 'created_by';
  static const statusKey = 'status';
  static const actionKey = 'action';
  static const commentKey = 'comment';

  // Parameters
  static const formIdParam = 'form_id';
  static const moduleNameParam = 'module_name';
  static const draftRecord = 'Draft Record';

  // Record status
  static const inProcess = 'IN_PROCESS';
  static const approved = 'Approved';
  static const rejected = 'Rejected';
  static const requestReview = 'REQUEST_FOR_REVIEW';

  // Workflow actions
  static const submit = 'Submit';
  static const approve = 'Approve';
  static const reject = 'Reject';
  static const returnn = 'Return';
  static const withdraw = 'Withdraw';
  static const revoke = 'Revoke';

  // Strings
  static const workflowActionTitle = 'Workflow Action';
  static const workflowDoneText = 'Done';
  static const workflowCloseText = 'Close';
  static const workflowSuccessMessage = 'Successfully Done';
  static const searchHintText = 'Search..';
  static const saveAsDraft = 'Save as Draft';

  // Workspace & Projects
  static const workspaceCaption =
      'You are associated with multiple workspaces. Please select a workspace to continue!';
  static const chooseWorkspace = 'Choose Workspace';
  static const projectCaption =
      'You are associated with multiple projects. Please select a project to continue!';

  // DrawerMenuItems (menu options)
  static const menuTitleHome = 'Home';
  static const menuTitleMyTask = 'My Task';
  static const menuTitleFavourites = 'Favourites';
  static const menuTitleModules = 'Modules';
  static const menuTitleMaster = 'Master';
  static const menuTitleWorkspaces = 'Workspaces';
  static const menuTitleProjects = 'Projects';
  static const menuTitleSettings = 'Settings';

  //profile
  static const myAccount = 'My Account';
  static const general = 'General';
  static const usernameEmail = 'Username/Email';
  static const accountSettings = 'Account Settings';
  static const changePassword = 'Change Password';
  static const other = 'Other';
  static const experimentalFeatures = 'Experimental Features';
  static const signOut = 'Sign Out';
  static const profileInformation = 'Profile Information';
  static const firstNameLastName = 'First Name & Last Name';
  static const confirm = 'Confirm';
  static const uploadPhoto = 'Upload Photo';
  static const upload = 'Upload';
  static const name = 'Name';
  static const chooseDateFormat = 'Choose Date Format';

  // Change password screen
  static const currentPassword = 'Current Password';
  static const currentPasswordHint = 'Enter Current Password';
  static const newPassword = 'New Password';
  static const newPasswordHint = 'Generate new password';
  static const confirmPassword = 'Repeat Password';
  static const confirmPasswordHint = 'Confirm Password';
  static const passwordMismatch = 'Password do not match';

  // Account settings screen
  static const theme = 'Theme';
  static const dateFormat = 'Date Format';
  static const fontSize = 'Font Size';

  static const lightTheme = 'Light';
  static const mediumFontSize = 'Medium';

  //Table Records Constants
  static const tableData = 'subTableData';
  static const recordsData = 'records';
  static const deleteData = 'deleted';
  static const filerText = 'Filter';
  static const editTitle = 'Edit';
  static const noString = 'No';
  static const yesString = 'Yes';
  static const yesFieldValue = 'Y';
  static const noFieldValue = 'N';

  //Table cases
  static const tableString = 'STRING';
  static const tableDigit = 'NUMBER';
  static const tableDate = 'DATE';
  static const tableCheckBox = 'CHECKBOX';
  static const tableSelect = 'SELECT';

  //Reference Table ID Constants.
  static const referenceIDSubmitLabel = 'label';
  static const referenceIDSubmitValue = 'value';
  static const referenceIDSubmitRefId = 'refId';
  static const referenceIDRecords = 'records';
  static const referenceIDTitleName = 'Reference ID';

  //Module Records constants
  static const moduleName = 'moduleName';

  static const pageKey = 'page';
  static const pageSizeKey = 'pageSize';
  static const pageSizeValue = '25';

  //get started texts
  static const getStartedTitle = "Be Entertained by Our BistroKings & Queens";
  static const getStartedSubtitle =
      "Have that perfect dish, made by theperfect chef, just as you like!";
  static const getStartedButtonTitle = "Get Started";

  static const letsGetTitle = "Let's get you";
  static const signUpTitle = "Signed Up";
  static const signFullNameLabel = "Full Name";
  static const signMobileNumberLabel = "Mobile Number";
  static const signGenderLabel = "Gender";
  static const signAgeLabel = "Age";
  static const signProfessionLabel = "Profession";
  static const signAlreadyUserLabel = "Already a User";
  static const signMaleLabel = "Male";
  static const signFemaleLabel = "Female";

  static const signInLabel = "Sign in";
  static const signInMobileNumberLabel = "Mobile Number";
  static const questionireLabel = "Lets get to know you more";
  static const questionireLabel2 = "What makes you unique foodie";
  static const questionireLabel3 = "Your idea of perfect ambience";
  static const questionireLabel4 = "Cuisine Taste";
  static const questionireLabel5 = "Your Interests";
  static const foodItemMainHeading = "BBQ Appetizer";
  static const foodItemMenu = "Menu";
  static const foodItemDetails = "Details";
  static const foodItemSchedule = "Schedule";
  static const foodDetailHeading = "Appetizer";
  static const foodProductTitle = "Sindhi Biryani";
  static const foodProductSubTitle = "Biryani";
  static const appCurrency = "Rs";
  static const foodProductItemPrice = "280";
  static const foodProductItemDescription =
      "A spiced mix of meat and rice, traditionally cooked over an open fire.";

  static const foodProductItemUsers = "2";
  static const foodProductItemQuantity = "Quantity";
  static const foodDetailAboutTitle = 'Experience';

  static const nextButtonTitle = "NEXT";

  static const letsStartScreenLabel = "Last but not the least!";
  static const letsStartScreenLabel1 =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor";
  static const letsStartScreenLabel2 =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit";
  static const letsStartScreenBtnLabel = "Let's Start";

  static const noOfPersonsHint = '0';
  static const notesHint = 'Optional';
  static const noOfPersonsLabel = 'PERSONS';
  static const notesLabel = 'NOTES';

  static const userProfileName = 'Minnie\'s Kitchen';
  static const userProfileReviews = '4.5 (5 Reviews)';
  static const userProfileDetailsLabel = 'Profile Details';
  static const userProfileFirstQuestioner = 'Why you want to become a host?';
  static const userProfileFirstQuestionerAnswer =
      'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod temp';
  static const userProfileSecondQuestioner = 'Tell us about your journey';
  static const userProfileSecondQuestionerAnswer =
      'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod temp';
  static const userProfileYourInterestLabel = 'Your Intrests';
  static const userProfileSportsLabel = 'Sports';
  static const userProfileTravellingLabel = 'Your Intrests';
  static const userProfileSocialMediaLabel = 'Social Media handles';
  static const userProfileSocialMediaHandle = 'sugarplum';
  static const productDetailTitle = 'BBQ \nExperience';
  static const productDetailSubTitle = 'by Zee Lounge';
  static const byText = 'by';
  static const productDetailReview = '4.2';
  static const productDetailAboutTitle = 'About Experience';
  static const productDetailAboutSubTitle =
      'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.';
  static const productDetailWowFactorTitle = 'WOW Factors';
  static const productDetailWowFactorGarden = 'Garden';
  static const productDetailWowFactorFireworks = 'Fireworks';
  static const productDetailWowFactorPetFriendly = 'Pet Friendly';
  static const productDetailWowFactorWifi = 'Wifi';
  static const productDetailWowFactorMusic = 'Music';
  static const productDetailWowFactorParking = 'Parking';
  static const productDetailSelectionDate = 'MON, 10 DEC';
  static const productDetailSelectionTime = '10PM';
  static const productDetailSelectionType = 'FAMILY';
  static const productDetailSelectionTotalPersons = '05';
  static const productDetailSelectionPersons = 'Persons';
  static const productDetailSelectionNotesLabel = 'Notes';
  static const productDetailSelectionNotes = 'Lorem Ipsum dolor sit';
  static const productDetailSelectionMenuLabel = 'Menu';
  static const productDetailSelectionMenuQuantity = '1x';
  static const productDetailSelectionMenuAmount = 'Rs.195';
  static const productDetailChefLabel = 'Chef\'s Info';
  static const productDetailChefName = 'Zee Lounge';
  static const productDetailChefLocation = 'H#25, St#43, Islamabad';
  static const productDetailChefSubHost = 'SUB HOST';
  static const productDetailChefSubHostName = 'Zoya Faraz';
  static const productDetailPriceLabel = 'Price';
  static const productDetailPriceValue = 'Rs.5,000';
  static const productDetailPriceTotal = 'Total Price';
  static const productDetailPriceTax = 'Tax (17%)';
  static const productDetailPriceTaxValue = 'Rs.255';
  static const productDetailAdvancePayment = 'Advance Payment';
  static const productDetailAdvancePaymentValue = 'Rs.1,000';
  static const productDetailExtraNote = 'Note';
  static const productDetailButtonTitle = 'Request to book';
  static const productDetailExtraNoteValue =
      '20% Advance Payment will be required\nfor booking';

  ///bottom bar
  static const homeTitle = 'HOME';
  static const bookingTitle = 'BOOKINGS';
  static const profileTitle = 'PROFILE'; //
  static const historyTitle = 'HISTORY';

  ///home screen
  static const labelExplore = 'Explore';
  static const labelFoodExperience = 'Food Experience';

  static const labelSeaFoodExperience = 'SEAFOOD';
  static const labelSeaFood2Experience = 'EXPERIENCE';
  static const labelPopularDishes = 'POPULAR DISHES';

  static const labelHeaderAccount = 'Account';
  static const labelHeaderOthers = 'Others';
  static const labelPersonalDetails = 'Personal Details';
  static const labelProfile = 'Profile';
  static const labelReviews = 'Reviews';
  static const labelPrivacyPolicy = 'Privacy Policy';
  static const labelTermsCond = 'Terms & Conditions';
  static const labelLogOut = 'Logout';

  static const labelBookings = 'Bookings';

  static const labelTitleProfile = 'Profile';

  static const labelTitleReviews = 'Reviews';
  static const foodItemBookingAmount = 'Rs. 790';
  static const foodItemBookingDate = '26-09-22';
  static const foodItemBookingUserName = 'Ali Raza';
  static const foodItemBookingReviews = '4.2';
  static const foodItemBookingName = 'BBQ Experience';
  static const foodItemBookingNoPersons = '2 Persons';
  static const foodItemBookingDateTime = '31 May @ 9 PM';
  static const foodItemBookingType = 'Couple';
  static const foodItemBookingApprovalPending = 'APPROVAL PENDING';
  static const foodItemBookingAdvancePendingHeader = 'ADVANCE PENDING';
  static const foodItemBookingAdvancePending = 'ADVANCE PENDING';
  static const foodItemBookingInProgress = 'IN PROCESS';
  static const foodItemBookingBookingConfirmed = 'BOOKING CONFIRMED';
  static const foodItemBookingAdvancePendingButton = 'Pay Advance';
  static const foodItemAdvancePendingTermsCondition = 'Terms & Condition';

  static const verificationPopupTitle = "Verification\nCode";
  static const verificationPopupSubtitle =
      'We have sent you an SMS with a code to\n number';
  static const verificationPopupButton = "Verify";
  static const verificationPopupResendCode = "Resend Code";

  static const ratingPopupTitle = "Order Completed!";
  static const ratingPopupBtnTitle = "Submit";
  static const ratingPopupSubTitle =
      "Kindly review your experience with Spicy Bites Bistro";
  static const generalPopupTitle = "We are sorry";
  static const generalSubTitle =
      "Your Experience has been canceled by our host";
  static const generalButtonTitle = "okay";
  static const popularFoodDetailTitle = 'BBQ\nExperience';
  static const popularFoodDetailSubTitle = 'by Zee Lounge';
  static const popularFoodDetailReview = '4.2';
  static const popularFoodDetailWowFactorTitle = 'Wow Factors';
  static const foodItemBookingConfirmedStatus = 'Booking Confirmed';
  static const foodItemBookingConfirmedOrderNo = 'Order ID: ';
  static const foodItemBookingConfirmedComment =
      'Thank you for booking with Zee Lounge looking forward to you at';
  static const foodItemBookingConfirmedCancelOrderButton = 'Cancel Order';
  static const foodItemAdvancePaymentValue = 'Rs. -1,000';
  static const bookingConfirmedDetailsLabel = 'Details';
  static const personsLabel = ' Persons';
  static const rsLabel = 'RS. ';

  static const popularFoodDetailAppBarTitle = 'Sindhi Biryani';
  static const foodDetailPreferences = 'Preferences';
  static const foodDetailLocation = 'Location';
  static const foodDetailPreferenceCouple = 'Couple';
  static const foodDetailPreferenceFamily = 'Family';
  static const foodDetailPreferenceFnf = 'F&F';
  static const labelProfilePicture = 'Profile Picture';

  static const productDetailChefLocations = 'Bahria Town, Rawalpindi';
  static const bookingInProcessStatus = 'IN PROCESS';
  static const bookingInProcessPayAdvance = 'Pay Digital';
  static const bookingInProcessPayCash = 'Pay Cash';
  static const bottomSheetTellUsWhyTitle =
      "Tell us why you want to cancel order";
  static const bottomSheetTellUsWhyRadioHint =
      "Lorem ipsum dolor sit amet, consectetur";

  static const requestedOrder = 'REQUESTED';
  static const acceptData = 'ACCEPTED';
  static const confirmed = 'CONFIRMED';
  static const billGeneratedLower = 'BILL_GENERATED';
  static const billGenerated = 'BILL_GENERATED';
  static const billGeneratedValue = 'BILL GENERATED';
  static const inProgress= 'IN_PROGRESS';
  static const inProgressValue = 'IN PROGRESS';
  static const pendingValue = 'PENDING';

  static const declined = 'DECLINED';
}
