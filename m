Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 835666B5A1D
	for <lists+linux-omap@lfdr.de>; Sat, 11 Mar 2023 10:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjCKJhf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 11 Mar 2023 04:37:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjCKJhX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 11 Mar 2023 04:37:23 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F8472197A
        for <linux-omap@vger.kernel.org>; Sat, 11 Mar 2023 01:37:22 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id y4so704208edo.2
        for <linux-omap@vger.kernel.org>; Sat, 11 Mar 2023 01:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678527440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zoFNgJXSeI0QXkwv/gajPhMKTUx0Ql0+UzzulYKcp8I=;
        b=vbuq92uTrFcz1QXjN5cnSNlg96KPUOHqt6l5sS8LDJThuZLSkQYO/OQrvtyyeBmhzp
         sIbfpuPfWkyChMnwl7W4s7V/HKIv5VnPpEpXl06TZFbCxw2ycBL/2WvRvW44dBg73LO1
         wSLA5oKyKHTLaRseDmGziNzcR/bRllDnyLZETF1LvRFbNor45Z7mCLhbNjYcx/3qPR7G
         S6LH9YzhGt8e/uZ0tO2ymY6F2qIS9P8gtbuvzF8K+dZjmZ0eQ74V6CuQGlW4PM6P9Vrh
         rRTWovXPqepPEPxPK+6lkkgDvw1f+UvtSx0iYOgq1i+gQjv0+tMtWdxA/ucVpqcFFNIc
         kgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678527440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoFNgJXSeI0QXkwv/gajPhMKTUx0Ql0+UzzulYKcp8I=;
        b=X6LqYxRaeAi1G9y86Nb6fWNIqne7e3jEO5kYI9H/gnQ/vqB1ILB/Q3WWkZc00D77EW
         hpx5IqKdbvXa7DAhPDctsGTb4LB8S5b1ah+XGYTCuj8j4UH0I8sstf6tKfSHuK6hYz/P
         SoINabTKN9xO3zCOcojVPY+Ph/k0RJhTBiFtv7bIMJUyJt6/9ndYhn1LU/f021bzx5fP
         ai+vp5/MNjllZ8v7Jl1T7k585LjVa+JJidpBxVMC7dHwCp3MOeDVKW7qfyKVl7HMTOiS
         EMItvgXHzglSKdQwQMBNQT73fZKdQkl/PGJB0VzYQR7jJh87Ltc/ghB21rfnteR4WEG4
         Gyzw==
X-Gm-Message-State: AO0yUKXMSfUxNbNU6+HuFQGlypCeK2R9YLng3sqo7tOAjx4Jr3NAsVmx
        ukHhfDuaNhooVhRuEXi2dGfbTQ==
X-Google-Smtp-Source: AK7set9tyci2a83B+v5hashuwoyakRSdq5rO9MANqmIWpVQFXA58HRMLT12lWsHLL7m6h0IFwe+NLQ==
X-Received: by 2002:aa7:ccd6:0:b0:4af:59c0:5add with SMTP id y22-20020aa7ccd6000000b004af59c05addmr25985018edt.37.1678527440685;
        Sat, 11 Mar 2023 01:37:20 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id y13-20020a50ce0d000000b004fa380a14e7sm631645edi.77.2023.03.11.01.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 01:37:20 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Tony Lindgren <tony@atomide.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jerome Neanne <jneanne@baylibre.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH] regulator: tps65219: fix matching interrupts for their regulators
Date:   Sat, 11 Mar 2023 10:37:18 +0100
Message-Id: <20230311093718.70803-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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

Not tested. However the cood looks so trivial and so buggy (could have
never worked), so I am really confused...
---
 drivers/regulator/tps65219-regulator.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index 4b5acaa45049..7f100361cbaf 100644
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

