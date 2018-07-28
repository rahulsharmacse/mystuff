from pyspark.sql import SparkSession

import sys

from pyspark import SparkContext
from pyspark.streaming import StreamingContext
from pyspark.streaming.kafka import KafkaUtils

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: kafka_wordcount.py <zk> <topic>", file=sys.stderr)
        sys.exit(-1)

    sc = SparkContext(appName="PythonStreamingKafkaWordCount")
    ssc = StreamingContext(sc, 1)

    zkQuorum, topic = sys.argv[1:]
    kvs = KafkaUtils.createStream(ssc, zkQuorum, "spark-streaming-consumer", {topic: 1})
    lines = kvs.map(lambda x: x[1])
    counts = lines.flatMap(lambda line: line.split(" ")) \
        .map(lambda word: (word, 1)) \
        .reduceByKey(lambda a, b: a+b)
    print("=======================Received data==================Rahul========================= ")
    counts.pprint()

    ssc.start()
    ssc.awaitTermination()


'''spark = SparkSession \
    .builder \
    .appName("myApp") \
    .config("spark.mongodb.input.uri",  "mongodb://test123:test123@127.0.0.1:27017/test.user_info") \
    .config("spark.mongodb.output.uri",  "mongodb://test123:test123@127.0.0.1:27017/test.user_info") \
    .getOrCreate()

people = spark.createDataFrame([("Bilbo Baggins",  50), ("Gandalf", 1000), ("Thorin", 195), ("Balin", 178), ("Kili", 77),
                                ("Dwalin", 169), ("Oin", 167), ("Gloin", 158), ("Fili", 82), ("Bombur", None)], ["name", "age"])

people.write.format("com.mongodb.spark.sql.DefaultSource").mode("append").save()
df = spark.read.format("com.mongodb.spark.sql.DefaultSource").load()
df.printSchema()
df.show()

#Map("uri" -> "mongodb://root:example@127.0.0.1:27017/", "database" -> "test", "collection" -> "zips"
'''
