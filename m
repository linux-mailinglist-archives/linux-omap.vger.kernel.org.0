Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C323917D4
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 14:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234818AbhEZMuj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 08:50:39 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56861 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234861AbhEZMs5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 08:48:57 -0400
Received: from mail-ua1-f71.google.com ([209.85.222.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llswX-0000vM-AG
        for linux-omap@vger.kernel.org; Wed, 26 May 2021 12:47:25 +0000
Received: by mail-ua1-f71.google.com with SMTP id t19-20020ab021530000b029020bc458f62fso693942ual.20
        for <linux-omap@vger.kernel.org>; Wed, 26 May 2021 05:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lxlGt7UdLo9WhBrHrUnAMYLEvzBvX/vS3VzoKn9EqgQ=;
        b=pnux0/Zp/bEOt3oeyit1/4XlGE1TP6Jvys3TMkoJejs2TVbIp9FBOhArAiasdFZh+k
         g2isPeo8CC/t2xbOnL9ERsXV6b0e1cJkdYPhHaZ15NMuSvBnyiPUtWJ8DxwPTn+tJH5F
         gqPk3uNO2g1AX4/BD6KTv0ybEVLTE+e+DIXXX5FjcleoU/gOkRkOrfBVeJDTfCRUjbpJ
         qNGO7FIAd3jlDyy5Myh1WyM2kVKMSCkWdS6QDSLJ6fXmzvYJoudr1I/7f0+uZtGRL/4I
         wZJVjy7Jy9VMelOVQexe9xMxP/7LOZHsEvywbbyAJycXn/U0cRmzi3eDm5SpHhfbFa0z
         ijvA==
X-Gm-Message-State: AOAM532GbMTBoM/r5ky6SsR7JxYhPeyzr31UlFmp5bhD22E60VWubbvf
        gQSmR4lHorYvk8iFtbGzgfee3REdbAmujOsZtz/3OZn6Y3pSRipseKtU9v2hhiFCFcKX3/W0jHF
        FFlEYpGAPecKJPci9Q1GA8zNhRof+9ev6rdF61ZE=
X-Received: by 2002:a05:6122:c91:: with SMTP id ba17mr27607460vkb.8.1622033244396;
        Wed, 26 May 2021 05:47:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeHUz3scp7cdtBDvx3wZhYQgy/hPyyOLqDEXP9LcACOUFA0w4nitE9VfR17c6NvL1vm1QT3w==
X-Received: by 2002:a05:6122:c91:: with SMTP id ba17mr27607437vkb.8.1622033244233;
        Wed, 26 May 2021 05:47:24 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:47:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [RESEND PATCH v2 02/13] mfd: max8998: Simplify getting of_device_id match data
Date:   Wed, 26 May 2021 08:47:00 -0400
Message-Id: <20210526124711.33223-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
References: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use of_device_get_match_data() to make the code slightly smaller.  There
is also no need to wrap it in a check for CONFIG_OF, because dev.of_node
will be set only with OF support.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. Remove check for CONFIG_OF
---
 drivers/mfd/max8998.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
index 785f8e9841b7..0eb15e611b67 100644
--- a/drivers/mfd/max8998.c
+++ b/drivers/mfd/max8998.c
@@ -12,6 +12,7 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/pm_runtime.h>
 #include <linux/mutex.h>
@@ -155,11 +156,8 @@ static struct max8998_platform_data *max8998_i2c_parse_dt_pdata(
 static inline unsigned long max8998_i2c_get_driver_data(struct i2c_client *i2c,
 						const struct i2c_device_id *id)
 {
-	if (IS_ENABLED(CONFIG_OF) && i2c->dev.of_node) {
-		const struct of_device_id *match;
-		match = of_match_node(max8998_dt_match, i2c->dev.of_node);
-		return (unsigned long)match->data;
-	}
+	if (i2c->dev.of_node)
+		return (unsigned long)of_device_get_match_data(&i2c->dev);
 
 	return id->driver_data;
 }
-- 
2.27.0

