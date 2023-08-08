Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54EFD773BEB
	for <lists+linux-omap@lfdr.de>; Tue,  8 Aug 2023 17:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjHHP6Q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Aug 2023 11:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbjHHP4v (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Aug 2023 11:56:51 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B79FD5BAB
        for <linux-omap@vger.kernel.org>; Tue,  8 Aug 2023 08:43:54 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-31771bb4869so5100515f8f.0
        for <linux-omap@vger.kernel.org>; Tue, 08 Aug 2023 08:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509424; x=1692114224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+dlxZR3XfI563ojSxefCjRIUUjTHomDfo7z0fT83jY=;
        b=ky9LN/VKwQrzXxRSa8zUO484HFNXAPQmKv9+uroGFZyY6JCmrpL7sEOGrY8tv6G5/9
         Kj7R+ix7/nx95NwByAegXn7nog35WbL4kvoZWI8/CwPy557c8m00ZQVQj7Fskswps4Oa
         KZ32mztDvkXDwf7I/K3//AlGbYFw3hI32sID9vD7BUqs30pxIyylfvb41mmXMKdUKlvL
         TwrwQAisiEhEMOUL51POxOzUPVHQTmZQ6lfopYbQtkJM+StTlwcAYVAsvHsjmHz/m4I4
         aKFNcyXpVn4kuN2zwGINBz0cJk+LMfFr759YO65DRWFtqv28rIihemnNuEpFVOUz/vqm
         vWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509424; x=1692114224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+dlxZR3XfI563ojSxefCjRIUUjTHomDfo7z0fT83jY=;
        b=keL3HVt9wpki+3WeiLf69oBpeccl/4D+HEeE/HPIo8KelErFyP7ZDTXtFpW5Hng94Y
         36xZQYxn4CwVf3nuXrVnHAlEGMBgnQTX27GFwtO+9NJzJVaYAVAmwAEfluJKK1X5dE+w
         blqaRm4b5HR6cFFIEjOkTyQcnEm0yUAwuw6iCLGL5s/h+NSpUX4q25RpDj846F/pSRk8
         WhPtZFzxGubDAR/YOtVngqyDkAEVI+BSTtfk3vR7SUnhBJUL8jVEIF3UAMN8Df6rvDSW
         0XUxXdN8IAPrQimZx9lXop49QPbmtoEl2jaoGOlt8fYOVcJid3UDOPnSowczTvYovnaQ
         YC/Q==
X-Gm-Message-State: AOJu0Yx7v3k32V2F+CncsojqXENsxQQJIJcv2Lkq5nkWzMV2jidPvLKJ
        Dr4cqncaQsiKNRYEqzZtQgM9U7FlfFFgqvaIKh0=
X-Google-Smtp-Source: AGHT+IE+SDMqqQOfzDMcBQm6Q8z18mxaHPEwNvAM53y4c2JzhwsSdcZlgBmTg4v2rNjwyQRUpQmonw==
X-Received: by 2002:a2e:8791:0:b0:2b4:7f66:8c92 with SMTP id n17-20020a2e8791000000b002b47f668c92mr9274596lji.31.1691502410752;
        Tue, 08 Aug 2023 06:46:50 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:50 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 15:46:37 +0200
Subject: [PATCH 10/11] regulator: bd71828: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-10-939b5e84dd18@linaro.org>
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

The bd71828 includes the legacy header <linux/gpio.h> for no
reason, drop the include. The documentation mentions GPIO but there
is no usage of the GPIO namespace.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/bd71828-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/bd71828-regulator.c b/drivers/regulator/bd71828-regulator.c
index f3205dc9d4fc..08d4ee369287 100644
--- a/drivers/regulator/bd71828-regulator.c
+++ b/drivers/regulator/bd71828-regulator.c
@@ -5,7 +5,6 @@
 
 #include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/rohm-bd71828.h>

-- 
2.34.1

