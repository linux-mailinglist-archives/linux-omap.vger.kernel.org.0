Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA1C6363D36
	for <lists+linux-omap@lfdr.de>; Mon, 19 Apr 2021 10:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234906AbhDSISG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Apr 2021 04:18:06 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50418 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233219AbhDSISD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Apr 2021 04:18:03 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYP64-0007tG-NT
        for linux-omap@vger.kernel.org; Mon, 19 Apr 2021 08:17:32 +0000
Received: by mail-ed1-f70.google.com with SMTP id w15-20020a056402268fb02903828f878ec5so10755864edd.5
        for <linux-omap@vger.kernel.org>; Mon, 19 Apr 2021 01:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=52l2YOdVJgJFgazG9TczP/a1+Vn2GICqhmwoQ1rMqI8=;
        b=FFM3AH9JAsCDBFrZOOOmRjAFANY1DNyPp4hA8MNBQvRMTfXe6w7x/5o2PBAqspjCII
         AUOZHymFcJd3o9G6kTjlenQrWPZ0OyJLh3M7SpN+6EHNjCqyUCu2o0xNe0S79zzVPQ+c
         VQnmixl+BboUuria+LnLtEe41IzRDTJSnIgxAPevBcZZ21FRaPQOY2MKc6TCTZ3/HTcx
         fjuZED217xdSC4CXD4Ucto3UUwY6sZBmwqj5RvgNLkDZCzX7tX3wzxxwWGXJS27VsGDM
         WDxqt+7fD0hGzs8oKYODcHz1+M8hkEoANGFwA5zfEui7Yq7WVl52LT283qCdkhk24Mio
         8ugA==
X-Gm-Message-State: AOAM532UvWdVjcI2l7ggXkeVOoNbbtQVt6OwJxGun2Ib5yj6DFIKYIZg
        OqdSR5/HGZu2/OR4ceAslwIGn847ITkNJN6J9F81YxkgmYM/wwsuHxaENDiZ0DcgtR69YxBX+oE
        D0oTSgi958WWrgm/p2eqE3CK4h0EqvUSx+tcnqxA=
X-Received: by 2002:a17:906:4881:: with SMTP id v1mr1683067ejq.383.1618820252485;
        Mon, 19 Apr 2021 01:17:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJYZH0QZa+sRVeO2DjuzsgUYgTnfcyHw6NR/d953cZ/+ohVHYxVqiEhAjo9vStCBaYnVmhfw==
X-Received: by 2002:a17:906:4881:: with SMTP id v1mr1683050ejq.383.1618820252362;
        Mon, 19 Apr 2021 01:17:32 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id da13sm12384781edb.6.2021.04.19.01.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 01:17:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/7] mfd: max8998: Simplify getting of_device_id match data
Date:   Mon, 19 Apr 2021 10:17:21 +0200
Message-Id: <20210419081726.67867-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
References: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use of_device_get_match_data() to make the code slightly smaller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mfd/max8998.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
index 785f8e9841b7..42c60d4d97fb 100644
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
+	if (IS_ENABLED(CONFIG_OF) && i2c->dev.of_node)
+		return (unsigned long)of_device_get_match_data(&i2c->dev);
 
 	return id->driver_data;
 }
-- 
2.25.1

