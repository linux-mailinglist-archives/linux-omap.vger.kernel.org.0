Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8A58774350
	for <lists+linux-omap@lfdr.de>; Tue,  8 Aug 2023 20:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbjHHSBF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Aug 2023 14:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbjHHSAi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Aug 2023 14:00:38 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E96B08935
        for <linux-omap@vger.kernel.org>; Tue,  8 Aug 2023 09:27:49 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so45461a12.0
        for <linux-omap@vger.kernel.org>; Tue, 08 Aug 2023 09:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691512013; x=1692116813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0MBd/Q+2ZcBfYYCCch4YtWUjRgawyqEqYs8LS5NaBJY=;
        b=nzTTbU4it0DQqj5Zi/FvRJDs558ecv+MGz0MuEVdOZNsL7bKABGDGxxrWGqSgU0dRT
         R4Sx6JdUYn7KylLW6ii1Gk5YcI5atQNdt4P7eXA28EG08FOIbsPN6cR+rymvW1y3Zte5
         roTVP8lBT5XF3gkJVms1/vEOA7ySWriI8bvKt/oPtW/E0YTq4XDe8uY2bHiQsTsczezi
         WpE7gtRGY7qm43jz+W6kQch8QawsjMYE1rKf7+A1ZwVA6hjCJGuon86gUSj2+Oe46rZB
         sMXyK0e9Bt8V0rfKMc3zy2p+wlurTPt4/c9zAlyVlA8NC+gcHjQ2531cNpoURylw1l67
         wkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512013; x=1692116813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0MBd/Q+2ZcBfYYCCch4YtWUjRgawyqEqYs8LS5NaBJY=;
        b=SNivY9bUi9tKmA1F1RS47QZcxIFj4SuEm2ex9q4VRLJPSCcO4pStvN5p6MzfWaK6Yr
         E01Vkb7fQ9uwU/tKrNxe1v9SGHi6cecEz7SdrK/q3svylUlkuOmb1YKlduli+KmXyxYM
         4ntruUqjEG0AWbzwf3/i9IY1yQ8z5uVUutYPRGLcz3zBlvkMFVE7XEFwY3J9qJezh/fR
         Q1/f4QcoGu60i2ZaaBO0TumzSUJGf5OOWizTyAOQ+fMbaXyzUJXEfkLjadZ+iDCvQn2i
         XcI7zqEk20E4ZH5b8lqYK5+83L3qsOXFgLIR3wxmXJlICTjAtAH3NmTeeuITJv0C981z
         u62Q==
X-Gm-Message-State: AOJu0YzjZON+PwYJNOrhcpt46TspR3+pPOuZHdK9RBRck7HE3+U1zAWl
        SjIknDuiOQmJfQDcfNhQ30RhAIQ0fj8+suxa/ZY=
X-Google-Smtp-Source: AGHT+IHYNMNNe16C8Pb0pzogia3/9JPgNoj8pGTGRiE0IjzmUtDSgfL9UVebVwyuLdRgkO5hZzY/1w==
X-Received: by 2002:a2e:8e22:0:b0:2b9:b8ce:4219 with SMTP id r2-20020a2e8e22000000b002b9b8ce4219mr3051478ljk.6.1691502407365;
        Tue, 08 Aug 2023 06:46:47 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:46 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 15:46:34 +0200
Subject: [PATCH 07/11] regulator: mcp16502: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-7-939b5e84dd18@linaro.org>
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

The mcp16502 regulator driver includes the legacy header
<linux/gpio.h> for no reason, it is already using the proper
<linux/gpio/consumer.h> include. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/mcp16502.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/mcp16502.c b/drivers/regulator/mcp16502.c
index 6c6f5a21362b..7a472a2ef48a 100644
--- a/drivers/regulator/mcp16502.c
+++ b/drivers/regulator/mcp16502.c
@@ -8,7 +8,6 @@
 //
 // Inspired from tps65086-regulator.c
 
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/kernel.h>

-- 
2.34.1

