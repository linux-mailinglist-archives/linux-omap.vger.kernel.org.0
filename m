Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 250CC58E27E
	for <lists+linux-omap@lfdr.de>; Wed, 10 Aug 2022 00:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbiHIWFv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Aug 2022 18:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbiHIWF2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Aug 2022 18:05:28 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC05ADFC6
        for <linux-omap@vger.kernel.org>; Tue,  9 Aug 2022 15:05:26 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id n4so13987300wrp.10
        for <linux-omap@vger.kernel.org>; Tue, 09 Aug 2022 15:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=v9HOYNemLB65v2s3X2Chh/1DsPPvYHZYg0+K/15aDgQ=;
        b=bFg1GUKpiDV2Wa5Z/VYETOFzVV963xVsUH3QvrLhSGNNWPp/xqMyOGX0Zhl/qKKmxm
         Ad7Osv2Yqq93VYOQQMjNugMHyQJ1xs+ZaGpl+qsYoyeFEHJX0gGV/noCTwbzy978WuGO
         lZVYICEtV3/CnRGA0iJjDqUggzqzsx2gp7OyOBwwNf+Bk7wBGi/aiGzmcwavyZ0YAmuZ
         tMpTgI/zmUYFxNZn9SJh3d9XqXtZc2k/9ZBt8cObjbPdZBF8lvUREOO73qEPf/bNYT2v
         a6iNxynWotqme7RyFH++cw2Ra0e/e7OmEY/Q7Rv6ssADcG53xF2TE5kxFQtXsrlceanf
         s3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=v9HOYNemLB65v2s3X2Chh/1DsPPvYHZYg0+K/15aDgQ=;
        b=wFhxoE7tsqHZznLTMGXPUGVCDVs50mMUvXIEzIJAPmk7J5Yd+M1UPSdPSpSOZkvKN/
         W3q3XUp63JIfOFlJQpeekfFp0fsYTUDMrP3vcAjG1izG1r6v/KHg9lm2344/RngsXbKH
         q7RdnAkGLf2uD2+CQw2aQBk4JCTOK3m4KZ+UNbQA4mlNFQaUu5c2IJcQgbXc0mUxWu8e
         WkI8nD3HwDnpswJCwkj3qOo9Ugpto1W7+FahPgqSUqAHy/ovoXdZjaxODywV6D23BDRN
         N/jiZ9oFwdVtdPKDSONOx7IMK3SRnojNqzdX6kjLc7g0RX7bCpdHGGKzUK+pp7T63Kqz
         KE5w==
X-Gm-Message-State: ACgBeo3k8si5wgCce7t9gmocn6pr/sf0vSoOHGIUQagb7e3Z0hPTK9v0
        gTWDnGRGOQm0TrW5U0gf5MD21A==
X-Google-Smtp-Source: AA6agR5IekVvgBURn6hz3jtsSLj3jSB1ikOgx3VaKNEVj6epeJRQ6Y5gecqcxCHvhKAWmzCetU715g==
X-Received: by 2002:a05:6000:1ac8:b0:220:6af3:935d with SMTP id i8-20020a0560001ac800b002206af3935dmr15261728wry.549.1660082726323;
        Tue, 09 Aug 2022 15:05:26 -0700 (PDT)
Received: from localhost.localdomain (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id m21-20020a05600c3b1500b003a317ee3036sm293583wms.2.2022.08.09.15.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 15:05:25 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     rui.zhang@intel.com, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>, Amit Kucheria <amitk@kernel.org>,
        linux-omap@vger.kernel.org (open list:TI BANDGAP AND THERMAL DRIVER)
Subject: [PATCH v2 22/26] thermal/drivers/ti: Remove unused macros ti_thermal_get_trip_value() / ti_thermal_trip_is_valid()
Date:   Wed, 10 Aug 2022 00:04:32 +0200
Message-Id: <20220809220436.711020-23-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809220436.711020-1-daniel.lezcano@linaro.org>
References: <20220809220436.711020-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
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

