Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EEF2773B2A
	for <lists+linux-omap@lfdr.de>; Tue,  8 Aug 2023 17:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbjHHPoz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Aug 2023 11:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbjHHPn3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Aug 2023 11:43:29 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7A9B4
        for <linux-omap@vger.kernel.org>; Tue,  8 Aug 2023 08:36:26 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-317716a4622so4582161f8f.1
        for <linux-omap@vger.kernel.org>; Tue, 08 Aug 2023 08:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691508983; x=1692113783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUr4rBKoQ5U9kNDxTC6J3Fd6dDx63tGiQB8aHXquZB0=;
        b=PkGBvhndmfvUvYJYEGmfZ4l04y1JgAg5iB4vCCBh1VBFxWinGkNh2KVxnm9xtM3BBw
         Kaows2b0Qt+lQbhsjYsP4nmReDBYnazRWwb3/6UNmgisTCkyIB/+bfoDu7uLxWe9EWd6
         tY7tsBlHlT4DgiA8Cft7ZSJDQ2+e3uZsov73fEMT2ag9qvs0mG0RodkJI3nLxtjShAtK
         CPFloh9EOeYhPWDZM+9gcE/gP5ET6dKXE5qgkbDGR9sPCUA3leVO+AK5GtWVSyXObfWO
         3qWe06LVjrXoYRnHGwTso279CFq7CI9fwqapfy5+OnLms7KOITe3z/AV8vE/ruteAjZd
         G5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691508983; x=1692113783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NUr4rBKoQ5U9kNDxTC6J3Fd6dDx63tGiQB8aHXquZB0=;
        b=H7q/ShvYOkpsgR+XgKGegcBCuNiP89/z3jtBWPzKRXPMr6eov9iQFut4B2YU575huC
         diDbt3aeEb0s3AdUiKNjEJyb4hy0zUso00JQOBtOC4jgSG9XKY7iis220e8XAV8pXpoO
         LINCXwn5gyBRNhn9nzHhKrAxQKc1/AIx492fHaqRTMXMqxhtMUWST6xWW/3XlnNdBYIz
         S4ux4u2O9GmObDl4IY9MnlPFSpYvDuRPLN9E1Y6pjvyeh3poCOpI4v7Nq7DyhsUnPOZC
         Vwh8tEjtTbZgMEe0UC+o5MhvJIzpy/Jq57ig/Py6JrClj+XjyfTcO77JPJKr5EPO3a6n
         AYEw==
X-Gm-Message-State: AOJu0YwSCYzHJz3VZ4m0P7vmorIynYdyWvDif+oYZATa24UkpFFKQOvE
        /sryanhDxv4hCJJbYivbqEWqpYpsUVZ7vVsS7ac=
X-Google-Smtp-Source: AGHT+IGl6ac+w+vJLfJZuq8P35/Ynv+o1liAhoqzrNLA3A9/ISpnNwHIwbTBb6DgRgGMJoZAmBq78w==
X-Received: by 2002:a2e:95cf:0:b0:2b6:a763:5d13 with SMTP id y15-20020a2e95cf000000b002b6a7635d13mr8927600ljh.27.1691502409667;
        Tue, 08 Aug 2023 06:46:49 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:49 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 15:46:36 +0200
Subject: [PATCH 09/11] regulator: lp8755: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-9-939b5e84dd18@linaro.org>
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
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The lp8755 includes the legacy header <linux/gpio.h> for no
reason, drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/lp8755.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/lp8755.c b/drivers/regulator/lp8755.c
index 4bc310f972ed..8d01e18046f3 100644
--- a/drivers/regulator/lp8755.c
+++ b/drivers/regulator/lp8755.c
@@ -13,7 +13,6 @@
 #include <linux/err.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
-#include <linux/gpio.h>
 #include <linux/regmap.h>
 #include <linux/uaccess.h>
 #include <linux/regulator/driver.h>

-- 
2.34.1

