Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E71E96F98FC
	for <lists+linux-omap@lfdr.de>; Sun,  7 May 2023 16:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbjEGOrE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 7 May 2023 10:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231609AbjEGOrD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 7 May 2023 10:47:03 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B69A11D8A
        for <linux-omap@vger.kernel.org>; Sun,  7 May 2023 07:47:01 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50bc37e1525so7045776a12.1
        for <linux-omap@vger.kernel.org>; Sun, 07 May 2023 07:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683470819; x=1686062819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Axa9RQ68hsv/IILOP7fge12GPPTaIZB7pViml3ZGK3o=;
        b=ZC5rF4Ww89xsCnZB/W2qSgvkRurCeynQHDEJfJW6nuYDODQpHQrra4uAfylCuJyNCf
         ofm0Z+scRP7HdD0yp1ZAGstWkbZLk7sBzo/vHoOHcwA1ISu4QD5NOQvC9093Fer/MAiJ
         eQuG5uNWVqwQeC/jlEIj42fpC1cKCtcZhKeX+W1FJsZp6RhHqSALH2LOoEc3dGsYkB+F
         q05aOknNjx1hAjS/pVzAbhmFarm/BhNCY6++DxWEJg5vUje0alJSYDjQw0XVf0vpqi2T
         cSeVz8nkSeg39nYMWr0O4RYzSimgecqjAPa9akDajGNbCSx93fdRS6NK7zgSAQqRHFnr
         O82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683470819; x=1686062819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Axa9RQ68hsv/IILOP7fge12GPPTaIZB7pViml3ZGK3o=;
        b=aP8Xs6iKQP32zOwB2kg4Kr5jsy+qADxZErJ5O4kbRJ/4UQq7T16zkDu+YuZckuWN+r
         M7estL7OIzPpKR/Xb0Cb2tMhUMJk+Z0lTM4njDwJHYjSlhc61fs5KgDBX0+R9I+kDBxD
         QaWd2ovTySjoZb3HpYTs5Ut/NPJAVKdWi1lTut4w3dOUxH8+H1Tsj573rGBoZbMQk+9T
         2/0+QHVFKWbSXGMmR1wKEEzKfJJMYMPC3jgL+AlH6eRxU7Vaw9k9NN55qoF3QqOIKmNo
         TyI+ISkU84pghdSYEutGP2W5naAUb2AOD/9HlbMu/4Du+lZYB3wEeT0fRrHe+5wNeTp4
         wBWw==
X-Gm-Message-State: AC+VfDzwDnMtrghakG1bbjtvFsbvLN02potpAGfCU7h+YzKaIf4c5Si+
        HaSb1vlFARTXtxItsk3FvvbF+w==
X-Google-Smtp-Source: ACHHUZ4z/mAGPq4xa//YhoiP75fH1bROCSH4dqKSxMFZxPU8cd7U9ak7duojvAubTAsoKbvfMk1jSw==
X-Received: by 2002:a17:907:1687:b0:94e:1764:b0b5 with SMTP id hc7-20020a170907168700b0094e1764b0b5mr7742438ejc.69.1683470819525;
        Sun, 07 May 2023 07:46:59 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:1757:b51a:9965:e81])
        by smtp.gmail.com with ESMTPSA id mm6-20020a170906cc4600b00958079b676asm3706913ejb.122.2023.05.07.07.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 07:46:59 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Tony Lindgren <tony@atomide.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jerome Neanne <jneanne@baylibre.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org, khilman@baylibre.com, msp@baylibre.com,
        j-keerthy@ti.com
Subject: [RESEND PATCH] regulator: tps65219: Fix matching interrupts for their regulators
Date:   Sun,  7 May 2023 16:46:56 +0200
Message-Id: <20230507144656.192800-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The driver's probe() first registers regulators in a loop and then in a
second loop passes them as irq data to the interrupt handlers.  However
the function to get the regulator for given name
tps65219_get_rdev_by_name() was a no-op due to argument passed by value,
not pointer, thus the second loop assigned always same value - from
previous loop.  The interrupts, when fired, where executed with wrong
data.  Compiler also noticed it:

  drivers/regulator/tps65219-regulator.c: In function ‘tps65219_get_rdev_by_name’:
  drivers/regulator/tps65219-regulator.c:292:60: error: parameter ‘dev’ set but not used [-Werror=unused-but-set-parameter]

Fixes: c12ac5fc3e0a ("regulator: drivers: Add TI TPS65219 PMIC regulators support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested.
Sent two months ago and no comments, so resending.

Cc: Jerome Neanne <jneanne@baylibre.com>
Cc: khilman@baylibre.com
Cc: msp@baylibre.com
Cc: j-keerthy@ti.com
---
 drivers/regulator/tps65219-regulator.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index b1719ee990ab..8971b507a79a 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -289,13 +289,13 @@ static irqreturn_t tps65219_regulator_irq_handler(int irq, void *data)
 
 static int tps65219_get_rdev_by_name(const char *regulator_name,
 				     struct regulator_dev *rdevtbl[7],
-				     struct regulator_dev *dev)
+				     struct regulator_dev **dev)
 {
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(regulators); i++) {
 		if (strcmp(regulator_name, regulators[i].name) == 0) {
-			dev = rdevtbl[i];
+			*dev = rdevtbl[i];
 			return 0;
 		}
 	}
@@ -348,7 +348,7 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 		irq_data[i].dev = tps->dev;
 		irq_data[i].type = irq_type;
 
-		tps65219_get_rdev_by_name(irq_type->regulator_name, rdevtbl, rdev);
+		tps65219_get_rdev_by_name(irq_type->regulator_name, rdevtbl, &rdev);
 		if (IS_ERR(rdev)) {
 			dev_err(tps->dev, "Failed to get rdev for %s\n",
 				irq_type->regulator_name);
-- 
2.34.1

