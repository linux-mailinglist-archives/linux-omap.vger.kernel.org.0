Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5535EC67D
	for <lists+linux-omap@lfdr.de>; Tue, 27 Sep 2022 16:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233156AbiI0OfI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Sep 2022 10:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232979AbiI0Odp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Sep 2022 10:33:45 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D561B8CA8
        for <linux-omap@vger.kernel.org>; Tue, 27 Sep 2022 07:33:28 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id h7so2914929wru.10
        for <linux-omap@vger.kernel.org>; Tue, 27 Sep 2022 07:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=v9HOYNemLB65v2s3X2Chh/1DsPPvYHZYg0+K/15aDgQ=;
        b=tsR8GsmwLnmO3r70RNL9IFXhZR+SIexipERds9VHUnVtiyqR7XimF/vgJS/prJE1Y0
         TY4LbFLI9lWJG9h+qrAIJHNpZPlXfa8pCKaSCO71C6F5gQ0MNIWNF1uPKRh3tCmtSseF
         hlg5QSirbDj4VEiPPWCrWrs6Pl1Ek12M5woTL/u9/RyRXsA4ab3xb2IxNsWEVGOO4B1Y
         pRVbrz2Dw5dfxyQIjXRK8hZNpc4ZiwxqIy1FUi2glan2H8niajZASp5WFn0AmVwWfv27
         WYlMZ32YT4RXEHrUAQy0kNuBtKth/0AmFPqdhugqfdEhJpoP7s0n7dZU7h23dH1umLRp
         Z7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=v9HOYNemLB65v2s3X2Chh/1DsPPvYHZYg0+K/15aDgQ=;
        b=R+hHKugCEqT5ym/3RKJSJtAyFArP2FEB3Orargbi1e7vDNj4Up7yAlePp8JV5OoD1N
         D9HH9DFxyQO6HPkNSsns6M0YEl0VCn0U7DaSZYVtP0aFkO8rIuBcyIHTleuIgWdfK2Ri
         +Lb1sFnl2J1l3w2iD3GFx1IlKdSig+yVYlxe5hq3iShBnKt/EZ2k2nX63a7V9WnVH5gR
         gpc/ri7gAIOZWRQbvC/CCXoVzvP+CqRLo5lhTXESnTdyK0u5b3u+bRA+5CgoX86mlPYE
         vsbM8DKltp61tOdERUALurhNo+fcyFk3D0qSpiFH7NExn5XFyYB2uSWR3RUP1XvaoQaP
         jIOA==
X-Gm-Message-State: ACrzQf3BrHI4hWaHjVcYHeJR/Gxu12gAr2qxVFYTx4ofcsq+NM8sDwhV
        Jt7h60meAVz/0y654lxCxLESKw==
X-Google-Smtp-Source: AMsMyM76YygRE0bJCEdfLthDuY4ECo01wZ0wYB1wdJt3BLLjfwxgwsBjsYJoPLRBE4K+5VvQPHEGCw==
X-Received: by 2002:adf:e5cf:0:b0:22a:c37c:5c6c with SMTP id a15-20020adfe5cf000000b0022ac37c5c6cmr17684812wrn.410.1664289206273;
        Tue, 27 Sep 2022 07:33:26 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id l6-20020a05600c4f0600b003b4924493bfsm17518371wmq.9.2022.09.27.07.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 07:33:25 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        rui.zhang@intel.com, Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>, Amit Kucheria <amitk@kernel.org>,
        linux-omap@vger.kernel.org (open list:TI BANDGAP AND THERMAL DRIVER)
Subject: [PATCH v6 25/29] thermal/drivers/ti: Remove unused macros ti_thermal_get_trip_value() / ti_thermal_trip_is_valid()
Date:   Tue, 27 Sep 2022 16:32:35 +0200
Message-Id: <20220927143239.376737-26-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927143239.376737-1-daniel.lezcano@linaro.org>
References: <20220927143239.376737-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

