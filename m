Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E36D93917DD
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 14:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234872AbhEZMvm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 08:51:42 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56922 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234910AbhEZMt0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 08:49:26 -0400
Received: from mail-ua1-f72.google.com ([209.85.222.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llsx0-00010g-30
        for linux-omap@vger.kernel.org; Wed, 26 May 2021 12:47:54 +0000
Received: by mail-ua1-f72.google.com with SMTP id r4-20020ab070c40000b02902064b454facso719468ual.6
        for <linux-omap@vger.kernel.org>; Wed, 26 May 2021 05:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=96zqy8TyhAD+JhYW/P5FQPokvQlZGIGEa/sS9Ij98mI=;
        b=rBqcsafnRijToqztCR/KPyAab4hoqV5/CsmGcY7QV+Jzs++vIricNV5bEk5Dk476ko
         mDDVKCPV+5pSFfIxzYpvjoCHBBo7/1YbOdfibu/JKrPd6WbxSwcAvuucXCCxgrlN4u1B
         s6N4ewSDNEfpc7G0Mff8xyAvJYyGdieM2U2BDlW0FWtRxweepe5t2luktz4aNAVhMUiP
         4Z2s6MPbJJfGgOOcQJDMm5InaYv2aR/Jg/5X9MTQdk15tzMJG55ir1F7ikfTeaLXxIXE
         QhEDxtcKLYGzr7K5ZeGV8BsQeo1fPoR2MGlOUl/dufBT+jF2a4scZSIs+ZrLcm9/gQDj
         im4Q==
X-Gm-Message-State: AOAM530SZHfxYgiG93Kk7xrd6B1x+E/RGV632K/XNni8lP0nCuc+p9ty
        kZxRzxT0djLIR0bf9cULlWSCgwAEEcrCnYZcLFI7G0huoFcS4UzqkUM4qEoib5dDmWTKdszYfHc
        OnVZWuTGIqYdZfTCZKRKN+bfY00jNc1IiYf84NlA=
X-Received: by 2002:a1f:2b14:: with SMTP id r20mr30492915vkr.9.1622033272867;
        Wed, 26 May 2021 05:47:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxO/rrxMa4qIJIelG7iI0H1rXGneLYwFOt4TREWN2jBRdXeBJv8coCByPtPILPPl70OO9SmeA==
X-Received: by 2002:a1f:2b14:: with SMTP id r20mr30492869vkr.9.1622033272302;
        Wed, 26 May 2021 05:47:52 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:47:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [RESEND PATCH v2 09/13] mfd: sec: Remove unused cfg_pmic_irq in platform data
Date:   Wed, 26 May 2021 08:47:07 -0400
Message-Id: <20210526124711.33223-10-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
References: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The 'cfg_pmic_irq' field of platform data structure is not used and can
be safely dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mfd/sec-core.c           | 3 ---
 include/linux/mfd/samsung/core.h | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index c61c1fc62165..653d02b98d53 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -382,9 +382,6 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
-	if (pdata->cfg_pmic_irq)
-		pdata->cfg_pmic_irq();
-
 	sec_irq_init(sec_pmic);
 
 	pm_runtime_set_active(sec_pmic->dev);
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index f1631a39acfc..68afc2b97a41 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -85,7 +85,6 @@ struct sec_platform_data {
 	int				num_regulators;
 
 	int				irq_base;
-	int				(*cfg_pmic_irq)(void);
 
 	bool				wakeup;
 	bool				buck_voltage_lock;
-- 
2.27.0

