Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19A145AF1A0
	for <lists+linux-omap@lfdr.de>; Tue,  6 Sep 2022 19:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234908AbiIFRCh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Sep 2022 13:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239310AbiIFRBg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Sep 2022 13:01:36 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41DBB74DCF
        for <linux-omap@vger.kernel.org>; Tue,  6 Sep 2022 09:48:11 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id b16so16355794wru.7
        for <linux-omap@vger.kernel.org>; Tue, 06 Sep 2022 09:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=v9HOYNemLB65v2s3X2Chh/1DsPPvYHZYg0+K/15aDgQ=;
        b=KBk40v1OT946i4B+d+vkBk8cyimrj8gg6lHkT8hIOqFVzup+L566ZgcfQ4sFes+FND
         3IupKc/pLXicihX1oQtR0nl+/cJRxFhpQVlPsJIlNqL9EbCF2LTfTPUAJLevuKDFhnt5
         b4squC4IrhDisgAUsnWtYXC4AA9S/wLw3+HSJhu3DOPeDfoCrm3uy8Et5S3hGQHDv+LZ
         I6pUcuypMDWt8n6CVtt4z64pRCqXkOUsax+8gRXWR3o4p0rdv7qPoTkrtQwN1BZXlO8G
         9jfPt94QTNArPqcuhkhwb4fEMo6BHLFq3Ec7qNJdws74PO8KergoXU3cXkquudV2PePM
         cSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=v9HOYNemLB65v2s3X2Chh/1DsPPvYHZYg0+K/15aDgQ=;
        b=nndmid6GXDaKIJ3CGlmrYOeITl+Hy2E9ps3jojAsj+fIqhJQavH9oMyEnq20jN+Se2
         6+J7vqiBrZB9qKyI4Gec+XPbcXQoTl4HRKv4MMjczM3+NF8pT7vqlg4DmQbX23BX7lob
         LN9j4bUtr7ej6fdz8kewl58L6lkZyS19w8eOwfxj398ekj8iOScXsKiXOFUgd84ICHFj
         MkYxXnXaKZIQTfkXtw9FrVAFP1OA+B3VNtc5FUyo/IxZ6ZgY6M8AU4ReB3ZjYN3N7wQB
         7KU4eCEIGAiGq8dVIB5CjqYRu/+aQ4IEMovtIvE5rXb//yrm6uSbKZQRmwQK/gESf0oO
         23gw==
X-Gm-Message-State: ACgBeo1kuuqX8wg53B2h4PGNLR55ZWqSfbcfTqAyjAYeJt6Ub/k4dxpA
        V5xRfrT927RG9XhGimpUXvaTyg==
X-Google-Smtp-Source: AA6agR53hPoulIcRoB7W/3CjESueW5s+EE+CW6YumiyGq+fG3CkgKrQkayB+sRAxzfiUb6wYk7+KjA==
X-Received: by 2002:a05:6000:1a87:b0:222:2c85:2f5b with SMTP id f7-20020a0560001a8700b002222c852f5bmr28683893wry.654.1662482890291;
        Tue, 06 Sep 2022 09:48:10 -0700 (PDT)
Received: from localhost.localdomain (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id e27-20020adf9bdb000000b0021f0ff1bc6csm7426600wrc.41.2022.09.06.09.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 09:48:09 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>, Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-omap@vger.kernel.org (open list:TI BANDGAP AND THERMAL DRIVER)
Subject: [PATCH v3 26/30] thermal/drivers/ti: Remove unused macros ti_thermal_get_trip_value() / ti_thermal_trip_is_valid()
Date:   Tue,  6 Sep 2022 18:47:16 +0200
Message-Id: <20220906164720.330701-27-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906164720.330701-1-daniel.lezcano@linaro.org>
References: <20220906164720.330701-1-daniel.lezcano@linaro.org>
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
2.34.1

