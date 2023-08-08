Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7940773B9C
	for <lists+linux-omap@lfdr.de>; Tue,  8 Aug 2023 17:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbjHHPxj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Aug 2023 11:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbjHHPvz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Aug 2023 11:51:55 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3059A5245
        for <linux-omap@vger.kernel.org>; Tue,  8 Aug 2023 08:42:53 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b9e6cc93d8so93727371fa.0
        for <linux-omap@vger.kernel.org>; Tue, 08 Aug 2023 08:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509347; x=1692114147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXrzYWYweDcdHrf5UFjLFPgu3A2nA2Ia2fp24TPU+2A=;
        b=x7CyW3EJfbgD92/8gcRe+xdUuuN71wVQeAoNutNzZb8ro9vy5bztkc52Jh8guy8GU1
         60lkYDzmxthscRr6uNpJ5H22sqpp9AHWNrYGhrpzpghzbwFZqW2JCPzzJGl5Di0vTAZV
         ZTg2NK4c/rmpOmHdJoqoxdHMRBcADMHxrV1cbTMLcWyE9tQQ2oXCBGKrrplKB4+eJOuV
         ok7XOME6WnenpYI3r0cGSK9kG/9GR6XxsaeIFNYbLUOuPVUgNiJha9HyS6CAM+wtOH0Z
         Hzfy/aDKb1TFUY5orLuq0sZe/mLIUSceMmrIlY1M2OW2FGReqDOKYWi2AnYyamBRRCGz
         HEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509347; x=1692114147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXrzYWYweDcdHrf5UFjLFPgu3A2nA2Ia2fp24TPU+2A=;
        b=IeC7G9Yc9oqLF7vDF8/ISRacJfZ1LmRSZSsAaeLoXOu2IfBoY6xWqaGL+yI5Qikiw4
         3CshcNFz9mZ9QJfe8APJQtsfENE+5O3lSjEkffRJQMDVWX5xFu1wC2WHTT2UD+Gku3aH
         NYa1EXKb4mfdLLIh0vzysewHOwVKKpv5kVSih+KaOqEdsTBBX4OKOkvIstNX+dYEsXbg
         bzc4Mpw5faZ/ZrI0/ZzZortve2S1TW8W3DrSNM61FzFQElaiyLL4m8xKo/aYMQ88qffH
         uZYJdvMXFucIeVGgffoVnY3lZbjwafvCeU+WWsyGLotX1+6Gm5hUXtCR1X8DTyluz0vg
         blMQ==
X-Gm-Message-State: AOJu0YyRvuzD7bIOeImgOQkeFrIUQ3v0A1t788DktsqF6NpxuE2LDLYH
        G1GnH0bCiPD9TMer3lzdZYImr2Jx3HI51u0aA+U=
X-Google-Smtp-Source: AGHT+IEowhkuCmUF+r4Qwu7Ea/j6SLAKl0ohXdiWZmoM/iU49rY/8TQNDS4E142VCQ8PM8iR2Ecgeg==
X-Received: by 2002:a2e:90c4:0:b0:2b9:615b:39a9 with SMTP id o4-20020a2e90c4000000b002b9615b39a9mr8639502ljg.52.1691502399150;
        Tue, 08 Aug 2023 06:46:39 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:38 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 15:46:28 +0200
Subject: [PATCH 01/11] regulator: tps65910: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-1-939b5e84dd18@linaro.org>
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

The TPS65910 includes the legacy header <linux/gpio.h> for no
reason, drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/tps65910-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/tps65910-regulator.c b/drivers/regulator/tps65910-regulator.c
index 2a0965ba1570..3a3027e0b94e 100644
--- a/drivers/regulator/tps65910-regulator.c
+++ b/drivers/regulator/tps65910-regulator.c
@@ -17,7 +17,6 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
 #include <linux/mfd/tps65910.h>
 #include <linux/regulator/of_regulator.h>
 

-- 
2.34.1

