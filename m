Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AADF5EE701
	for <lists+linux-omap@lfdr.de>; Wed, 28 Sep 2022 23:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233642AbiI1VCS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Sep 2022 17:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233695AbiI1VCE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Sep 2022 17:02:04 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E56E27392E
        for <linux-omap@vger.kernel.org>; Wed, 28 Sep 2022 14:01:24 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id r6so4315807wru.8
        for <linux-omap@vger.kernel.org>; Wed, 28 Sep 2022 14:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=9zOcMpxX0c9YFao1IzO9/jsibY90yPALAUf8D0IY2Z0=;
        b=u4hgAIjVQmqRVbJl2YwpmcVTuoCM3GTsQPCA6eMv0b7rvn/rnckzvuR6ofPbiB1TJa
         ZlLjDKrwPpeEiBv9PTh/1Xx3Gfnr4q6mJdNzz3d1tm6Ei9ZiQgxLl+D5Pc8NX6luUnW1
         /TLZkfk8bhl4YshKjiTFE9/EP0ofhw9lzZEkdxpZjdiIIAqWQ5tiMrFIHDXw7tgPHucZ
         cXYTKmH/JgO8SV98mQItNLeuxUny4ZGefSx0zpKoKcLkW0kJ3RvKp3hbMGznHHoviuPX
         C6XLIxFEfyJ/FQmcIyr1wE2qQZ/OSpqqtjq/XK7ApKKUxx6Ka0r17s5nkwr1A6pjV9Mf
         xkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9zOcMpxX0c9YFao1IzO9/jsibY90yPALAUf8D0IY2Z0=;
        b=7KR6h+rK8CerM39dyKYzHq6niY91tn8QY67GQ7mT6Vh1kvMUhnxn2hfc6d8EEc/yhF
         tNhlKkJCu9Yrl5BZH7FWIs5bX1EfUKlH5MwBZer+tBdoATdzIhxHbskJV5sV2KwhHaPP
         pLzhckZuRk0xFayaczqUTxhfIr7y6TLyaJmKNiv7Zqy+C52ILxSRZU/h/zEMQoV/9tT5
         CIBsk+t40LGAdIoKNYYIPBRUnpLPt69Z/76XKrXbmwCgMkYMVinbHP9HfD/sqtox7gnO
         CKeFz0O+ZZuwYK/BB1upeZO7Zh9dfF5obKM2ALV4nPh0dOchRvX0yaNuc7jPkdEhcLMH
         rb7A==
X-Gm-Message-State: ACrzQf1yJlpp2t0MD3KTW3ARl1T9pHNWGBLbzg0ZVCzK5ou4534i7G8S
        +ze9I/5bApS99+glXoF4GeYAIg==
X-Google-Smtp-Source: AMsMyM5xePk56cyq/1R6ENrMpBOJY2bWbc8YwNLW3DMmUcXMBs4hQ5N+oNlEZ3X3sFO/p4SYxTdujg==
X-Received: by 2002:adf:d0cd:0:b0:22b:1ade:7980 with SMTP id z13-20020adfd0cd000000b0022b1ade7980mr20970919wrh.265.1664398882979;
        Wed, 28 Sep 2022 14:01:22 -0700 (PDT)
Received: from mai.. ([2a05:6e02:1041:c10:48a2:39eb:9d1b:8b8d])
        by smtp.gmail.com with ESMTPSA id g20-20020a05600c4ed400b003b4931eb435sm2874300wmq.26.2022.09.28.14.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 14:01:22 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        rui.zhang@intel.com, Raju Rangoju <rajur@chelsio.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Amit Kucheria <amitk@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Antoine Tenart <atenart@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v7 04/29] thermal/core/governors: Use thermal_zone_get_trip() instead of ops functions
Date:   Wed, 28 Sep 2022 23:00:34 +0200
Message-Id: <20220928210059.891387-5-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928210059.891387-1-daniel.lezcano@linaro.org>
References: <20220928210059.891387-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The governors are using the ops->get_trip_* functions, Replace these
calls with thermal_zone_get_trip().

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Zhang Rui <rui.zhang@intel.com>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com> # IPA
---
 drivers/thermal/gov_bang_bang.c       | 39 +++++++++++---------
 drivers/thermal/gov_fair_share.c      | 18 ++++------
 drivers/thermal/gov_power_allocator.c | 51 ++++++++++++---------------
 drivers/thermal/gov_step_wise.c       | 22 ++++++------
 4 files changed, 62 insertions(+), 68 deletions(-)

diff --git a/drivers/thermal/gov_bang_bang.c b/drivers/thermal/gov_bang_bang.c
index a08bbe33be96..af7737ec90c3 100644
--- a/drivers/thermal/gov_bang_bang.c
+++ b/drivers/thermal/gov_bang_bang.c
@@ -13,26 +13,28 @@
 
 #include "thermal_core.h"
 
-static void thermal_zone_trip_update(struct thermal_zone_device *tz, int trip)
+static int thermal_zone_trip_update(struct thermal_zone_device *tz, int trip_id)
 {
-	int trip_temp, trip_hyst;
+	struct thermal_trip trip;
 	struct thermal_instance *instance;
+	int ret;
 
-	tz->ops->get_trip_temp(tz, trip, &trip_temp);
-
-	if (!tz->ops->get_trip_hyst) {
-		pr_warn_once("Undefined get_trip_hyst for thermal zone %s - "
-				"running with default hysteresis zero\n", tz->type);
-		trip_hyst = 0;
-	} else
-		tz->ops->get_trip_hyst(tz, trip, &trip_hyst);
+	ret = __thermal_zone_get_trip(tz, trip_id, &trip);
+	if (ret) {
+		pr_warn_once("Failed to retrieve trip point %d\n", trip_id);
+		return ret;
+	}
+	
+	if (!trip.hysteresis)
+		dev_info_once(&tz->device,
+			      "Zero hysteresis value for thermal zone %s\n", tz->type);
 
 	dev_dbg(&tz->device, "Trip%d[temp=%d]:temp=%d:hyst=%d\n",
-				trip, trip_temp, tz->temperature,
-				trip_hyst);
+				trip_id, trip.temperature, tz->temperature,
+				trip.hysteresis);
 
 	list_for_each_entry(instance, &tz->thermal_instances, tz_node) {
-		if (instance->trip != trip)
+		if (instance->trip != trip_id)
 			continue;
 
 		/* in case fan is in initial state, switch the fan off */
@@ -50,10 +52,10 @@ static void thermal_zone_trip_update(struct thermal_zone_device *tz, int trip)
 		 * enable fan when temperature exceeds trip_temp and disable
 		 * the fan in case it falls below trip_temp minus hysteresis
 		 */
-		if (instance->target == 0 && tz->temperature >= trip_temp)
+		if (instance->target == 0 && tz->temperature >= trip.temperature)
 			instance->target = 1;
 		else if (instance->target == 1 &&
-				tz->temperature <= trip_temp - trip_hyst)
+			 tz->temperature <= trip.temperature - trip.hysteresis)
 			instance->target = 0;
 
 		dev_dbg(&instance->cdev->device, "target=%d\n",
@@ -63,6 +65,8 @@ static void thermal_zone_trip_update(struct thermal_zone_device *tz, int trip)
 		instance->cdev->updated = false; /* cdev needs update */
 		mutex_unlock(&instance->cdev->lock);
 	}
+
+	return 0;
 }
 
 /**
@@ -95,10 +99,13 @@ static void thermal_zone_trip_update(struct thermal_zone_device *tz, int trip)
 static int bang_bang_control(struct thermal_zone_device *tz, int trip)
 {
 	struct thermal_instance *instance;
+	int ret;
 
 	lockdep_assert_held(&tz->lock);
 
-	thermal_zone_trip_update(tz, trip);
+	ret = thermal_zone_trip_update(tz, trip);
+	if (ret)
+		return ret;
 
 	list_for_each_entry(instance, &tz->thermal_instances, tz_node)
 		thermal_cdev_update(instance->cdev);
diff --git a/drivers/thermal/gov_fair_share.c b/drivers/thermal/gov_fair_share.c
index a4ee4661e9cc..bca60cd21655 100644
--- a/drivers/thermal/gov_fair_share.c
+++ b/drivers/thermal/gov_fair_share.c
@@ -21,16 +21,12 @@
  */
 static int get_trip_level(struct thermal_zone_device *tz)
 {
-	int count = 0;
-	int trip_temp;
-	enum thermal_trip_type trip_type;
-
-	if (tz->num_trips == 0 || !tz->ops->get_trip_temp)
-		return 0;
+	struct thermal_trip trip;
+	int count;
 
 	for (count = 0; count < tz->num_trips; count++) {
-		tz->ops->get_trip_temp(tz, count, &trip_temp);
-		if (tz->temperature < trip_temp)
+		__thermal_zone_get_trip(tz, count, &trip);
+		if (tz->temperature < trip.temperature)
 			break;
 	}
 
@@ -38,10 +34,8 @@ static int get_trip_level(struct thermal_zone_device *tz)
 	 * count > 0 only if temperature is greater than first trip
 	 * point, in which case, trip_point = count - 1
 	 */
-	if (count > 0) {
-		tz->ops->get_trip_type(tz, count - 1, &trip_type);
-		trace_thermal_zone_trip(tz, count - 1, trip_type);
-	}
+	if (count > 0)
+		trace_thermal_zone_trip(tz, count - 1, trip.type);
 
 	return count;
 }
diff --git a/drivers/thermal/gov_power_allocator.c b/drivers/thermal/gov_power_allocator.c
index 2d1aeaba38a8..eafb28839281 100644
--- a/drivers/thermal/gov_power_allocator.c
+++ b/drivers/thermal/gov_power_allocator.c
@@ -125,16 +125,15 @@ static void estimate_pid_constants(struct thermal_zone_device *tz,
 				   u32 sustainable_power, int trip_switch_on,
 				   int control_temp)
 {
+	struct thermal_trip trip;
+	u32 temperature_threshold = control_temp;
 	int ret;
-	int switch_on_temp;
-	u32 temperature_threshold;
 	s32 k_i;
 
-	ret = tz->ops->get_trip_temp(tz, trip_switch_on, &switch_on_temp);
-	if (ret)
-		switch_on_temp = 0;
+	ret = __thermal_zone_get_trip(tz, trip_switch_on, &trip);
+	if (!ret)
+		temperature_threshold -= trip.temperature;
 
-	temperature_threshold = control_temp - switch_on_temp;
 	/*
 	 * estimate_pid_constants() tries to find appropriate default
 	 * values for thermal zones that don't provide them. If a
@@ -520,10 +519,10 @@ static void get_governor_trips(struct thermal_zone_device *tz,
 	last_passive = INVALID_TRIP;
 
 	for (i = 0; i < tz->num_trips; i++) {
-		enum thermal_trip_type type;
+		struct thermal_trip trip;
 		int ret;
 
-		ret = tz->ops->get_trip_type(tz, i, &type);
+		ret = __thermal_zone_get_trip(tz, i, &trip);
 		if (ret) {
 			dev_warn(&tz->device,
 				 "Failed to get trip point %d type: %d\n", i,
@@ -531,14 +530,14 @@ static void get_governor_trips(struct thermal_zone_device *tz,
 			continue;
 		}
 
-		if (type == THERMAL_TRIP_PASSIVE) {
+		if (trip.type == THERMAL_TRIP_PASSIVE) {
 			if (!found_first_passive) {
 				params->trip_switch_on = i;
 				found_first_passive = true;
 			} else  {
 				last_passive = i;
 			}
-		} else if (type == THERMAL_TRIP_ACTIVE) {
+		} else if (trip.type == THERMAL_TRIP_ACTIVE) {
 			last_active = i;
 		} else {
 			break;
@@ -633,7 +632,7 @@ static int power_allocator_bind(struct thermal_zone_device *tz)
 {
 	int ret;
 	struct power_allocator_params *params;
-	int control_temp;
+	struct thermal_trip trip;
 
 	ret = check_power_actors(tz);
 	if (ret)
@@ -659,13 +658,12 @@ static int power_allocator_bind(struct thermal_zone_device *tz)
 	get_governor_trips(tz, params);
 
 	if (tz->num_trips > 0) {
-		ret = tz->ops->get_trip_temp(tz,
-					params->trip_max_desired_temperature,
-					&control_temp);
+		ret = __thermal_zone_get_trip(tz, params->trip_max_desired_temperature,
+					      &trip);
 		if (!ret)
 			estimate_pid_constants(tz, tz->tzp->sustainable_power,
 					       params->trip_switch_on,
-					       control_temp);
+					       trip.temperature);
 	}
 
 	reset_pid_controller(params);
@@ -695,11 +693,11 @@ static void power_allocator_unbind(struct thermal_zone_device *tz)
 	tz->governor_data = NULL;
 }
 
-static int power_allocator_throttle(struct thermal_zone_device *tz, int trip)
+static int power_allocator_throttle(struct thermal_zone_device *tz, int trip_id)
 {
-	int ret;
-	int switch_on_temp, control_temp;
 	struct power_allocator_params *params = tz->governor_data;
+	struct thermal_trip trip;
+	int ret;
 	bool update;
 
 	lockdep_assert_held(&tz->lock);
@@ -708,13 +706,12 @@ static int power_allocator_throttle(struct thermal_zone_device *tz, int trip)
 	 * We get called for every trip point but we only need to do
 	 * our calculations once
 	 */
-	if (trip != params->trip_max_desired_temperature)
+	if (trip_id != params->trip_max_desired_temperature)
 		return 0;
 
-	ret = tz->ops->get_trip_temp(tz, params->trip_switch_on,
-				     &switch_on_temp);
-	if (!ret && (tz->temperature < switch_on_temp)) {
-		update = (tz->last_temperature >= switch_on_temp);
+	ret = __thermal_zone_get_trip(tz, params->trip_switch_on, &trip);
+	if (!ret && (tz->temperature < trip.temperature)) {
+		update = (tz->last_temperature >= trip.temperature);
 		tz->passive = 0;
 		reset_pid_controller(params);
 		allow_maximum_power(tz, update);
@@ -723,16 +720,14 @@ static int power_allocator_throttle(struct thermal_zone_device *tz, int trip)
 
 	tz->passive = 1;
 
-	ret = tz->ops->get_trip_temp(tz, params->trip_max_desired_temperature,
-				&control_temp);
+	ret = __thermal_zone_get_trip(tz, params->trip_max_desired_temperature, &trip);
 	if (ret) {
-		dev_warn(&tz->device,
-			 "Failed to get the maximum desired temperature: %d\n",
+		dev_warn(&tz->device, "Failed to get the maximum desired temperature: %d\n",
 			 ret);
 		return ret;
 	}
 
-	return allocate_power(tz, control_temp);
+	return allocate_power(tz, trip.temperature);
 }
 
 static struct thermal_governor thermal_gov_power_allocator = {
diff --git a/drivers/thermal/gov_step_wise.c b/drivers/thermal/gov_step_wise.c
index cdd3354bc27f..31235e169c5a 100644
--- a/drivers/thermal/gov_step_wise.c
+++ b/drivers/thermal/gov_step_wise.c
@@ -95,30 +95,28 @@ static void update_passive_instance(struct thermal_zone_device *tz,
 		tz->passive += value;
 }
 
-static void thermal_zone_trip_update(struct thermal_zone_device *tz, int trip)
+static void thermal_zone_trip_update(struct thermal_zone_device *tz, int trip_id)
 {
-	int trip_temp;
-	enum thermal_trip_type trip_type;
 	enum thermal_trend trend;
 	struct thermal_instance *instance;
+	struct thermal_trip trip;
 	bool throttle = false;
 	int old_target;
 
-	tz->ops->get_trip_temp(tz, trip, &trip_temp);
-	tz->ops->get_trip_type(tz, trip, &trip_type);
+	__thermal_zone_get_trip(tz, trip_id, &trip);
 
-	trend = get_tz_trend(tz, trip);
+	trend = get_tz_trend(tz, trip_id);
 
-	if (tz->temperature >= trip_temp) {
+	if (tz->temperature >= trip.temperature) {
 		throttle = true;
-		trace_thermal_zone_trip(tz, trip, trip_type);
+		trace_thermal_zone_trip(tz, trip_id, trip.type);
 	}
 
 	dev_dbg(&tz->device, "Trip%d[type=%d,temp=%d]:trend=%d,throttle=%d\n",
-				trip, trip_type, trip_temp, trend, throttle);
+				trip_id, trip.type, trip.temperature, trend, throttle);
 
 	list_for_each_entry(instance, &tz->thermal_instances, tz_node) {
-		if (instance->trip != trip)
+		if (instance->trip != trip_id)
 			continue;
 
 		old_target = instance->target;
@@ -132,11 +130,11 @@ static void thermal_zone_trip_update(struct thermal_zone_device *tz, int trip)
 		/* Activate a passive thermal instance */
 		if (old_target == THERMAL_NO_TARGET &&
 			instance->target != THERMAL_NO_TARGET)
-			update_passive_instance(tz, trip_type, 1);
+			update_passive_instance(tz, trip.type, 1);
 		/* Deactivate a passive thermal instance */
 		else if (old_target != THERMAL_NO_TARGET &&
 			instance->target == THERMAL_NO_TARGET)
-			update_passive_instance(tz, trip_type, -1);
+			update_passive_instance(tz, trip.type, -1);
 
 		instance->initialized = true;
 		mutex_lock(&instance->cdev->lock);
-- 
2.34.1

