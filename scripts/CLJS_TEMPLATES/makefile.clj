(require '[cljs.build.api :as b]
         '[cljs.repl :as repl]
         '[cljs.repl.node :as node]
         '[clojure.java.shell :as shell])

(defmulti task first)

(defmethod task :default
  [args]
  (let [all-tasks  (-> task methods (dissoc :default) keys sort)
        interposed (->> all-tasks (interpose ", ") (apply str))]
    (println "Unknown or missing task. Choose one of:" interposed)
    (System/exit 1)))

(def build-opts
  {:main '${PROJECT_NAME}.main
   :output-to "main.js"
   :output-dir "out"
   :target :nodejs
   :verbose true})

(defmethod task "build"
  [args]
  (b/build "src" build-opts))

(defmethod task "watch"
  [args]
  (b/watch "src" build-opts))

(defmethod task "repl"
  [args]
  (repl/repl (node/repl-env)
             :output-dir "out/nodejs"
             :cache-analysis true))

(defmethod task "build:test"
  [args]
  (b/build (b/inputs "src" "test")
           (assoc build-opts
                  :main '${PROJECT_NAME}.test.main_test
                  :output-to "out/tests.js"
                  :output-dir "out/tests"
                  :target :nodejs)))

(defmethod task "watch:test"
  [args]
  (letfn [(run-tests []
            (let [{:keys [out err]} (shell/sh "node" "out/tests.js")]
              (println out err)))]
    (println "Start watch loop...")
    (try
      (b/watch (b/inputs "src", "test")
               (assoc build-opts
                      :main '${PROJECT_NAME}.test.main_test
                      :watch-fn run-tests
                      :output-to "out/tests.js"
                      :output-dir "out/tests"
                      :target :nodejs))
      (catch Exception e
        (println "Error on running tests:" e)
        (task args)))))

(task *command-line-args*)

