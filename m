Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49E467747CD
	for <lists+linux-omap@lfdr.de>; Tue,  8 Aug 2023 21:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235086AbjHHTUF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Aug 2023 15:20:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236082AbjHHTTx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Aug 2023 15:19:53 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B39A140134
        for <linux-omap@vger.kernel.org>; Tue,  8 Aug 2023 09:43:04 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fbea14700bso50289795e9.3
        for <linux-omap@vger.kernel.org>; Tue, 08 Aug 2023 09:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691512981; x=1692117781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0cDrJs50zXCjDACInHgYpsbmw7IC3CDn78nE0wDJEU=;
        b=MoVU4ohKFIcnCW31aA/hEkV5NoHjrGz+pFsHTFr+eTPTYDx/59PL2D1Px+HlBTVpwn
         69ZQQ+qsY7Sp4Hl2vy9qMLP8b/hm6KC0dJ2pI7Pfd2VUkANIGVlwSdDP3vRo6cecy+uy
         Rlau3lrshQmkTSswPpYgk+SBN42MbsCxkXOcKKnPauYPa42A7en2+G1CGVxpODnpQmB1
         weuztNSzjfzCBX01vR8whmd/qIioV/cZPKN3Y8dSBwJSfswWtJNcWY94pmmXfxHj2/0A
         j4HUlSIc8107Mf0zB1NS/m2McbSxojRnPwxVE22zBXWh7syCmRF+PE+IaBWMSfPwlOck
         40xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512981; x=1692117781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0cDrJs50zXCjDACInHgYpsbmw7IC3CDn78nE0wDJEU=;
        b=WjYTj2oggLamsme78zAKzQYIhRkXFzKXeDpuMIhgtzO2EoXqyzN2bamWXv5cT7lBj5
         RK46O8j81qzi0bCBzaV96tgqqNJ+MrSaiOFWCcSXBL8EFVInS1MGjjhPoNCr3z4tBTih
         TDrWpFLZd87aNNYwEKySThOmQzZC2iXs9MKEq5xO80qYCp33mI8OIbwRT1CHPtvdFuRW
         lhORqAXEQtNb65benG8SXgMGeYRHh1r99VAdQcd2TXPNa5T7ivv1Evq9xTe9hWdiwEnK
         Mt5NTCiXxNQJfjuO3oa9yttlJSK9DZLVzQddzgsbKy3laEqKZ5D2EHDNVyuoYCtsPEA8
         9ktg==
X-Gm-Message-State: AOJu0Yw79qfWdSUKvtSa7AmXi9WsFW9gOHyZ5+SxbPHa/XbrrR4Ue1X5
        N/zC9xkA9YO/UEffhEVc46D4230ZknYs1cu0bn4=
X-Google-Smtp-Source: AGHT+IHyCb1MAZ9guoP9QuCWqFrH2Mfihs7/gMTBRCoMInNTntAhiMDP4HfHYPGkmdal7HBOrio1hg==
X-Received: by 2002:a2e:b708:0:b0:2b9:d074:1871 with SMTP id j8-20020a2eb708000000b002b9d0741871mr8655874ljo.45.1691502408584;
        Tue, 08 Aug 2023 06:46:48 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:47 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 15:46:35 +0200
Subject: [PATCH 08/11] regulator: max20086: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-8-939b5e84dd18@linaro.org>
References: <20230808-descriptors-regulator-v1-0-939b5e84dd18@linaro.org>
In-Reply-To: <20230808-descriptors-regulator-v1-0-939b5e84dd18@linaro.org>
To:     Tony Lindgren <tony@atomide.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The max20086 regulator driver includes the legacy header
<linux/gpio.h> for no reason, it is already using the proper
<linux/gpio/consumer.h> include. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/max20086-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/max20086-regulator.c b/drivers/regulator/max20086-regulator.c
index fad31f5f435e..32f47b896fd1 100644
--- a/drivers/regulator/max20086-regulator.c
+++ b/drivers/regulator/max20086-regulator.c
@@ -6,7 +6,6 @@
 // Copyright (C) 2018 Avnet, Inc.
 
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>

-- 
2.34.1

