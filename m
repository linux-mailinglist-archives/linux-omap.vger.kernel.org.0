Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAC2A773D56
	for <lists+linux-omap@lfdr.de>; Tue,  8 Aug 2023 18:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232245AbjHHQQC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Aug 2023 12:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232258AbjHHQOY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Aug 2023 12:14:24 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04EA23C0A
        for <linux-omap@vger.kernel.org>; Tue,  8 Aug 2023 08:40:48 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so14373817a12.1
        for <linux-omap@vger.kernel.org>; Tue, 08 Aug 2023 08:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509246; x=1692114046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcDUBR/c5KhjxO4gQ1CxNRP1ojo3Pb8MjcUkheghccA=;
        b=ccCxAht5HPtW7XEuCo0+4Dj7jEkeSiiFT01xP356t5o96jXKaMx/BghJHuvXDA1qCj
         /ItgSbmtljLW5NgsrPiiyv29kiwN9sbPQx6hVugrDoqHgrR5cPl7tpOWugJrA+Y9XU5+
         soiyyDcAEc+5mR/Jalcm6LHWtvAT13ctuoh4bB5Zj04lfNymM6VlNMVbiZxZTFFIMWXo
         1Qtt8G3Np9i5VJ06Z6VRNc2m2+wT3LeR/p12d+BTTHmnJIakHqkEtYHfTqTCMioY6aRI
         wXVBnMWYmjI7fedC6dewHTBEZJt5iiH3Dvu/udhyxWBl/gP7cNSOHkj3iAHNf1kyQaXC
         qOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509246; x=1692114046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcDUBR/c5KhjxO4gQ1CxNRP1ojo3Pb8MjcUkheghccA=;
        b=Yhsbm/DJS3tnaqrO5dH4ymiPKiOLa0Ynrjfuciv1OSy5GCzHnyfb+SDC+8ecwsoipd
         22wh3rU6gcmqzsObeGq7ma9G2PEl1sDF4EGOFUVCoINVcceTFx7R3LlGHA4e9Cv9S9dH
         n8kSaX6tTFYOi7E/oYrYlNZ4VNucl/wySNz4HpW6gD4v0JnsCEidRpZI/kr1gF/GPmsN
         rfS+N9teoXnVjZhFZEpMV/XlFtJF5IXB5dKiVVK+3mt+Xhv/W9gUd1/KD5ZYX+0+haSP
         bpyFTbmKituJTVR/aA4yQE/T0xCwLzCNhu5dh5t+JMgyEhSfVAxPhNjMrGh/FrBHaLX0
         cwqg==
X-Gm-Message-State: AOJu0Yz9YRulH9S/xrZ9F3GGTuPnzoQxW0sTpxmRHRHYMhoA10ZTtRom
        GhOniMpFUeRGwoEZ+oahrFZ8fGBFV0xcsBnLMbA=
X-Google-Smtp-Source: AGHT+IFZRIPMWmSHgF0DTwYm5vWTgh/ZPFdc/lFtKvf3yaRIIaD/Q5hQaG6S670n+MjP6HDGCY+KnQ==
X-Received: by 2002:a2e:9442:0:b0:2b6:d0c1:7cd0 with SMTP id o2-20020a2e9442000000b002b6d0c17cd0mr2966685ljh.22.1691502400352;
        Tue, 08 Aug 2023 06:46:40 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:39 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 15:46:29 +0200
Subject: [PATCH 02/11] regulator: s2mpa01: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-2-939b5e84dd18@linaro.org>
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The TPS65910 includes the legacy header <linux/gpio.h> for no
reason, drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/s2mpa01.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/s2mpa01.c b/drivers/regulator/s2mpa01.c
index b147ff6a16b1..c22fdde67f9c 100644
--- a/drivers/regulator/s2mpa01.c
+++ b/drivers/regulator/s2mpa01.c
@@ -5,7 +5,6 @@
 
 #include <linux/bug.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/of.h>

-- 
2.34.1

