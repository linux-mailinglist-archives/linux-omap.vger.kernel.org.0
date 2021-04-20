Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59C033657B3
	for <lists+linux-omap@lfdr.de>; Tue, 20 Apr 2021 13:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbhDTLkG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Apr 2021 07:40:06 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39078 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbhDTLkF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Apr 2021 07:40:05 -0400
Received: from mail-ed1-f69.google.com ([209.85.208.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYoj7-0005Sh-He
        for linux-omap@vger.kernel.org; Tue, 20 Apr 2021 11:39:33 +0000
Received: by mail-ed1-f69.google.com with SMTP id f9-20020a50fe090000b02903839889635cso10981623edt.14
        for <linux-omap@vger.kernel.org>; Tue, 20 Apr 2021 04:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q90BO6jGToShK7OtE3+O0ipoJJd5f8g5lHfCYVt8P0g=;
        b=dfgwR++Jex6gN2UhxNS9/Q2lvCyPTc9EbaStHNZJnCbAKBcPHq3uo9U2Sy8WpQVa71
         wItluMk7h5e527I+e8Uo98ncumuQNgrZpTcL/sAzKDTKPuQ61+icRP8rZrdv1YT5XNm3
         8NJraNmesL1XXGlTdvAHwU3XBGA+kxriwmkXe/SwGTsfgTgQo8AUl9B1b1vp8jQUh5Ye
         LtoRZHSkoXpo7zQdMeK45ksjManG1vmxOpKkTdxDD8cEoW7HurWesBXc0kHPtY8njssi
         d0htdpsc4/+43P52+XsVgBja9OpLwxEpnVmNF2TuPjDmiJE23F6iY9+/VRCPith3Ks7E
         EItw==
X-Gm-Message-State: AOAM533+Rvnxf/4v7mE6FJRQhv0GFIzQKsoikR8hwuhQDZBO5nlx6MSQ
        plHDEy7bVhng9Lun1JYKRnFx3Zaim8BWHLSOqK3e8UfkVmepcU2LkY0mzWDw26hfD9Tqe7k0Lr3
        7ClLP0+M8cFykG7fQbTGiueL6fD8evL8ubq/0www=
X-Received: by 2002:a05:6402:3591:: with SMTP id y17mr9694318edc.67.1618918773288;
        Tue, 20 Apr 2021 04:39:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCLCtp1s6fwTCslFHZbIHpbby+AF9jKEcIYP26e31mN/27ZAbOVO9O6Pn3Wxa5EUsrnfGQ7Q==
X-Received: by 2002:a05:6402:3591:: with SMTP id y17mr9694307edc.67.1618918773112;
        Tue, 20 Apr 2021 04:39:33 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id bw26sm10109007ejb.119.2021.04.20.04.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 04:39:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH v2 1/7] mfd: max8997: Simplify getting of_device_id match data
Date:   Tue, 20 Apr 2021 13:39:23 +0200
Message-Id: <20210420113929.278082-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
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
 drivers/mfd/max8997.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
index 68d8f2b95287..2141de78115d 100644
--- a/drivers/mfd/max8997.c
+++ b/drivers/mfd/max8997.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/interrupt.h>
 #include <linux/pm_runtime.h>
@@ -145,11 +146,9 @@ static struct max8997_platform_data *max8997_i2c_parse_dt_pdata(
 static inline unsigned long max8997_i2c_get_driver_data(struct i2c_client *i2c,
 						const struct i2c_device_id *id)
 {
-	if (IS_ENABLED(CONFIG_OF) && i2c->dev.of_node) {
-		const struct of_device_id *match;
-		match = of_match_node(max8997_pmic_dt_match, i2c->dev.of_node);
-		return (unsigned long)match->data;
-	}
+	if (i2c->dev.of_node)
+		return (unsigned long)of_device_get_match_data(&i2c->dev);
+
 	return id->driver_data;
 }
 
-- 
2.25.1

