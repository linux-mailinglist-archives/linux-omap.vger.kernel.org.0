Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E02943917DB
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 14:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234891AbhEZMvf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 08:51:35 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56878 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234876AbhEZMtO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 08:49:14 -0400
Received: from mail-ua1-f69.google.com ([209.85.222.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llswk-0000xB-PG
        for linux-omap@vger.kernel.org; Wed, 26 May 2021 12:47:38 +0000
Received: by mail-ua1-f69.google.com with SMTP id z43-20020a9f372e0000b029020dcb32d820so727395uad.2
        for <linux-omap@vger.kernel.org>; Wed, 26 May 2021 05:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VIi0UDETJWMz8r22ACVNYPInzss+jr7PKRHzj4F9CjI=;
        b=DLwAkGJZFVMUo97KsFIZLerLJtjo6WF7jnDDcBntzVAySpQC8nayPjrGQs7XDTLOnI
         /cTj2/brSzvX4uTsRsrC7f7mxBIFMCjHREmEdN/OXR4U4JDTEFvJT0dNzhAe8sv04buI
         /ZUonblQx8hG+FQ1R0dy4oEo0bcVSSbbFrLTfaKI+41qpkBQpCdb9tv+hFRMMSHPdZZF
         V3gUQ7Nm0h9KtVKIiVDNNZ0eeAuxZ9uDqwySVljS4i1v+Om2rKhednXz0sbwlaJKbvZ+
         tRVrg/OIjgdktCO/r0coIfHUAwlvC5D2zv2gErFp8SEtCrjSz/zyYU70JoHPs6/FsNKX
         d2CQ==
X-Gm-Message-State: AOAM532Oy6lf60hIwXg2wJVQPO6z28sLVahKxUj9va24u8vDN00gubDu
        0s1PwRXLvrZzho9WKFo0hoWirpU5zW3zN/rOA/qxK8jbsmhKZRIGzFcuXYGdsE2egS2B/e8N043
        Vgc7YF/z9w0fv2FvS6AHG2CLAmOqcPDzh5TdMdYA=
X-Received: by 2002:a05:6102:321b:: with SMTP id r27mr29696987vsf.13.1622033257578;
        Wed, 26 May 2021 05:47:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVJ0GkIwUjj/SnT+ky43SozLjtVHQDTyQ4X8v8jZZwJZjmUrTyX1krLd+798CTd0BMRkeRUQ==
X-Received: by 2002:a05:6102:321b:: with SMTP id r27mr29696940vsf.13.1622033257072;
        Wed, 26 May 2021 05:47:37 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:47:36 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: [RESEND PATCH v2 04/13] mfd: da9062: Simplify getting of_device_id match data
Date:   Wed, 26 May 2021 08:47:02 -0400
Message-Id: <20210526124711.33223-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
References: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use of_device_get_match_data() to make the code slightly smaller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

---

Changes since v1:
1. Add Ack
2. Correct subject prefix
---
 drivers/mfd/da9062-core.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
index 8d913375152d..01f8e10dfa55 100644
--- a/drivers/mfd/da9062-core.c
+++ b/drivers/mfd/da9062-core.c
@@ -9,6 +9,7 @@
 #include <linux/init.h>
 #include <linux/device.h>
 #include <linux/interrupt.h>
+#include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/irq.h>
 #include <linux/mfd/core.h>
@@ -622,7 +623,6 @@ static int da9062_i2c_probe(struct i2c_client *i2c,
 	const struct i2c_device_id *id)
 {
 	struct da9062 *chip;
-	const struct of_device_id *match;
 	unsigned int irq_base;
 	const struct mfd_cell *cell;
 	const struct regmap_irq_chip *irq_chip;
@@ -635,15 +635,10 @@ static int da9062_i2c_probe(struct i2c_client *i2c,
 	if (!chip)
 		return -ENOMEM;
 
-	if (i2c->dev.of_node) {
-		match = of_match_node(da9062_dt_ids, i2c->dev.of_node);
-		if (!match)
-			return -EINVAL;
-
-		chip->chip_type = (uintptr_t)match->data;
-	} else {
+	if (i2c->dev.of_node)
+		chip->chip_type = (uintptr_t)of_device_get_match_data(&i2c->dev);
+	else
 		chip->chip_type = id->driver_data;
-	}
 
 	i2c_set_clientdata(i2c, chip);
 	chip->dev = &i2c->dev;
-- 
2.27.0

