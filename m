Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB0BA774514
	for <lists+linux-omap@lfdr.de>; Tue,  8 Aug 2023 20:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232385AbjHHSgn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Aug 2023 14:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjHHSgT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Aug 2023 14:36:19 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 789F43FD29
        for <linux-omap@vger.kernel.org>; Tue,  8 Aug 2023 09:39:46 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99bcfe28909so809618566b.3
        for <linux-omap@vger.kernel.org>; Tue, 08 Aug 2023 09:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691512782; x=1692117582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qtIG2M/ca+5GsdX8n1RK00emvWGjV3tMf5tcX7VIHus=;
        b=lw5oXgBN02fqPQOcrfWvDKiuXEtHO/tkIfZqSspcB0N54zQZuaKnjzZWm+rOoN6bpK
         5Zlj3qwF2Fjp32swHwMm7T6y7zGh5IFzu9hAz6EKBIlqoPfbPnSHy2kcx7Qi44lum91w
         6XkNZxG+9wqKp80CosobwF9D6BqP2TYzfQt/ENHLdn9bVkFzMT4EB/tU0eH8Wu7YPIY4
         MVI8ORkDZYHXoEW/6cHpTNz9Mb0V2A1RZbyLMGl4uFTqDMM5sG34Grji26xVWXyrjpdj
         XpwS4qdjSnXY6bT7x40JdFQERC9rp1fdIkUDypM2UkUlU0xytJBaOQ46cUzrj8C7Ms3G
         Ac0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512782; x=1692117582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtIG2M/ca+5GsdX8n1RK00emvWGjV3tMf5tcX7VIHus=;
        b=J4ky4aUNGQaSWRZe1J2fG2FQDyrdD/qfuyjDJuDXKNiBtLegm7fq0IscoVS5zMeCru
         XS+kbybr+SrkDLrmwpy6km4o+xJPJPAlJycZX2rBng3ViuhcAO1dWURznKEneMHoR7l6
         ItE7exhqom04kzHqWi/QkhKV6ujFsmZ58Z0K18vC2TtR74y9Kzdjmkm56uvRXZEX9xET
         w4RRLTEjE1p75dZuDrdbRxnvMqNWvaYKeaSuGoQFgBX9sXXXHKjqE5Ai/Q8urLPF+Uq8
         2dxR5Cgoxu3dueAqaLmtA9J3lj/qf7hw6eYIpbXaky0Z5ZfP+NaJys8slcnTY3L38bHf
         nR+w==
X-Gm-Message-State: AOJu0YzltrJfiUC8JxnT5lmm5gkV2sht0Yp4mJ5kczr6gfToK0ZeDrVP
        gOeS1b7mTIPFjiIWBvS0Vy+jCq9Ctx4hRRYVSDY=
X-Google-Smtp-Source: AGHT+IGabpvcf+YfqqvSp128b6pb/ZcVi3xmONq1O6a4S0szO5ZdOqerklrUaTjPj2ZyYc9Tu1UkPA==
X-Received: by 2002:a2e:6817:0:b0:2b5:8a21:5627 with SMTP id c23-20020a2e6817000000b002b58a215627mr9324746lja.51.1691502403287;
        Tue, 08 Aug 2023 06:46:43 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:42 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 15:46:31 +0200
Subject: [PATCH 04/11] regulator: rk808: Drop useless headers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-4-939b5e84dd18@linaro.org>
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

The RK808 is already using the proper <linux/gpio/consumer.h>
header and includes the legacy headers <linux/gpio.h> and
<linux/of_gpio.h> for no reason, drop the includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/rk808-regulator.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/regulator/rk808-regulator.c b/drivers/regulator/rk808-regulator.c
index 460525ed006c..e65339ef47ad 100644
--- a/drivers/regulator/rk808-regulator.c
+++ b/drivers/regulator/rk808-regulator.c
@@ -15,10 +15,8 @@
  */
 
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/mfd/rk808.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/of_regulator.h>

-- 
2.34.1

