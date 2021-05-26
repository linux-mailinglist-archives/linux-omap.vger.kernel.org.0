Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 993BB3917EA
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 14:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234246AbhEZMwZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 08:52:25 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56931 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234919AbhEZMt1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 08:49:27 -0400
Received: from mail-ua1-f72.google.com ([209.85.222.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llsx1-00011Q-LQ
        for linux-omap@vger.kernel.org; Wed, 26 May 2021 12:47:55 +0000
Received: by mail-ua1-f72.google.com with SMTP id b8-20020ab026c80000b029020f97f38cfcso726087uap.3
        for <linux-omap@vger.kernel.org>; Wed, 26 May 2021 05:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yas4eb6X58o/Bpn+7QlC+KUOEDd/pLhewc6kAqI5ERQ=;
        b=NWRXExz5YrBgnnsgFhTjzf8n0MStmn3O/h+EvMm7E+pHmz5vPSr3vQUnT4rz0cJ6Vv
         tyhbNxYDjxFRuxDitHqVDfZo84lz6wL5Ff9lGQOKeGJ9PKKavLiATFQ91mtAy8YDKzg4
         2sZICXnZ9ZBk8OqcnDNUJImHA0YPlDHQ6TDucVBMATh2tDLxj6PONr2vH4RpfRtxkwug
         EtDnGGEr1MFeWu5INAF9v0D3WSsvUNrYwmoZACqz0+e1D14YljEX4aljKrchdbeRXSY7
         S4u2tsPZangNtXAVAWJJRYIwlZL4tEFVlxHSpC3DfgLkym9RHpzdQkpnbe/0vEWilI1d
         INgA==
X-Gm-Message-State: AOAM532dfyrxQw9RJViE7oYNYVD4Zx3kV+fL5V347jaxacTmRcPNa67t
        OG95lXEp2JSdUESucdHmHeimIxpZdWR4E7DpsOzpEPC9ySCzJ2tTBWkwW6bePxU8QTvuIX1iBL1
        x9Gqrg7XlOyiHVHWdahk/rhvwaEhZqqcPeJzv3tc=
X-Received: by 2002:a67:f303:: with SMTP id p3mr13195178vsf.37.1622033274859;
        Wed, 26 May 2021 05:47:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUp5kruxawn6cjhi4Yijw6pPdfl65zkfOmhAEzzR7+KwZhyv3ui12e7v0bfCZkpNWEQogC2g==
X-Received: by 2002:a67:f303:: with SMTP id p3mr13195148vsf.37.1622033274657;
        Wed, 26 May 2021 05:47:54 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:47:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [RESEND PATCH v2 10/13] mfd: sec: Remove unused device_type in platform data
Date:   Wed, 26 May 2021 08:47:08 -0400
Message-Id: <20210526124711.33223-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
References: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The 'device_type' field of platform data structure is not used and can
be safely dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mfd/sec-core.c           | 5 +----
 include/linux/mfd/samsung/core.h | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 653d02b98d53..4c4db3171ce6 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -318,7 +318,6 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 	struct sec_platform_data *pdata;
 	const struct mfd_cell *sec_devs;
 	struct sec_pmic_dev *sec_pmic;
-	unsigned long device_type;
 	int ret, num_sec_devs;
 
 	sec_pmic = devm_kzalloc(&i2c->dev, sizeof(struct sec_pmic_dev),
@@ -330,16 +329,14 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 	sec_pmic->dev = &i2c->dev;
 	sec_pmic->i2c = i2c;
 	sec_pmic->irq = i2c->irq;
-	device_type = (unsigned long)of_device_get_match_data(sec_pmic->dev);
 
 	pdata = sec_pmic_i2c_parse_dt_pdata(sec_pmic->dev);
 	if (IS_ERR(pdata)) {
 		ret = PTR_ERR(pdata);
 		return ret;
 	}
-	pdata->device_type = device_type;
 
-	sec_pmic->device_type = pdata->device_type;
+	sec_pmic->device_type = (unsigned long)of_device_get_match_data(sec_pmic->dev);
 	sec_pmic->irq_base = pdata->irq_base;
 	sec_pmic->wakeup = pdata->wakeup;
 	sec_pmic->pdata = pdata;
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index 68afc2b97a41..bfde1b7c6303 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -81,7 +81,6 @@ int sec_irq_resume(struct sec_pmic_dev *sec_pmic);
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;
 	struct sec_opmode_data		*opmode;
-	int				device_type;
 	int				num_regulators;
 
 	int				irq_base;
-- 
2.27.0

