(ns ${PROJECT_NAME}.test.main_test
  (:require [cljs.test :as t]))

(enable-console-print!)

(t/deftest some-test
  (t/is (= 2 1)))

(set! *main-cli-fn* #(t/run-tests))

(defmethod t/report [:cljs.test/default :end-run-tests]
  [m]
  (if (t/successful? m)
    (set! (.-exitCode js/process) 0)
    (set! (.-exitCode js/process) 1)))

