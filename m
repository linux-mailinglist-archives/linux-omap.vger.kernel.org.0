Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 024595EAA66
	for <lists+linux-omap@lfdr.de>; Mon, 26 Sep 2022 17:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236374AbiIZPVa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Sep 2022 11:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236159AbiIZPTs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 26 Sep 2022 11:19:48 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B64832EB
        for <linux-omap@vger.kernel.org>; Mon, 26 Sep 2022 07:06:58 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id n35-20020a05600c502300b003b4924c6868so8122034wmr.1
        for <linux-omap@vger.kernel.org>; Mon, 26 Sep 2022 07:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=v9HOYNemLB65v2s3X2Chh/1DsPPvYHZYg0+K/15aDgQ=;
        b=FI1oyr+D9871we4e977QPagSCksT3Vn7/qJpbsueClzMSG2AwheE5iFNGGcPEWufel
         iyxpUf5nJIy8r/zyl21f72M3v2gAF64QhIYWHhvjm+0x3c5pPNlz4p4iqlZLrNKOtQCv
         eMlW95TYtzCKYhMdSZxQRzJUi3i49nJcKHM0sBsH4F7YB9Sgs5sZvh6DnVZcqSyptluf
         ISVKXupseoR3M7XTZUop4rIAqmcDNr7H2v1CQ0Uu5upIJesE55OBbFhDAabfWAx8nN4C
         WC1xRxXcaG9H4Thc7/P73siRGhzcEqkTupW2EZtjR12EGPRaKooCX8l0oJRQhIut25Db
         LgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=v9HOYNemLB65v2s3X2Chh/1DsPPvYHZYg0+K/15aDgQ=;
        b=pFzbuQ0BPaH6RUVDW5bmzRdMUeZcVSHPOYZVjKPZKQV+GSq8GuTIYbX2VkX5eUOkRg
         hJUQQNMN8GfXAvv31Btl0y1p75xIBR4/VW8OLq3/ukMtD7AFYM2H3PXtp+gaIxwTqlfK
         69QGe2q0mit78BhEt1hd4zmqD6U2gWFumXCro7SbaSC69gYQ9gb5scznm381fyazhp6Q
         zAAPODoS5JiWgUWpr0O7fmQyTj4KvTBGW6bEXpUJiYg8VSam13fduUkc53xazR1Cwj8H
         ujObfbz7YA4iZZCazp3eBqeKfp81aw8u5+MOGD0Df8YKyvegb7Oqvc5cyaRjiq3QTNu+
         tYtw==
X-Gm-Message-State: ACrzQf0BvS0o2dH5OuamGWKhEzgODFmPJmJOJTzExPVkcAoTVNtDPGWR
        LoVoh9G894NA52h1eHCdHHMOrA==
X-Google-Smtp-Source: AMsMyM6xkd/pk1GXwnK4P4u9p8j8iWl4vDDrWGvxUXOc+roZrlpfbTZv4DWRAHQRzgMvcUrpoMBWpA==
X-Received: by 2002:a05:600c:6025:b0:3b4:8c0c:f3c9 with SMTP id az37-20020a05600c602500b003b48c0cf3c9mr21934841wmb.206.1664201216379;
        Mon, 26 Sep 2022 07:06:56 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id v3-20020adfebc3000000b0022adf321d22sm14310731wrn.92.2022.09.26.07.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 07:06:55 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        rui.zhang@intel.com, Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>, Amit Kucheria <amitk@kernel.org>,
        linux-omap@vger.kernel.org (open list:TI BANDGAP AND THERMAL DRIVER)
Subject: [PATCH v5 26/30] thermal/drivers/ti: Remove unused macros ti_thermal_get_trip_value() / ti_thermal_trip_is_valid()
Date:   Mon, 26 Sep 2022 16:06:00 +0200
Message-Id: <20220926140604.4173723-27-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926140604.4173723-1-daniel.lezcano@linaro.org>
References: <20220926140604.4173723-1-daniel.lezcano@linaro.org>
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

The macros:

ti_thermal_get_trip_value()
 ti_thermal_trip_is_valid()

are unused. Remove them.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/ti-soc-thermal/ti-thermal.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal.h b/drivers/thermal/ti-soc-thermal/ti-thermal.h
index c388ecf31834..4fd2c20182d7 100644
--- a/drivers/thermal/ti-soc-thermal/ti-thermal.h
+++ b/drivers/thermal/ti-soc-thermal/ti-thermal.h
@@ -38,21 +38,6 @@
 /* Update rates */
 #define FAST_TEMP_MONITORING_RATE				250
 
-/* helper macros */
-/**
- * ti_thermal_get_trip_value - returns trip temperature based on index
- * @i:	trip index
- */
-#define ti_thermal_get_trip_value(i)					\
-	(OMAP_TRIP_HOT + ((i) * OMAP_TRIP_STEP))
-
-/**
- * ti_thermal_is_valid_trip - check for trip index
- * @i:	trip index
- */
-#define ti_thermal_is_valid_trip(trip)				\
-	((trip) >= 0 && (trip) < OMAP_TRIP_NUMBER)
-
 #ifdef CONFIG_TI_THERMAL
 int ti_thermal_expose_sensor(struct ti_bandgap *bgp, int id, char *domain);
 int ti_thermal_remove_sensor(struct ti_bandgap *bgp, int id);
-- 
2.34.1

