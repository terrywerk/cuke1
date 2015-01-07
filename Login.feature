Feature: TCP-UI Scenarios

  # TCPPRO-88
  # Covered by Core Test Case Senarios, see Jira

  # TCPPRO-89
  @TCP @TCP-UI
  #Assumptions: No seasonality or perfectly known seasonality; Nothing else that interferes with learning; An abundance of inventory available
  Scenario Outline: Base demand estimate accurate; demand volatile
    Given Product x at store 7 has a true average demand of .7 per week
    And  Variability of demand is high
    And Initial demand estimate is .7
    And Run the system for 3 month
    Then I can see the average (mean, max, min, std dev.) of base demand 
    
    
    
    
    
    
    
    
    
    
    
    
  # TCPPRO-90
  @TCP @TCP-UI
  Scenario Outline: Product Review UI: TCPPRO-4-1 TCPPRO-90
    Given I'm on the Q login page
    When I enter a "<username>" and "<password>"
    And I click login
    And I should see the HQ Screen
    And I click the "<tabName>" tab
    And I search for product "<product>" in the pop-up
    Then the user will see the column labels for "<column>" in the Product Review Metrics table
    And the user will see the row labels for "<row>" in the Product Review Metrics table
    Then the user can click on the Change Button to select a different location
  Examples:
    | username | password | tabName        | product                           | column            | row                                                                                                                                                                               |
    | qadmin   | quantum  | Product Review | 2028992:692:BRICKLANE_LSBIGBROTEE | Current,Group Avg | Service Level,Avg Weekly Sales Units,Store OH,Target Unit Inventory,Avg Inventory Units,Forward WOS,Forward WOS Above Min,Store Inventory Turn,Sales Revenue,Gross Margin %,GMROI |

  # TCPPRO-91
  # Manual Test Case
  Scenario Outline: Manual Test for Product Review Screen: TCPPRO-4-2 TCPPRO-91
    Given I'm on the Q login page
    When I enter a "<username>" and "<password>"
    And I click login
    And I should see the HQ Screen
    And I click the "<tabName>" tab
    And I search for "<product>" in the pop up
    Then the Graph will appear to the left of the Metrics table and "<axis>" with "<axisLabel>"
  Examples:
    | username | password | tabName        | product                           | axis | axisLabel                  |
    | qadmin   | quantum  | Product Review | 2028992:692:BRICKLANE_LSBIGBROTEE | X    | Average Weekly Sales Units |
    | qadmin   | quantum  | Product Review | 2028992:692:BRICKLANE_LSBIGBROTEE | Y    | Average Inventory Units    |

  # TCPPRO-92
  @TCP @TCP-UI
  Scenario Outline: Distribution UI: TCPPRO-5-1 TCPPRO-92
    Given I'm on the Q login page
    When I enter a "<username>" and "<password>"
    And I click login
    And I should see the HQ Screen
    And I click the "<tabName>" tab
    And I search for product "<product>" in the pop-up
    And I click the Store Current subtab
    # List View is displayed by default
    Then I validate the "<storeCurrentListViewColumns>"
    And I validate the Store Current Tab Dropdown "<menuOptions>"
    And I click on the Store Hierarchy button
    Then I validate the "<storeCurrentHierarchyColumns>"
    And I click the Store Future subtab
    Then I validate the "<storeFutureColumns>"
    And I click the DC Current subtab
    Then I validate the "<dcCurrentColumns>"
    And I click the DC Future subtab
    Then I validate the "<dcFutureColumns>"
  Examples:
    | username | password | tabName      | product                           | storeCurrentListViewColumns                                                                                                                                                  | menuOptions                           | storeCurrentHierarchyColumns                                                                                                                                                    | storeFutureColumns                                                                | dcCurrentColumns               | dcFutureColumns                                      |
    | qadmin   | quantum  | distribution | 2028992:692:BRICKLANE_LSBIGBROTEE | Location,Current Need,RDQ,On Hand Target,Forecasted Inventory,Store OH,In Transit,Min Stock,Max Stock,Avg Weekly,Sales Units,Forward WOS,Forward WOS Above Min,Service Level | Channel Hierarchy,Attribute Hierarchy | Description,Current Need,RDQ,On Hand Target,Forecasted Inventory,Store OH,In Transit,Min Stock,Max Stock,Avg Weekly Sales Units,Forward WOS,Forward WOS Above Min,Service Level | Product,Request ID,Receipt Date,Qty,Store,RDQ,On Hand Target,Forecasted Inventory | DC,DC Available Stock,On Order | Product,Receiving DC Loc,Request ID,Receipt Date,Qty |

# TCPPRO-93
  Scenario Outline: Forecast UI: TCPPRO-6-1 TCPPRO-93
    Given I'm on the Q login page
    When I enter a "<username>" and "<password>"
    And I click login
    And I should see the HQ Screen
    And I click the "<tabName>" tab
    And I search for product "<product>" in the pop-up
    Then I validate the "<rows>" in the Forecast List View table
    Then I validate the "<editableFields>" in the Forecast Screen
    Then I validate the "<buttons>" in the Forecast Screen
  Examples:
    | username | password | tabName  | product | rows                                                                                                                                          | editableFields                               | buttons            |
    | qadmin   | quantum  | Forecast | PL-XYZ  | Final Demand Forecast,Demand Adjustment Index,Demand Unit Override,System Forecast,Seasonal Index,Life Cycle Index,Event Index,Sales LY,Sales | Demand Adjustment Index,Demand Unit Override | Export,Save,Cancel |

  # TCPPRO-94
  # Manual Test Case
  Scenario Outline: Manual Test for Forecast Screen: TCPPRO-6-2 TCPPRO-94
    Given I'm on the Q login page
    When I enter a "<username>" and "<password>"
    And I click login
    And I should see the HQ Screen
    And I click the "<tabName>" tab
    And I search for "<product>" in the pop up
    Then I validate Forecast chart "<label1>" is denoted by a Blue solid line in the Chart View
    Then I validate Forecast chart "<label2>" is denoted by a Blue dashed line in the Chart View
    Then I validate Forecast chart "<label3>" is denoted by a Black solid line in the Chart View
    Then I validate Forecast chart "<label4>" is denoted by a Black dashed line in the Chart View
  Examples:
    | username | password | tabName  | product                           | label1                | label2          | label3   | label4 |
    | qadmin   | quantum  | Forecast | 2028992:692:BRICKLANE_LSBIGBROTEE | Final Demand Forecast | System Forecast | Sales LY | Sales  |

  # TCPPRO-95
  Scenario Outline: Events UI: TCPPRO-7-1 TCPPRO-95
    Given I'm on the Q login page
    When I enter a "<username>" and "<password>"
    And I click login
    And I should see the HQ Screen
    And I click the "<tabName>" tab
    And I click the Events Add button
    And I select the "<eventType>" Event Type
    Then I select an Event "<productHierarchyType>" from the dropdown and validate the hierarchy structure
    Then I select an Event "<locationHierarchyType>" from the dropdown and validate the hierarchy structure
  Examples:
    | username | password | tabName | eventType | productHierarchyType                     | locationHierarchyType                 |
    | qadmin   | quantum  | Events  | Demand    | Merchandise Hierarchy,Seasonal Hierarchy | Channel Hierarchy,Attribute Hierarchy |

  # TCPPRO-96
  Scenario Outline: Administration UI: TCPPRO-8-1 TCPPRO-96
    Given I'm on the Q login page
    When I enter a "<username>" and "<password>"
    And I click login
    And I should see the HQ Screen
    And I click the "<tabName>" tab
    And I click on the new user button
    Then I validate the "<hierarchyType>" structure and only displays to the "<level1>"
    And I click the "<button>" button
    And I click on the Alert Tolerance tab
    Then I validate the "<hierarchyType>" structure and only displays to the "<level2>"
  Examples:
    | username | password | tabName        | hierarchyType | level1     | button | level2      |
    | qadmin   | quantum  | Administration | Merchandise   | Department | Back   | Style/Color |

  # TCPPRO-97
  Scenario Outline: Context Panel UI: TCPPRO-10-1 TCPPRO-97
    Given I'm on the Q login page
    When I enter a "<username>" and "<password>"
    And I click login
    And I should see the HQ Screen
    And I click the "<tabName>" tab
    And I search for product "<product>" in the pop-up
    Then I validate the "<categories>" and order in the Context Panel
  Examples:
    | username | password | tabName        | product | categories                                                                                                                                                                                           |
    | qadmin   | quantum  | Administration | PL-XYZ  | Department,Category,Sub-Class,Style-Color,Collection,Master Ssn,Sub Ssn Code,Strategy,Status Code,Store Count,First Store Receipt Date,On Range Date,Markdown Date,Off Range Date,Availability Ratio |

    


