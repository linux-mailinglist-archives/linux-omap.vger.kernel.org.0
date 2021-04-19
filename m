Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 097A7363D39
	for <lists+linux-omap@lfdr.de>; Mon, 19 Apr 2021 10:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236260AbhDSISG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Apr 2021 04:18:06 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50437 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233520AbhDSISE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Apr 2021 04:18:04 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYP66-0007uU-OO
        for linux-omap@vger.kernel.org; Mon, 19 Apr 2021 08:17:34 +0000
Received: by mail-ed1-f70.google.com with SMTP id o4-20020a0564024384b0290378d45ecf57so10849715edc.12
        for <linux-omap@vger.kernel.org>; Mon, 19 Apr 2021 01:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rLN0PMvVAHq0LojAhsPhZSWrezfhIp/EDYrzGUmyMJA=;
        b=OEKbUslmUA00DZg9lIm6yejZ3u2Tf8TvNV7+yTiBEW2q13T6OFg+gWBK3v9ssrf9FK
         H5PVfRBnHTbZHoiBspce0HIGBguKEzE9BFJf0le02nGP98kRMPfhBqLRh9i5xZSdeedj
         ivA2Jz36XDUkowaRaqcjQtVP5JOs7piJmSNOSHwXJTBT4rG35xHqUYuWhaMBugR2q9Ea
         cDA4PCwJE+6iRWIUFtgCZZXxM6AcmHsPLBN5XAgqyUng2Qfj2RJr3KDIthEp+8LmImkS
         Ryb/G/HXvRGCXPTyBvEv9fIn/ksczsXpxRIYHluQyVx76ODiBfckXJERFAvdP0ypoihj
         j6tw==
X-Gm-Message-State: AOAM533sg5XiCgU12gJ3JWpllMf3OOxK7MrQb6xiPeP1gj2XLuT66xHg
        DMcr+rsNcoPwhW6v5CFU2B4C7vQgfb3fTvPBfO36k5Xcj5G1VK46fgPc59TU+2WSKZ15OfMpByj
        q3j3CFtDiyiTbEb11c6DFnAJ0OjZrW4utgp2AZZU=
X-Received: by 2002:aa7:d7d1:: with SMTP id e17mr24637987eds.84.1618820254499;
        Mon, 19 Apr 2021 01:17:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbgbYVj51767PEhDP7VAodeawbzJhcMg0iaGYdt1vBRijmX7LpaevyW3LVDSs2NNzeY/besg==
X-Received: by 2002:aa7:d7d1:: with SMTP id e17mr24637973eds.84.1618820254403;
        Mon, 19 Apr 2021 01:17:34 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id da13sm12384781edb.6.2021.04.19.01.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 01:17:34 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 4/7] mfd: da9052: Simplify getting of_device_id match data
Date:   Mon, 19 Apr 2021 10:17:23 +0200
Message-Id: <20210419081726.67867-4-krzysztof.kozlowski@canonical.com>
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
2.25.1

