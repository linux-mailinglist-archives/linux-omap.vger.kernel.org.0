Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 648293917E5
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 14:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234353AbhEZMwQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 08:52:16 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56944 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234934AbhEZMtc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 08:49:32 -0400
Received: from mail-ua1-f72.google.com ([209.85.222.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llsx6-00012o-Qb
        for linux-omap@vger.kernel.org; Wed, 26 May 2021 12:48:00 +0000
Received: by mail-ua1-f72.google.com with SMTP id t19-20020ab021530000b029020bc458f62fso694659ual.20
        for <linux-omap@vger.kernel.org>; Wed, 26 May 2021 05:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uIc+hPbkXVAFmDCofUL+b5FDgJB7wunjYixiHaMZC84=;
        b=XPh/izWzfGBd+M2wTzcBITsDDvM0Bar6St26+TbacLpbGLISyH4+hG7ul08BfiJe9s
         4tfPzocntCrrju6AcSoqNhO0UkaaT9sv+JKaGNaGQFoZeGZzswg+rcSGLHgJ/hc5s5cA
         oPbwXQqtVUpBSGF8Cw4Wf9Wt2Lqn5st9p31CGc/N/UKiL9Jh4tA0jZO0TWsjSX/5C6Bs
         y8uQ9iP1J+rdimgt6VF2Y/9UPrdAAFWCLLYk8z3ydoeBUhnqxpocBOH8Au7lVMqnJrGi
         iTXLXMeuCrt/+v8bWOMYXPlVWPbMMmumSUAqyckWQWMwOTXEzS2l2vsjJzKweG+GQwxp
         9voQ==
X-Gm-Message-State: AOAM533rPdSnOFRKK8OsnzGaHdsa+aMQuROEmNmtTUIzQhBSfpcCMpmk
        bumYC8kQw/LXsG/DvvDk5qZgW3HPSsfiDod2jYVVCrqFI/GSnJiW+/52sJRPvFMbXKKYFCPrXaX
        6maiOeyzozOFyNUM6zLoIigeRb/cZVoaqvlTRxZE=
X-Received: by 2002:a05:6102:34d:: with SMTP id e13mr31166289vsa.31.1622033278871;
        Wed, 26 May 2021 05:47:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLUl9+FuXiCkKXpZ3BpbPb9nKcQP/WZDUuFCDhCOI3YfGCRJALALHfGFE0HuWGuTN1VN/SVQ==
X-Received: by 2002:a05:6102:34d:: with SMTP id e13mr31166241vsa.31.1622033278318;
        Wed, 26 May 2021 05:47:58 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:47:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [RESEND PATCH v2 11/13] mfd: sec: Remove unused irq_base in platform data
Date:   Wed, 26 May 2021 08:47:09 -0400
Message-Id: <20210526124711.33223-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
References: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The 'irq_base' field of platform data structure is not assigned,
therefore its default value of 0 has no impact and can be safely
dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mfd/sec-core.c           | 1 -
 drivers/mfd/sec-irq.c            | 4 +---
 include/linux/mfd/samsung/core.h | 3 ---
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 4c4db3171ce6..a9d4fbc51997 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -337,7 +337,6 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 	}
 
 	sec_pmic->device_type = (unsigned long)of_device_get_match_data(sec_pmic->dev);
-	sec_pmic->irq_base = pdata->irq_base;
 	sec_pmic->wakeup = pdata->wakeup;
 	sec_pmic->pdata = pdata;
 
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index a98c5d165039..e473c2fb42d5 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -444,7 +444,6 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	if (!sec_pmic->irq) {
 		dev_warn(sec_pmic->dev,
 			 "No interrupt specified, no interrupts\n");
-		sec_pmic->irq_base = 0;
 		return 0;
 	}
 
@@ -482,8 +481,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq,
 				       IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-				       sec_pmic->irq_base, sec_irq_chip,
-				       &sec_pmic->irq_data);
+				       0, sec_irq_chip, &sec_pmic->irq_data);
 	if (ret != 0) {
 		dev_err(sec_pmic->dev, "Failed to register IRQ chip: %d\n", ret);
 		return ret;
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index bfde1b7c6303..9864f13b7814 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -67,7 +67,6 @@ struct sec_pmic_dev {
 	struct i2c_client *i2c;
 
 	unsigned long device_type;
-	int irq_base;
 	int irq;
 	struct regmap_irq_chip_data *irq_data;
 
@@ -83,8 +82,6 @@ struct sec_platform_data {
 	struct sec_opmode_data		*opmode;
 	int				num_regulators;
 
-	int				irq_base;
-
 	bool				wakeup;
 	bool				buck_voltage_lock;
 
-- 
2.27.0

