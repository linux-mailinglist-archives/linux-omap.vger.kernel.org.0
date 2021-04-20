Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60A23657B8
	for <lists+linux-omap@lfdr.de>; Tue, 20 Apr 2021 13:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231954AbhDTLkJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Apr 2021 07:40:09 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39112 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231894AbhDTLkI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Apr 2021 07:40:08 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYojA-0005UN-BY
        for linux-omap@vger.kernel.org; Tue, 20 Apr 2021 11:39:36 +0000
Received: by mail-ed1-f70.google.com with SMTP id z3-20020a05640240c3b029037fb0c2bd3bso13054465edb.23
        for <linux-omap@vger.kernel.org>; Tue, 20 Apr 2021 04:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1QRQo+xpUYHPCxTbJPvKb59/XsQMOAX0KEXbrpjY1cc=;
        b=XFfC0HKtbqqv23s1LNoKdwSs42kO2QeDTfIpfTFu7Mrx36qdaZeAowlLLFkkrFtH9Y
         ZmxIGpCY0oy5/2DZevhJhn92VRk6rmdBu7dFIBeI430nhLSCHoSC8A/8az8EsghONGmR
         JTAX8b0U9Y62R+gGbWJFmZ0tAatH/DTmITNpnc06KewsRBtpTW8xsU+memhRqYU69vS+
         EznvH0YDEAJm0EA6DN2LSFidwzB9n7c7Fp47Stzm8uSghlr8PGNTVIbackEy9fnQCAQZ
         I7ufyv+z59/UZI1gJyHQymmyJtVusJj+ZDSLKJSOlpvoaI/wAjn2RC0ANSCRDTyiwmeY
         kFPg==
X-Gm-Message-State: AOAM532AYyMGyuXbzk0CtWEN+NOrN/34vGMmIyW5fbRUnupOZ+/Oo6et
        NZvQtEQ3JwEIpCjAprtNFay1p45QHKBSdkHfuUvM6/dImSZ8b6m+qz7YL6Tedn+boGBiSBNo9Z3
        hUIidOV8vOc79cZPicq5cpkw+8PLREkzE9MgmwWg=
X-Received: by 2002:aa7:c9cb:: with SMTP id i11mr6030781edt.331.1618918775748;
        Tue, 20 Apr 2021 04:39:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxenHfop9KAauFCZtv5V4COrg2sAveJWXuaem0SSGfvEBrhcrropUIwjQVfyJ44In3y9caFVA==
X-Received: by 2002:aa7:c9cb:: with SMTP id i11mr6030762edt.331.1618918775613;
        Tue, 20 Apr 2021 04:39:35 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id bw26sm10109007ejb.119.2021.04.20.04.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 04:39:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: [PATCH v2 3/7] mfd: da9052: Simplify getting of_device_id match data
Date:   Tue, 20 Apr 2021 13:39:25 +0200
Message-Id: <20210420113929.278082-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420113929.278082-1-krzysztof.kozlowski@canonical.com>
References: <20210420113929.278082-1-krzysztof.kozlowski@canonical.com>
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
---
 drivers/mfd/da9052-i2c.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/da9052-i2c.c b/drivers/mfd/da9052-i2c.c
index 47556d2d9abe..5d8ce8dca3fc 100644
--- a/drivers/mfd/da9052-i2c.c
+++ b/drivers/mfd/da9052-i2c.c
@@ -154,13 +154,8 @@ static int da9052_i2c_probe(struct i2c_client *client,
 		return ret;
 
 #ifdef CONFIG_OF
-	if (!id) {
-		struct device_node *np = client->dev.of_node;
-		const struct of_device_id *deviceid;
-
-		deviceid = of_match_node(dialog_dt_ids, np);
-		id = deviceid->data;
-	}
+	if (!id)
+		id = of_device_get_match_data(&client->dev);
 #endif
 
 	if (!id) {
-- 
2.25.1

