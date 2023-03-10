Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F41976B53C5
	for <lists+linux-omap@lfdr.de>; Fri, 10 Mar 2023 23:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbjCJWFX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Mar 2023 17:05:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232274AbjCJWE7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Mar 2023 17:04:59 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E3CB19F00
        for <linux-omap@vger.kernel.org>; Fri, 10 Mar 2023 14:03:10 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id j11so26256398edq.4
        for <linux-omap@vger.kernel.org>; Fri, 10 Mar 2023 14:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678485789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8KkEKWZ0gN3SHohoHksswAukmLUtCvLSzW/QOjaikM=;
        b=CrbP7x7mFKFEadLy2m1i596OVPBIVCD90Gi+0DI156lg1du5aezIPT837YdWHl9/FG
         RxioT1N1wVcak4vk4FsbeFG0AtN6G46sVvCfJ6h9Vf1RGXvwcWFZW2UHJHoWH4dbcywe
         4F460LEn3koRnfF29tUTKHug0GIZGsWPd51xC19UWhlD7Jf0ON6WQfRXTsGWQOLaX6YM
         mQUpp5M0IOViDhvFC7dUQTwCRtkn0T+1jcEnU9DZJy4m0HnCgMRyS2S3qPab85X2Bdzv
         5LJoDHs3gqlXtUU5vI/cvqOCxpr226Sp12Ecu9SVWlmIcVLlRMdfejAVvq/FLzMLeqHa
         Ensg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678485789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8KkEKWZ0gN3SHohoHksswAukmLUtCvLSzW/QOjaikM=;
        b=H2qkHN/D1PGFAgzoNDXZGaoqJ121BxFmaLkQXGtH0rQ+NGQcdrIxR8JrSAAPmPIWgA
         iNJpWJAgKD0nF6sgtw01mr/vkIFi0EPArzunobC707uqZRuahI7qCxfTuWyufOfyjhYL
         yqQaX7aRPQHnyLRicdO6AbgiX6lWfbl96nmjuAmyJADt9/bBuJNmMFiLBgdv5ndZsGvp
         8G/ncHKCqWS6xIjor/1b/Petx+CK50nLR+BBNKJ93ImgoVNBayRc+1h8ZVzR1j7U8D8v
         xwnFOKecW+VmdgJB/QHMZ3T2tGdEmTXCYs7jPklUO43ux/FJnO/95Tbm2FIyeKbYF9Wc
         Np3A==
X-Gm-Message-State: AO0yUKXxZBq1kfoHI+fdRPuexfZrTQAl3f+QgjO8LONp/NNwtbIeIxst
        mxakqj3UrzK0uy3rN2yDdzpUtDLE5b5xChHvydA=
X-Google-Smtp-Source: AK7set+C1404HGuunAfB3xCjsvxwrV5s95xwTHsN/mtfZYe+CBdiAMXV1CvssAAn+RAQCfGwoNG2gg==
X-Received: by 2002:aa7:d646:0:b0:4af:601e:6039 with SMTP id v6-20020aa7d646000000b004af601e6039mr24224761edr.22.1678484766010;
        Fri, 10 Mar 2023 13:46:06 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id u7-20020a50d507000000b004be11e97ca2sm471873edi.90.2023.03.10.13.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:46:05 -0800 (PST)
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
Subject: [PATCH 8/9] regulator: twl: Drop of_match_ptr for ID table
Date:   Fri, 10 Mar 2023 22:45:52 +0100
Message-Id: <20230310214553.275450-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it is not relevant here).

  drivers/regulator/twl-regulator.c:553:34: error: ‘twl_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/twl-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/twl-regulator.c b/drivers/regulator/twl-regulator.c
index e2a20d512152..fe80a5e20bd0 100644
--- a/drivers/regulator/twl-regulator.c
+++ b/drivers/regulator/twl-regulator.c
@@ -656,7 +656,7 @@ static struct platform_driver twlreg_driver = {
 	 */
 	.driver  = {
 		.name  = "twl4030_reg",
-		.of_match_table = of_match_ptr(twl_of_match),
+		.of_match_table = twl_of_match,
 	},
 };
 
-- 
2.34.1

