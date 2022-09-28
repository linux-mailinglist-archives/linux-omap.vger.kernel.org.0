Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFA1D5EE756
	for <lists+linux-omap@lfdr.de>; Wed, 28 Sep 2022 23:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234571AbiI1VFd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Sep 2022 17:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233972AbiI1VEf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Sep 2022 17:04:35 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84DC1DDD9C
        for <linux-omap@vger.kernel.org>; Wed, 28 Sep 2022 14:02:04 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id l18so9604054wrw.9
        for <linux-omap@vger.kernel.org>; Wed, 28 Sep 2022 14:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=G/YO0fJeKfkSzRqdgqFU3ij4yJaDOnZPHmbsRpXJf/A=;
        b=SHso3cVk3QtQMcsPDoM7lPq2tpaKy5MkF2SAkytxXbqLl8v5pzT2ebw4HBjehLTvmh
         ZDkWG48CUmKv+XYQKHEZSOKNimHSX1KV7ZcPj0w087qCfdS2Zvj86MwNnOZ7vZ4zNDGn
         56ZjCwef7LGV520iEaGUwq3MfNjnJnKUVBdZUnRLVU5XFS5TPJegbdsQWiRVVBI2lKr2
         2zTTfuAv7myPLtGLVlZRM9uCd3oXpGR5r8WKSUQnIda0JIl0h39nvme4kb8PTRAmWD67
         WdOd6XrdeJdO+OKBadlWHhqx8WffNLRoBAmLDHJFgFQyIeLd+vDrqy+cBqfLOjQCazqH
         nhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=G/YO0fJeKfkSzRqdgqFU3ij4yJaDOnZPHmbsRpXJf/A=;
        b=7suoEXMjQSPuN01eBYrWJzme9kxSSIhx++qQrZ4/IKTedyV7q+uVeG/CMQNpODJTSQ
         olnlzBML/8udzYny7Og5/dergJBM4dQiV0El5RmXI1kc5Q6RoSu//yqvHd4LJ1A4wsgJ
         Zmxc8PKlL7My6kzAnNbhMzZPu1iTan0zMcw5lie6Q0YhHdzDUHgo+QAot891TkTo0AmK
         tAlTjcDCiCUGUeiYLt3zvB3fnKW7MDNmirzCpjdlc96fRgGJuzmK9qv4iJWLbwLg2VaJ
         OMhFYLLD/tt3HZKVLHnNfMv1ZyUYabhWTh6+gpBeOptG9wVll6OkdlItusDJfZh/gpcK
         f7eQ==
X-Gm-Message-State: ACrzQf17pIcbFFOi+7ovJbYTSsgrKvZRpv2Xyqmeka/rC7f0l7mUmJPM
        DhzZV0mGfJaJ2lIpQUgBPZpJaw==
X-Google-Smtp-Source: AMsMyM6bFmcicVOI9SxuyJWDy7FpVZr8wzikTTGMXTqH39j5FGBXFUMzuCDu3baej/qxwhlgmoztzg==
X-Received: by 2002:adf:fb50:0:b0:22a:e4e9:a6b3 with SMTP id c16-20020adffb50000000b0022ae4e9a6b3mr21666572wrs.467.1664398922583;
        Wed, 28 Sep 2022 14:02:02 -0700 (PDT)
Received: from mai.. ([2a05:6e02:1041:c10:48a2:39eb:9d1b:8b8d])
        by smtp.gmail.com with ESMTPSA id g20-20020a05600c4ed400b003b4931eb435sm2874300wmq.26.2022.09.28.14.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 14:02:02 -0700 (PDT)
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
Subject: [PATCH v7 16/29] thermal/of: Remove of_thermal_get_ntrips()
Date:   Wed, 28 Sep 2022 23:00:46 +0200
Message-Id: <20220928210059.891387-17-daniel.lezcano@linaro.org>
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

The thermal OF code uses the generic trip points to initialize the
thermal zone. Consequently thermal_zone_get_num_trips() can be used
and the of_thermal_get_ntrips() is no longer needed. Remove it.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/thermal_core.h |  5 -----
 drivers/thermal/thermal_of.c   | 16 ----------------
 2 files changed, 21 deletions(-)

diff --git a/drivers/thermal/thermal_core.h b/drivers/thermal/thermal_core.h
index c5990a3fcf8a..b00fc1913734 100644
--- a/drivers/thermal/thermal_core.h
+++ b/drivers/thermal/thermal_core.h
@@ -139,13 +139,8 @@ thermal_cooling_device_stats_update(struct thermal_cooling_device *cdev,
 
 /* device tree support */
 #ifdef CONFIG_THERMAL_OF
-int of_thermal_get_ntrips(struct thermal_zone_device *);
 bool of_thermal_is_trip_valid(struct thermal_zone_device *, int);
 #else
-static inline int of_thermal_get_ntrips(struct thermal_zone_device *tz)
-{
-	return 0;
-}
 static inline bool of_thermal_is_trip_valid(struct thermal_zone_device *tz,
 					    int trip)
 {
diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 2f533fc94917..89afa59c4915 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -19,22 +19,6 @@
 
 #include "thermal_core.h"
 
-/**
- * of_thermal_get_ntrips - function to export number of available trip
- *			   points.
- * @tz: pointer to a thermal zone
- *
- * This function is a globally visible wrapper to get number of trip points
- * stored in the local struct __thermal_zone
- *
- * Return: number of available trip points, -ENODEV when data not available
- */
-int of_thermal_get_ntrips(struct thermal_zone_device *tz)
-{
-	return tz->num_trips;
-}
-EXPORT_SYMBOL_GPL(of_thermal_get_ntrips);
-
 /**
  * of_thermal_is_trip_valid - function to check if trip point is valid
  *
-- 
2.34.1

