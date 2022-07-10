Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 450BC56D197
	for <lists+linux-omap@lfdr.de>; Sun, 10 Jul 2022 23:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbiGJV0l (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 10 Jul 2022 17:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbiGJV0I (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 10 Jul 2022 17:26:08 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2816B1115F
        for <linux-omap@vger.kernel.org>; Sun, 10 Jul 2022 14:25:29 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id be14-20020a05600c1e8e00b003a04a458c54so2016081wmb.3
        for <linux-omap@vger.kernel.org>; Sun, 10 Jul 2022 14:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linexp-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OIrYHdunDMNAaNv/cr2l2s9gzRoDCmmdOZhp9vHA0Pg=;
        b=xzuExPhLyZNT9Zy3FaJg94nYwhOlAT4SfKQiZUdd3fGjB7HzxRTlbiOJXjulUcfBHZ
         IZFIbV5UR9MpAPz6L5RXc/1LFwUbIfY/mDvZl8TlrG0tcWPU6/9TZ+IB0uwW4JXRdyVp
         DOWzb3doIR5w7in3sFPD7mbWEHK+rzFtsOh+LbcAOOL0BNgvUYQ25YHSOldWRkkIOjgc
         RkEm5UVwMeudS4OBhOhP4yf+HA7iJmCXSv5+WfUcwq5SwoHVNVR70MaTvtW9POVr44JU
         t3BRQqRVay5ADbzx95wU0M0BHxvdCvgCXYnKqvnlRg7CFXy8dCR2IMlFbUk6TGquiJ10
         kAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OIrYHdunDMNAaNv/cr2l2s9gzRoDCmmdOZhp9vHA0Pg=;
        b=tI9/9RBn8+e8+xEiRQHsVGDPnbqCiXq7cXZcBrorPOaWt0f0xtiVKA9Fsju0bL4nYb
         nvvr/MWmFtvoZBcapFF+5juZ1oZYNNWnS1PWE4h6ZUB5+0zDTuMkvk7SrM8p1aAwPuZw
         J2PHRjy6qK63mOSHSC0BxrqZiLWMOEp9VbGCiGvnoxC+2j7H3k2GC8wVrLk3e9HUEWLe
         rlWwr9jERKh2njV5fFA7PtM1rEeE8r3nDtrIOzilDETOf5xwaNO850tlgSyS+UeF+Do5
         Mw9s4zhNHy5SXACLWiyX6mFF/efviQjU0OI3UPb7VLCjo3bjq1CYuOzr21ZCusCKxsqr
         Dt/Q==
X-Gm-Message-State: AJIora9wghNc7+V7KZL/lvIN9I+vUlMLugUAkPYN7d8nsC9lSV/a4w77
        P3O2+oUhRN2IUtotGVwNyODZ5g==
X-Google-Smtp-Source: AGRyM1uvzqJzJtxgyDE2ree8aDA6PbCq068TJrnL8apJqaRJojcR9D3XiSKrrlMvu0IWqqL2SLiqgA==
X-Received: by 2002:a05:600c:1d94:b0:3a0:4e09:122f with SMTP id p20-20020a05600c1d9400b003a04e09122fmr12765276wms.190.1657488314376;
        Sun, 10 Jul 2022 14:25:14 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:c7c0:6823:f3ce:2447])
        by smtp.gmail.com with ESMTPSA id m19-20020a05600c3b1300b003a2dd0d21f0sm7142759wms.13.2022.07.10.14.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 14:25:14 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linexp.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     rui.zhang@intel.com, khilman@baylibre.com, abailon@baylibre.com,
        amitk@kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>,
        linux-omap@vger.kernel.org (open list:TI BANDGAP AND THERMAL DRIVER)
Subject: [PATCH v1 24/33] thermal/drivers/ti-soc: Switch to new of API
Date:   Sun, 10 Jul 2022 23:24:14 +0200
Message-Id: <20220710212423.681301-25-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220710212423.681301-1-daniel.lezcano@linexp.org>
References: <20220710212423.681301-1-daniel.lezcano@linexp.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The thermal OF code has a new API allowing to migrate the OF
initialization to a simpler approach.

Use this new API.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>
---
 .../thermal/ti-soc-thermal/ti-thermal-common.c   | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
index 703039d8b937..89a2bd46ebcf 100644
--- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
+++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
@@ -65,10 +65,10 @@ static inline int ti_thermal_hotspot_temperature(int t, int s, int c)
 
 /* thermal zone ops */
 /* Get temperature callback function for thermal zone */
-static inline int __ti_thermal_get_temp(void *devdata, int *temp)
+static inline int __ti_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 {
 	struct thermal_zone_device *pcb_tz = NULL;
-	struct ti_thermal_data *data = devdata;
+	struct ti_thermal_data *data = tz->devdata;
 	struct ti_bandgap *bgp;
 	const struct ti_temp_sensor *s;
 	int ret, tmp, slope, constant;
@@ -85,8 +85,8 @@ static inline int __ti_thermal_get_temp(void *devdata, int *temp)
 		return ret;
 
 	/* Default constants */
-	slope = thermal_zone_get_slope(data->ti_thermal);
-	constant = thermal_zone_get_offset(data->ti_thermal);
+	slope = thermal_zone_get_slope(tz);
+	constant = thermal_zone_get_offset(tz);
 
 	pcb_tz = data->pcb_tz;
 	/* In case pcb zone is available, use the extrapolation rule with it */
@@ -107,9 +107,9 @@ static inline int __ti_thermal_get_temp(void *devdata, int *temp)
 	return ret;
 }
 
-static int __ti_thermal_get_trend(void *p, int trip, enum thermal_trend *trend)
+static int __ti_thermal_get_trend(struct thermal_zone_device *tz, int trip, enum thermal_trend *trend)
 {
-	struct ti_thermal_data *data = p;
+	struct ti_thermal_data *data = tz->devdata;
 	struct ti_bandgap *bgp;
 	int id, tr, ret = 0;
 
@@ -130,7 +130,7 @@ static int __ti_thermal_get_trend(void *p, int trip, enum thermal_trend *trend)
 	return 0;
 }
 
-static const struct thermal_zone_of_device_ops ti_of_thermal_ops = {
+static struct thermal_zone_device_ops ti_of_thermal_ops = {
 	.get_temp = __ti_thermal_get_temp,
 	.get_trend = __ti_thermal_get_trend,
 };
@@ -170,7 +170,7 @@ int ti_thermal_expose_sensor(struct ti_bandgap *bgp, int id,
 		return -EINVAL;
 
 	/* in case this is specified by DT */
-	data->ti_thermal = devm_thermal_zone_of_sensor_register(bgp->dev, id,
+	data->ti_thermal = devm_thermal_of_zone_register(bgp->dev, id,
 					data, &ti_of_thermal_ops);
 	if (IS_ERR(data->ti_thermal)) {
 		dev_err(bgp->dev, "thermal zone device is NULL\n");
-- 
2.25.1

