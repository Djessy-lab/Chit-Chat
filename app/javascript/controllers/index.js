// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ChatroomSubscriptionController from "./chatroom_subscription_controller"
application.register("chatroom-subscription", ChatroomSubscriptionController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import SelectChildFeedController from "./select_child_feed_controller"
application.register("select-child-feed", SelectChildFeedController)

import StarRatingController from "./star_rating_controller"
application.register("star-rating", StarRatingController)
