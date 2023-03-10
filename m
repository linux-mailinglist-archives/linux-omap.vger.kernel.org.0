Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FAB46B537C
	for <lists+linux-omap@lfdr.de>; Fri, 10 Mar 2023 22:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232089AbjCJVzw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Mar 2023 16:55:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232090AbjCJVz0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Mar 2023 16:55:26 -0500
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0F5D16321
        for <linux-omap@vger.kernel.org>; Fri, 10 Mar 2023 13:51:59 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id u9so26171152edd.2
        for <linux-omap@vger.kernel.org>; Fri, 10 Mar 2023 13:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wk7HS+JU2o5z8u8D+phfvsWKJzSNNAcdYUjf3Uh+O54=;
        b=Er3ZlEVmoHoIsKsxxmk3YiAdjEKW2o7aagUdkvk8ACc/AZti0eUPVtEBK8r4r0smjz
         pB+sZJQgrdwpZYqfgqnS00yJsCXRm4tuxpKc9Sv323GEDDFRnD1x9yhqAjA0TAH+pD39
         /NgNPgn1qAdB2VMocKQHi9RfthoRIiGig5whQaEgGz2y6LGsFtY8/7u3AgHnh1ysTixO
         lo6Fd82XFMyeVBYZ+eAjyGMolA6uQ3qrk/k7hLR6+oBu47T9as0SzNFVZLaPbQ5p0hEu
         xzfTRrmQl+xvZUdIRvF+timC/BMSv6n2PpI4xuBenWLMdJ9K0wzRhzAUHGQoc6i5W58C
         qjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wk7HS+JU2o5z8u8D+phfvsWKJzSNNAcdYUjf3Uh+O54=;
        b=2yLi7cqY8IHYoFdWOYIkS7vAynQG1BhGT0SAma65lHdzdH46HfXcbBiI0x5NIRKbLd
         brpZBuLGtQ3Pz1/moyLfY1VD7/Ik7AQBzxyHqqv9uIFTS8M2NW+8YUPBgUC2lJB+AYhq
         67r+tptHyg9/k8cQI3P7XUz2gYKYhx2BiF0BAxPOJ3EGO8IJ7AP8DMMT6S407mAV7k+a
         pWnY6x7bjo1rJg+dXAhZPcGpxAR0PSGYbjJB5OAya3vthmoFN3ubi2A7DVTdaMtBKoR2
         4YCzTr40scS5z8IBqpY4xtDNXT4RMKciSneTJXpkI+r4UnSLOeft1inLVaaY5ytaHMcd
         haZA==
X-Gm-Message-State: AO0yUKVmekE9CgMjRkFf3zjAUAOlWSsKEp3agHyKUYowcRS2SWLLdcKV
        lmqWCQq8g2C22RyU0q0vjVjmCw==
X-Google-Smtp-Source: AK7set+WoLtwDyXQs64e0OH3A2wuyS/PRDS8GfsEZZYgVKRSciJQ1Uv0cpz+JjrSwSdUGQxlZtR+eQ==
X-Received: by 2002:a05:6402:202e:b0:4be:3b3e:c226 with SMTP id ay14-20020a056402202e00b004be3b3ec226mr23145020edb.7.1678484756376;
        Fri, 10 Mar 2023 13:45:56 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id u7-20020a50d507000000b004be11e97ca2sm471873edi.90.2023.03.10.13.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:45:55 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Tony Lindgren <tony@atomide.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/9] regulator: lp872x: Mark OF related data as maybe unused
Date:   Fri, 10 Mar 2023 22:45:45 +0100
Message-Id: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/regulator/lp872x.c:931:34: error: ‘lp872x_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/lp872x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/lp872x.c b/drivers/regulator/lp872x.c
index c576894c3d52..c3a6e77db4d0 100644
--- a/drivers/regulator/lp872x.c
+++ b/drivers/regulator/lp872x.c
@@ -928,7 +928,7 @@ static int lp872x_probe(struct i2c_client *cl)
 	return lp872x_regulator_register(lp);
 }
 
-static const struct of_device_id lp872x_dt_ids[] = {
+static const struct of_device_id lp872x_dt_ids[] __maybe_unused = {
 	{ .compatible = "ti,lp8720", },
 	{ .compatible = "ti,lp8725", },
 	{ }
-- 
2.34.1

