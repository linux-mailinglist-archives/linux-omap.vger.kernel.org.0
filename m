Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE0F773F99
	for <lists+linux-omap@lfdr.de>; Tue,  8 Aug 2023 18:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbjHHQuE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Aug 2023 12:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233455AbjHHQs4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Aug 2023 12:48:56 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F7D4AA87
        for <linux-omap@vger.kernel.org>; Tue,  8 Aug 2023 08:57:18 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fe10f0f4d1so9658547e87.0
        for <linux-omap@vger.kernel.org>; Tue, 08 Aug 2023 08:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510198; x=1692114998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1Y4agTqAvpXPwjQ+6mnmjNw7Ui1CynMHOt3cuxZe6w=;
        b=lCvSO/aU6RO53tMCyw5+mxJ/uxAe1C/Om080RvgOwKKUhVHYAiNDIc4VHX3d+jFOg0
         n1C2hlhEz3nRKeaeOSlpaUtv+vDIw4SHe9VBRdK0G27Lr+OiBGJ2cb4syJlBK8TQx4D1
         /M5OSvX8am2diMAGn7aDngV7ypo/R0x6GwRntXLORWXJlDEuIYuT+YyVajZqlNHECtoE
         KN0tGWiiLXks19x8bzies6d6ocEtXgdRVRd2WFP7tt24IJmjFhdbzGDXJe3/bq3+nY2q
         p7BJAMAzPlLdZs9BXm8xJL6015mPYlMha6xJeEAx52Xsuqog1st6vDnr836pW2OHw+5R
         vZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510198; x=1692114998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1Y4agTqAvpXPwjQ+6mnmjNw7Ui1CynMHOt3cuxZe6w=;
        b=LPIz/8+JkPM3ER2CyZy7HoE+lMqFw1W4ZwUBeOxhdGlLjzdpr3IYkoeN8NEfnlUWcl
         H0DfJve9gz90Fa6K2dRJa8FCp+KELjoQRAkrYWeBmLYf3EyQ2ZsfTtkLoNmN3LnRLOY7
         ndY01jvy6wGOIrQ490zsQeqt9RYWxa5ZrkjuPVBpg9KF50IKbKyRmr9tqa6CbdnX+q0y
         8hKX+bzNPRhDaw23c8GZoUgWfJj4xWWtY4ENA4rRF4j5nybBG1/Cin3T4O+IlKU8E3zq
         KZLxXN9G+/zHRgpwJWP1AbkY3v9TaKjyTzlXCoyPtEwOkuOuOHv9bcajd5QaZB0810VR
         yuZA==
X-Gm-Message-State: AOJu0Yw7HZw1P0oOAgGoshtCHz+wFYgTF5nfO7JevPqbAKal+YvxhTMW
        wj1/D+XUXkcmc68+MN+DjNgEABK7gP47iF8N9gE=
X-Google-Smtp-Source: AGHT+IE0omUPskRY/uk1H5XSLkdMB6vFjj8UCg/c58mkRX+yOkrTBA0j/8iJ1xj+dfPUVFqUwwFdrQ==
X-Received: by 2002:a2e:990c:0:b0:2b6:ecdd:16cf with SMTP id v12-20020a2e990c000000b002b6ecdd16cfmr8260383lji.40.1691502401865;
        Tue, 08 Aug 2023 06:46:41 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:41 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 15:46:30 +0200
Subject: [PATCH 03/11] regulator: rpi-panel-attiny: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-3-939b5e84dd18@linaro.org>
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
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The RPI panel regulator driver includes the legacy header
<linux/gpio.h> for no reason, this is a driver and <linux/gpio/driver.h>
is already included. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/rpi-panel-attiny-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/rpi-panel-attiny-regulator.c b/drivers/regulator/rpi-panel-attiny-regulator.c
index e9719a378a0b..949849baa7dc 100644
--- a/drivers/regulator/rpi-panel-attiny-regulator.c
+++ b/drivers/regulator/rpi-panel-attiny-regulator.c
@@ -7,7 +7,6 @@
 
 #include <linux/backlight.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/gpio/driver.h>
 #include <linux/i2c.h>
 #include <linux/init.h>

-- 
2.34.1

