Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 578B93917D0
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 14:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234097AbhEZMua (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 08:50:30 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56852 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234859AbhEZMs4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 08:48:56 -0400
Received: from mail-ua1-f71.google.com ([209.85.222.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llswV-0000ue-Sy
        for linux-omap@vger.kernel.org; Wed, 26 May 2021 12:47:23 +0000
Received: by mail-ua1-f71.google.com with SMTP id b8-20020ab026c80000b029020f97f38cfcso725566uap.3
        for <linux-omap@vger.kernel.org>; Wed, 26 May 2021 05:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=63wtLBW+6811tc2wM3xGC8HMgV4U9MLtscg3Brvx6/I=;
        b=jv+/UDqHG8M2D7Rt5BoLF9xvgPhYw8rM1FQBDToAJ/86nuRBo3YoxU27jWe5HCIuDw
         pcbpYMhTWdRJX09GrGmMofQn41f1yM1rEkhqZRTDkdOR/E9mXWBUopefFTp4HeCoaYvf
         2EqD2kAWNEcOXgC/cfztnJteF86dnpx+H989v4i0+1Yb/zKQA4UG7rgF0T9IVchfJpda
         sIo62iEfSkH19Jh8HqAWHPbvGRe3HcxZXZ+Q9sBfDx1m5a+4YjmEEqs5df3Os00PNi6v
         OQf9hGqCfzw6wSyZyIjuPeWHaxRgma1d15XJqMLAlBsfXJL8YzMuq/fU3PBrTxXspiTo
         HS+A==
X-Gm-Message-State: AOAM5309D+JUg7u6vRqeavMxI2M6rzkmHc+dH331UH588ZSKMAGsS23t
        3WSbr4NCt5hpOc6yqyuPDudN/KaGz1Nk6CkcGFDM45bTA7FRTcxe6DpJBgRqpgsILWnF2xKXl5K
        xevO6HKaHVvTkzd9Y5Sk5iq034EXrH7i9uftUIzg=
X-Received: by 2002:a1f:eec6:: with SMTP id m189mr28997972vkh.5.1622033242689;
        Wed, 26 May 2021 05:47:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGXY4h0rmF++o4wqDou76qRmdKHAt/W8UvAFVzu+jFZ3c1eLygDNepjjkFiySFdPpaAvkZPQ==
X-Received: by 2002:a1f:eec6:: with SMTP id m189mr28997924vkh.5.1622033242172;
        Wed, 26 May 2021 05:47:22 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:47:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [RESEND PATCH v2 01/13] mfd: max8997: Simplify getting of_device_id match data
Date:   Wed, 26 May 2021 08:46:59 -0400
Message-Id: <20210526124711.33223-2-krzysztof.kozlowski@canonical.com>
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
2.27.0

