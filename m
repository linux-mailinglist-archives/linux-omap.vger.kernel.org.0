Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23DF6699031
	for <lists+linux-omap@lfdr.de>; Thu, 16 Feb 2023 10:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbjBPJit (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Feb 2023 04:38:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbjBPJiT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Feb 2023 04:38:19 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B69344DE16
        for <linux-omap@vger.kernel.org>; Thu, 16 Feb 2023 01:37:29 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id y25so2009957lfa.9
        for <linux-omap@vger.kernel.org>; Thu, 16 Feb 2023 01:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTZJUuoTLvnb8+dIB2o2Mq6G+9PNstLnM4iOJQS28hg=;
        b=N8DrrLId/y7Llqj7BdEcTudPqAcKbLDdGVDlOE2D0AK9b5LDmeYFaXxOiHxAsF/EET
         kbETpK1FE0ZMXlmnuqIKaBqKavRFFIo/USTTzCIxKnJs+EXePGNHyOlMb2Kww9Tcdo5U
         JRU4yWH1c1ijp1D0GG2qeHoSVCgxV4XQl6ltyVJh/S71QSeLTdpNPNygnrzpoletwSm9
         e/J4O2OooCcB7iYvdLH6BNYK4HpHyt0rUbQE/HcsUiuGDb8CuhDldZJUQc1or8iUszSx
         BPBBOG8ltw6GVPXCxqoZgbvQ5KWpNAzMzpk9wjxF6LYIQ01KZNZvrsTc8LiVzsajYT43
         d3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTZJUuoTLvnb8+dIB2o2Mq6G+9PNstLnM4iOJQS28hg=;
        b=dy36+7uoCSYhgG8+AWRKC3pfEBdzxWlgxh7favLSu5xITg7hE2G6iYVifCMYcNOwDG
         ldj+VTPORABLC6D6JM1zLi8jstlWq6zk9FoumIbWaUtatA/Rs0ewT5no6yVGETDOYlKa
         zPP3qEvcsaOoQSFwTUA6EHBX6DBreRMFO2FW5q9jfjmAtv/kzdzHOeHQZh6t74+a+RN+
         D+Kl1t6d/eXHEE2laJrzaOjLDRQ9alibETySJLlo/52+LRD+TKrD8LIj5K0Jvt7KgHZq
         r5lkeZee/ATrdXoytPZoZDWysHERh835ddLSUq6TnMIfMQqhwCgfBsPDPA+E4mkAZ9Os
         H9XQ==
X-Gm-Message-State: AO0yUKXGCjPX+aJkZJKraMIq9m2hpYQ/pApdjpHztexO2OoF88deVdJF
        0Mym2VQZ6SZJi23eLeNijl201DBpUez7pTLp
X-Google-Smtp-Source: AK7set8MZjOAbMcR9f34HdbTkDlR7J174NgMUjyFUi3tJw50XTL3Njfopnu5TIY3mJ4RzbH8YG1EQQ==
X-Received: by 2002:a05:6512:e95:b0:4b5:70e0:f2e6 with SMTP id bi21-20020a0565120e9500b004b570e0f2e6mr762445lfb.24.1676540247187;
        Thu, 16 Feb 2023 01:37:27 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id r3-20020a19ac43000000b004d8758a452asm229069lfc.288.2023.02.16.01.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:37:26 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Feb 2023 10:37:18 +0100
Subject: [PATCH 17/17] gpio: pcie-idio-24: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v1-17-51a8f224a5d0@linaro.org>
References: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org>
In-Reply-To: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org>
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
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        William Breathitt Gray <william.gray@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-omap@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Convert the driver to immutable irq-chip with a bit of
intuition.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pcie-idio-24.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-idio-24.c
index 8a9b98fa418f..ac42150f4009 100644
--- a/drivers/gpio/gpio-pcie-idio-24.c
+++ b/drivers/gpio/gpio-pcie-idio-24.c
@@ -396,6 +396,8 @@ static void idio_24_irq_mask(struct irq_data *data)
 	}
 
 	raw_spin_unlock_irqrestore(&idio24gpio->lock, flags);
+
+	gpiochip_disable_irq(chip, irqd_to_hwirq(data));
 }
 
 static void idio_24_irq_unmask(struct irq_data *data)
@@ -408,6 +410,8 @@ static void idio_24_irq_unmask(struct irq_data *data)
 	const unsigned long bank_offset = bit_offset / 8;
 	unsigned char cos_enable_state;
 
+	gpiochip_enable_irq(chip, irqd_to_hwirq(data));
+
 	raw_spin_lock_irqsave(&idio24gpio->lock, flags);
 
 	prev_irq_mask = idio24gpio->irq_mask >> bank_offset * 8;
@@ -437,12 +441,14 @@ static int idio_24_irq_set_type(struct irq_data *data, unsigned int flow_type)
 	return 0;
 }
 
-static struct irq_chip idio_24_irqchip = {
+static const struct irq_chip idio_24_irqchip = {
 	.name = "pcie-idio-24",
 	.irq_ack = idio_24_irq_ack,
 	.irq_mask = idio_24_irq_mask,
 	.irq_unmask = idio_24_irq_unmask,
-	.irq_set_type = idio_24_irq_set_type
+	.irq_set_type = idio_24_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static irqreturn_t idio_24_irq_handler(int irq, void *dev_id)
@@ -535,7 +541,7 @@ static int idio_24_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	idio24gpio->chip.set_multiple = idio_24_gpio_set_multiple;
 
 	girq = &idio24gpio->chip.irq;
-	girq->chip = &idio_24_irqchip;
+	gpio_irq_chip_set_chip(girq, &idio_24_irqchip);
 	/* This will let us handle the parent IRQ in the driver */
 	girq->parent_handler = NULL;
 	girq->num_parents = 0;

-- 
2.34.1

