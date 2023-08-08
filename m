Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A241773E0C
	for <lists+linux-omap@lfdr.de>; Tue,  8 Aug 2023 18:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232517AbjHHQZa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Aug 2023 12:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232530AbjHHQYK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Aug 2023 12:24:10 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5DACAD01
        for <linux-omap@vger.kernel.org>; Tue,  8 Aug 2023 08:49:55 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-51cff235226so12327429a12.0
        for <linux-omap@vger.kernel.org>; Tue, 08 Aug 2023 08:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509784; x=1692114584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qejuevXVg8c+kej4ztr9ux7GUIQQ5z+UOyvSNuEDXRw=;
        b=l995gZ6iJunNHcHB2KJ36Yb/aSODX7hpyJo/rVrWMrL7hNAWyJfiDq5Yyw1mr0GVx8
         FYk4CMdfziNELLsw0JUxcsrCuGvAEg36X+DR03/7+Fw5z79Y+YqvBJDTbpvUHqw7iaHP
         +7SdGXNZ4mry6J8nak5nZCzePW4NvdTnKi4952xIjBC2BfiX5a5UGQ5Len+lV/wXfb9n
         1BVXSWkIIhzo46s2xQhRH8/c9WTRL4CR2kOksaG9VOMpP7tAsglwXDGgBcwSacChOlPu
         7UJGRCBLwboFa/NZGwHAeLXvJ2Dtnj6h1M6FCs5URfq3hE3d6acYcp6+De2UgyXueD9U
         pzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509784; x=1692114584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qejuevXVg8c+kej4ztr9ux7GUIQQ5z+UOyvSNuEDXRw=;
        b=Qwsln/bS3DQmOFQHMFYAvFYen5h3n5kGCNYuRPi1Vf/qJw8vzT8YgehQmjgS80GEzq
         sdkBEnz8Ch6FtrCECr3M+4UnyJAmCJIcUV0peRiiGgLe9ORO5gOAT1yYPNKHZPiLvsNB
         fYRyBSZdiq+Rk7NFc5x6lIqyFNY8X3IzQQgL/e07pAcRGLdKygUiBXeVKauXyXc45Vu0
         C4DEZy4BJPQwR9dDWKSTLfyaMssBaSdZwLVaO7kNP5EWZ5STb3NI1qK6r41gDeuqq8Bn
         tETBEWz2/seiYteTqGKSHRtD5HX1PUgVBxAfXyKZnvxEIn5v4Apzr3tnXclHttkrJmm+
         xUCQ==
X-Gm-Message-State: AOJu0Yyx/TTGs996X5INnIpPzgWQPqAb1BtpnARwHJN9+jS9U3JJWrZj
        i61L+qUHk8FHzCx7F2XLrwCZF67wNvvoqj0y62g=
X-Google-Smtp-Source: AGHT+IFQaReEoylTuoBa3pq7fPTiDA0ZX2U+hTy0EvkesIRlzxiuW1TvGZ9HVbCDFIPha62GXZlwgw==
X-Received: by 2002:a2e:9c89:0:b0:2b6:b7c3:bb89 with SMTP id x9-20020a2e9c89000000b002b6b7c3bb89mr3403498lji.18.1691502411764;
        Tue, 08 Aug 2023 06:46:51 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:51 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 15:46:38 +0200
Subject: [PATCH 11/11] regulator: bd71815: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-11-939b5e84dd18@linaro.org>
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

The bd71815 regulator driver includes the legacy header
<linux/gpio.h> for no reason, it is already using the proper
<linux/gpio/consumer.h> include. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/bd71815-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/bd71815-regulator.c b/drivers/regulator/bd71815-regulator.c
index 475b1e0110e7..26192d55a685 100644
--- a/drivers/regulator/bd71815-regulator.c
+++ b/drivers/regulator/bd71815-regulator.c
@@ -18,7 +18,6 @@
 #include <linux/regulator/driver.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
 #include <linux/mfd/rohm-generic.h>
 #include <linux/mfd/rohm-bd71815.h>
 #include <linux/regulator/of_regulator.h>

-- 
2.34.1

