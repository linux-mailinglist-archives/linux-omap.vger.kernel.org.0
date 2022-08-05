Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB0AE58ACD6
	for <lists+linux-omap@lfdr.de>; Fri,  5 Aug 2022 16:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241221AbiHEO7m (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Aug 2022 10:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241144AbiHEO6m (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 5 Aug 2022 10:58:42 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AD076D554
        for <linux-omap@vger.kernel.org>; Fri,  5 Aug 2022 07:58:16 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id p10so3525103wru.8
        for <linux-omap@vger.kernel.org>; Fri, 05 Aug 2022 07:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Xu62us8oiOdT3v/LlUZk/RORJXcWO5pwy0aIR6nqRZs=;
        b=qCT1CIdQW4qV7SVap6ys4vIYTsas1nL0EQ8hpsVGQaDrm/2/KMHgYZlXRY7WbpJG9f
         jJ2pZzGAzKtFXlMGqmN6iIder6Hs1BaDvDNdyu9dNsnYG1zUN14Wg+tKmypYlxR7RjvP
         Sfbv14LmW5GuIhjomBvVtR+kmrG3ZWQo/zLr7anFj3Mi45iboyCpH0QXMlf47xE9phfd
         YyukS25vb6w1xCimn8QK0I1o7pD8Q5mJInCBdo87gE8RKwxKQkfI5h4q2Y9C7zPWZnmo
         axTLldq0q+HkqQz1CUBGX93TJ/wfGqmZRJRKb2eXAQd4yUFbQs+M32CFM6c7HtPjlOMV
         nZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Xu62us8oiOdT3v/LlUZk/RORJXcWO5pwy0aIR6nqRZs=;
        b=UBH5QaUH4GQUD9vKkGj1wVvGAMGABK79o3rRSWnDkHD9KQqCm1f7++x49obh4CDW6y
         jxArjFfrD9gQd/Pfxa43xDNwlRq6MEB7NxISusZksc7ycMH4T6CIzIj+GOPcocVKTNa3
         fu/bAKVQnUkx5CUSfMuROalQzu8z2rYCxOLGxrAmcV3KuoK6K5X/Fb/xvsboRyESB9oZ
         LvpYwZbf6EAHmVFhCk+rrYY8vSXdy9nvc0dGjqOrB6E0Q3XgHJwMi29ghnExzM2av5Z0
         BHV4O0mqs3A8yhchlSc7FS/FJ8dzUSpeYSgA1Nm//X7IDU+0zJpALsm+TcBGqXhGjxM/
         2yWw==
X-Gm-Message-State: ACgBeo14UDowalDlzC9fBIpFMvcPiKbE7xtAqWBpoPHber9aLNYthNeZ
        r9mjvykDe8B3e9xQxRQtbpGm1g==
X-Google-Smtp-Source: AA6agR5FvzxVeAT7mC4XL5WYcb59YUms8FyOkiNDviZOZNAN6/OtYazBOPThW8h0QMqQiwwJROgNgQ==
X-Received: by 2002:a5d:4912:0:b0:220:6633:104f with SMTP id x18-20020a5d4912000000b002206633104fmr4626556wrq.625.1659711495487;
        Fri, 05 Aug 2022 07:58:15 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:aef0:8606:da6b:79ef])
        by smtp.gmail.com with ESMTPSA id y1-20020adfd081000000b0022159d92004sm3102448wrh.82.2022.08.05.07.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 07:58:15 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     rui.zhang@intel.com, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>, Amit Kucheria <amitk@kernel.org>,
        linux-omap@vger.kernel.org (open list:TI BANDGAP AND THERMAL DRIVER)
Subject: [PATCH v1 22/26] thermal/drivers/ti: Remove unused macros ti_thermal_get_trip_value() / ti_thermal_trip_is_valid()
Date:   Fri,  5 Aug 2022 16:57:25 +0200
Message-Id: <20220805145729.2491611-23-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805145729.2491611-1-daniel.lezcano@linaro.org>
References: <20220805145729.2491611-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
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
2.25.1

