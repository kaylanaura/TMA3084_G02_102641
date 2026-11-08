# TMA3084 Lab 04 - Logs

Student: Kayla | Matric: 102641 | Project: lab_04 (Pizza Store App + Vibe Coding Task 4)

---

## LOGTEST - Test runs

| Date | Test file | Command | Result | Notes |
|---|---|---|---|---|
| 8 Nov 2026 | all files in lab_04 | `flutter analyze` | No issues found! (ran in 2.0s) | Run inside lab_04 after copying project files |
| 8 Nov 2026 | test/pizza_store_test.dart, test/order_summary_test.dart | `flutter test` | 00:17 +6: All tests passed! | Menu lists 3 items, card opens detail, back returns to menu, orderTotal, Order Summary shows RM 25.00, Back button pops |
| 8 Nov 2026 | CI on PR #2 | GitHub Actions: Flutter CI / analyze and Lab 04 CI / build-and-test | Both successful (1m and 59s) | PR #2 merged into main |

---

## LOGD - Bug debugged

- **Date:** 8 Nov 2026
- **Symptom:** The Oracle Java extension in VS Code showed errors in its log ("Cannot run on older versions of Java than Java 21" and "Nbcode Process is null"). It then downloaded JDK 27 into my repository folder lab3_1_menu_app\lib\oracleJdk-27.
- **Cause:** The extension needs Java 21 or newer but my computer had Java 17. Its automatic installer used my repo folder as the install path. The extension is for Java and is not needed for a Flutter project.
- **Fix:** Disabled the Oracle Java extension. Deleted the oracleJdk-27 folder so it would not be pushed to GitHub. When committing I only added .github and lab_04 (not git add .) so no JDK files were included.
- **Evidence:** Extension log output (Java 21 error and install path); git status showing the untracked oracleJdk-27 folder before I deleted it; PR #2 contains only project files.

---

## LOGAI (Entry AI-001)

- **AI tool:** Claude
- **Date:** 8 Nov 2026
- **Prompt used:**
  > Create lib/order_summary.dart containing an OrderSummaryScreen widget. It must use orderTotal(unitPrice, quantity) from lib/order.dart, show the item name, quantity and total price (format RM 0.00), and include a Back button that calls Navigator.pop. Do not modify any other file. Follow docs/spec.md.
- **AI output:** Claude produced lib/order_summary.dart (OrderSummaryScreen with item name, quantity, total from orderTotal, and a Back button using Navigator.pop), lib/order.dart (orderTotal), docs/spec.md and test/order_summary_test.dart.
- **My changes:** None. I ran the generated code and the tests, read through the code, and kept it as it was.
- **Test results:** flutter analyze - No issues found. flutter test - All tests passed (6 tests). The screen shows Cheese Pizza, Quantity: 2, Total: RM 25.00.
- **Decision:** Accepted. The code compiles, calls orderTotal, shows name, quantity and total, has a Back button, and did not modify other files.
- **Review notes:** orderTotal(unitPrice, quantity) in lib/order.dart multiplies the price of one item by the quantity and returns the total price. It also throws an error if the price or quantity is negative. The total is calculated in order.dart and not inside the screen so the business logic is separate from the UI, which makes it easy to test (orderTotal(12.50, 2) must give 25.00) and reuse. The screen only displays the result as RM 25.00.

