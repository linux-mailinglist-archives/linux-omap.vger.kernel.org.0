Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE614363D3E
	for <lists+linux-omap@lfdr.de>; Mon, 19 Apr 2021 10:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234501AbhDSISI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Apr 2021 04:18:08 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50444 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234863AbhDSISG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Apr 2021 04:18:06 -0400
Received: from mail-ej1-f69.google.com ([209.85.218.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYP67-0007v2-Qb
        for linux-omap@vger.kernel.org; Mon, 19 Apr 2021 08:17:35 +0000
Received: by mail-ej1-f69.google.com with SMTP id g7-20020a1709065d07b029037c872d9cdcso3362537ejt.11
        for <linux-omap@vger.kernel.org>; Mon, 19 Apr 2021 01:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tc7UDOgzQIAykIaB+pmrJMasrN1QkIFHd3HQXapxUk8=;
        b=dfe4U5toQZo1JXSp+4Ye10y7YPQe7GTqFE9dc3lwYJ1oqLW2au5k2n+vp9ATiXQUH3
         U1bGIkGr8emJIB5LgS4EybISdteVjETSCcIZmbsgOfUhDMXabunwH/VZXwNsIzTeH23E
         EEDvUsBNRl3rmUkGMRFAgHdzqAg2m9sfP9c5qWCofsWHYkYcRpTTpzfSJwKtB1yQTRjs
         30EGpjJmr8YfHYOWFHeVspxbIu+24deGS6ntaUf4JR9dsY44o5msnTG8o3k64irzw8PR
         si4zspA0gGzdMpJjpFciHjNTO4XvbwSkNDnf5/Bj6Hlxpm5kDlcyjDDP8509nrVZQFoy
         6KgQ==
X-Gm-Message-State: AOAM531b0MsQCcKpuwDnC0Z1CCIauLRoxSzSqJkh7wBtAiTa6HTox7Ga
        3SsznIngBYbgfQMjXXDWwa/VwLSFWkunfMsAmztHZ5RZusezMc3pB0FQWgTYotiTGc4ssQGVWm9
        iJryFKkIGk/IjEhV9FNZAZAFs6ZMHvVBr5RQu8K4=
X-Received: by 2002:a17:906:b355:: with SMTP id cd21mr20275783ejb.504.1618820255599;
        Mon, 19 Apr 2021 01:17:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuNTd9ZhGvDTg10FMK/NZMBEOBVAcdqe+s6V+fPsy8k7y7PvbXCS1lhxfXbnNILmmvl5bcsA==
X-Received: by 2002:a17:906:b355:: with SMTP id cd21mr20275768ejb.504.1618820255421;
        Mon, 19 Apr 2021 01:17:35 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id da13sm12384781edb.6.2021.04.19.01.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 01:17:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 5/7] mfd: sec: Simplify getting of_device_id match data
Date:   Mon, 19 Apr 2021 10:17:24 +0200
Message-Id: <20210419081726.67867-5-krzysztof.kozlowski@canonical.com>
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
 drivers/mfd/sec-core.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 8d55992da19e..3126c39f3203 100644
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
@@ -324,12 +325,8 @@ static inline unsigned long sec_i2c_get_driver_data(struct i2c_client *i2c,
 						const struct i2c_device_id *id)
 {
 #ifdef CONFIG_OF
-	if (i2c->dev.of_node) {
-		const struct of_device_id *match;
-
-		match = of_match_node(sec_dt_match, i2c->dev.of_node);
-		return (unsigned long)match->data;
-	}
+	if (i2c->dev.of_node)
+		return (unsigned long)of_device_get_match_data(&i2c->dev);
 #endif
 	return id->driver_data;
 }
-- 
2.25.1

