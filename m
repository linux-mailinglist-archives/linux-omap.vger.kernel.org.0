Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E68736B1C9D
	for <lists+linux-omap@lfdr.de>; Thu,  9 Mar 2023 08:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbjCIHqD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Mar 2023 02:46:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjCIHqB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Mar 2023 02:46:01 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27865DCF6C
        for <linux-omap@vger.kernel.org>; Wed,  8 Mar 2023 23:45:59 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id r27so1134695lfe.10
        for <linux-omap@vger.kernel.org>; Wed, 08 Mar 2023 23:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678347958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3J7dPBvISDsm7K/tqEkOGjTGzAkWKpmXKqK/yWwAM9o=;
        b=iY+SY1LIdoAVm51tddLFKx/+2eccgntYfbsSyXmvTPoMU5aYr959/qgD7O/lVfLfLi
         blBw+4ykSBG4AdAZjSdISmzV8Q/QCmAzVPc5eNX2t08XQy+cg4Utx8RQYNxa+LzbW7s/
         ZqytsDEDtkx14JCpgzL/Kh27HWDByrN9L3SUZm0Deh6evvb5ZhgzkUNOdSIuxGifl37T
         4GtKAcZedqLb41hyQRRLmoIwZp9h0Cieh8oX1ugkzM4LZQTISn46c9D5o3q9jazJ038+
         hFeRiJjhW2ovjw/64Do94VXB56FfLUrjY4L1zgG0aX0jXI2i/HBTj5MizFebD3sJcJIO
         Q89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678347958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3J7dPBvISDsm7K/tqEkOGjTGzAkWKpmXKqK/yWwAM9o=;
        b=Ceyeq0gXJRXultqeCE4DNcyZ6KjArrdiSMBfTjFlYlmZvZtnBz/NcqYkA+Cm71Wpgr
         fX2G8b8VukNjSARsKtZOxwsgIMw2HE2xOvXCr06BXYHPZ3KZpRFFbm/KfM+MEggFWSz4
         SCB6a36NGi9GT05giQw89p6Jq3xXwXlNsjhM4kQXxjse6r18XK/HfhaR/ftzhBFyrQVo
         X3WVcypcPzksYp9aNG/kaN1WcjlLNeEKlvIj/k45JNUcWID5WurxQqJL/ePy9F2zhCCc
         XRq3pwZaIoHHilojd1tlD7HCwtr1UFHPe7RYc+0PCwbaur0OvfklQMRGwYu3ZHRpIRsB
         2tHg==
X-Gm-Message-State: AO0yUKX7hAdavCl0JPJlDexLewmgDV9NKhR/3GBM9wxg2YZ+mK8SopSe
        +lNXEtThXpKHliLO9kmLJRzshA==
X-Google-Smtp-Source: AK7set+xhLBmPqypzxZGrQllf47M/+e98U4TBDXDh2vxKVmQrSemX30LYekYnP5U6V5Wqi31VO335w==
X-Received: by 2002:a19:ae01:0:b0:4b4:9068:2c0b with SMTP id f1-20020a19ae01000000b004b490682c0bmr6917425lfc.2.1678347958739;
        Wed, 08 Mar 2023 23:45:58 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512020600b004bb766e01a4sm2568972lfo.245.2023.03.08.23.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 23:45:58 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 09 Mar 2023 08:45:51 +0100
Subject: [PATCH v3 03/17] gpio: aspeed: Always register the irqchip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v3-3-972542092a77@linaro.org>
References: <20230215-immutable-chips-v3-0-972542092a77@linaro.org>
In-Reply-To: <20230215-immutable-chips-v3-0-972542092a77@linaro.org>
To:     Mun Yew Tham <mun.yew.tham@intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, Alban Bedel <albeu@free.fr>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Jay Fang <f.fangjian@huawei.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        William Breathitt Gray <william.gray@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-omap@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Joel Stanley <joel@jms.id.au>

The driver was implemented in a way that made the irqchip optional, if a
irq was not present in the device tree. However, all of the device trees
have always had an irq, so the optional-ness has never been used.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-aspeed.c | 49 ++++++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index a94da80d3a95..129f6a6b4d1d 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1137,8 +1137,9 @@ MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
 static int __init aspeed_gpio_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *gpio_id;
+	struct gpio_irq_chip *girq;
 	struct aspeed_gpio *gpio;
-	int rc, i, banks, err;
+	int rc, irq, i, banks, err;
 	u32 ngpio;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
@@ -1201,31 +1202,27 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 		aspeed_gpio_change_cmd_source(gpio, bank, 3, GPIO_CMDSRC_ARM);
 	}
 
-	/* Optionally set up an irqchip if there is an IRQ */
-	rc = platform_get_irq(pdev, 0);
-	if (rc > 0) {
-		struct gpio_irq_chip *girq;
-
-		gpio->irq = rc;
-		girq = &gpio->chip.irq;
-		girq->chip = &gpio->irqc;
-		girq->chip->name = dev_name(&pdev->dev);
-		girq->chip->irq_ack = aspeed_gpio_irq_ack;
-		girq->chip->irq_mask = aspeed_gpio_irq_mask;
-		girq->chip->irq_unmask = aspeed_gpio_irq_unmask;
-		girq->chip->irq_set_type = aspeed_gpio_set_type;
-		girq->parent_handler = aspeed_gpio_irq_handler;
-		girq->num_parents = 1;
-		girq->parents = devm_kcalloc(&pdev->dev, 1,
-					     sizeof(*girq->parents),
-					     GFP_KERNEL);
-		if (!girq->parents)
-			return -ENOMEM;
-		girq->parents[0] = gpio->irq;
-		girq->default_type = IRQ_TYPE_NONE;
-		girq->handler = handle_bad_irq;
-		girq->init_valid_mask = aspeed_init_irq_valid_mask;
-	}
+	/* Set up an irqchip */
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+	gpio->irq = irq;
+	girq = &gpio->chip.irq;
+	girq->chip = &gpio->irqc;
+	girq->chip->name = dev_name(&pdev->dev);
+	girq->chip->irq_ack = aspeed_gpio_irq_ack;
+	girq->chip->irq_mask = aspeed_gpio_irq_mask;
+	girq->chip->irq_unmask = aspeed_gpio_irq_unmask;
+	girq->chip->irq_set_type = aspeed_gpio_set_type;
+	girq->parent_handler = aspeed_gpio_irq_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(&pdev->dev, 1, sizeof(*girq->parents), GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	girq->parents[0] = gpio->irq;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_bad_irq;
+	girq->init_valid_mask = aspeed_init_irq_valid_mask;
 
 	gpio->offset_timer =
 		devm_kzalloc(&pdev->dev, gpio->chip.ngpio, GFP_KERNEL);

-- 
2.34.1

