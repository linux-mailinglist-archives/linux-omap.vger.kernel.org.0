Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE10D3917F3
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 14:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233460AbhEZMwg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 08:52:36 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56884 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234878AbhEZMtO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 08:49:14 -0400
Received: from mail-vs1-f70.google.com ([209.85.217.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llswl-0000xb-IP
        for linux-omap@vger.kernel.org; Wed, 26 May 2021 12:47:39 +0000
Received: by mail-vs1-f70.google.com with SMTP id v27-20020a67c89b0000b02902227f70aa8fso193816vsk.6
        for <linux-omap@vger.kernel.org>; Wed, 26 May 2021 05:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gi5LKjjP0bjXDjYj7Ix3Hw0qKjf6CelOHRk1zXBWnaI=;
        b=ACdUtXsuMfmYMnBqChDQy+B/9j/69sWwI/E67R+4Uxkk7lJfDZ87LfD8JO26zKmpcX
         5tKZAq/WrNg0oAmYhd9CAyyiLNhRuhf3rJoO2HHMLj57ZjIZJLDbYPffgzK9Fq7ZncrQ
         +5f4ehD8NyHdTPB59Zao79mXEQ6KSie79f3Xr+YyivoY5deMiz4xffaevbqUo90kuL1r
         Yuu7g4Pu5MVbujGZzVvMv2NIane0lApGFx0W9yJb3s73Wfs7iRVO7k/qNBO0qAK0uFrw
         s6cqednPot55Gv8KVxmzWnDAAQjSiaIn63s0Jp4cjOYK6SimN3M0QFs3i9SYPGhRrVNh
         Nl5w==
X-Gm-Message-State: AOAM532XoFxq21cBpKdRzkktVOOETyH0lT4LimNbFL7sZxu+rR9H1CzI
        RdPyOOzsMwORxr3fbOCGHagDUt9kF4Xab56S6cyXBqxfFHNifC9cPvd9ud06/Ev/8rlDRGYDlqv
        9qB1ND9U6IZitk/91fgTN1r9Gz2Cqc35g02nWawM=
X-Received: by 2002:a67:1087:: with SMTP id 129mr29581337vsq.42.1622033258713;
        Wed, 26 May 2021 05:47:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCM8BjysU8Rx+YcwLvtbPPjwicIzKBwQd2iZE/2FBz/KnmsXQzCZ4DPoAcGK75nk/My7ZDuA==
X-Received: by 2002:a67:1087:: with SMTP id 129mr29581327vsq.42.1622033258573;
        Wed, 26 May 2021 05:47:38 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:47:38 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [RESEND PATCH v2 05/13] mfd: sec: Simplify getting of_device_id match data
Date:   Wed, 26 May 2021 08:47:03 -0400
Message-Id: <20210526124711.33223-6-krzysztof.kozlowski@canonical.com>
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
1. Remove check for CONFIG_OF as suggested by Marek
---
 drivers/mfd/sec-core.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 8d55992da19e..15dd4c579937 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -10,6 +10,7 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/interrupt.h>
 #include <linux/pm_runtime.h>
@@ -323,14 +324,9 @@ sec_pmic_i2c_parse_dt_pdata(struct device *dev)
 static inline unsigned long sec_i2c_get_driver_data(struct i2c_client *i2c,
 						const struct i2c_device_id *id)
 {
-#ifdef CONFIG_OF
-	if (i2c->dev.of_node) {
-		const struct of_device_id *match;
+	if (i2c->dev.of_node)
+		return (unsigned long)of_device_get_match_data(&i2c->dev);
 
-		match = of_match_node(sec_dt_match, i2c->dev.of_node);
-		return (unsigned long)match->data;
-	}
-#endif
 	return id->driver_data;
 }
 
-- 
2.27.0

