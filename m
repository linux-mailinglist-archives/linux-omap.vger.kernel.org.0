Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14EA73917D6
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 14:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234797AbhEZMuv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 08:50:51 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56867 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234805AbhEZMs7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 08:48:59 -0400
Received: from mail-vs1-f69.google.com ([209.85.217.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llswZ-0000w3-1A
        for linux-omap@vger.kernel.org; Wed, 26 May 2021 12:47:27 +0000
Received: by mail-vs1-f69.google.com with SMTP id a11-20020a67d30b0000b02902363051a2cbso190940vsj.18
        for <linux-omap@vger.kernel.org>; Wed, 26 May 2021 05:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1o/+HiDWaRqbZ2KripZjBdfw0i27jwAjy/6T41yOkhc=;
        b=XDPzi4bEGZJdPsVMDJDC8062ukqB/d7+o485hwsanxuqP8KoeUht5AnuHYR78obbXz
         fltcxUIOA9NCB8v8ywQAd0xkfwqIFeFIZdeMmE2qvbSutj+HWASIsFiwa+4mhRn7vet8
         cOWkJeRTarODvlsTKxshD9FB0ZwqIAdvzcWVae01He9uuWXjm3g1Z/hmcCprXOBBeRsf
         474SVPxCyGtfv6kIi6ZHZUJzQ7n8QVmi19oUH385swAzc08eNEu8EV+SNCAF8MEDwDZL
         Oogm++DIn3OWHThgO7G3ve9CswK4S3bJAfUSPjJVURiJPy2IJq5jD4QUTvVmIt5KgFyQ
         K8uQ==
X-Gm-Message-State: AOAM5309wrk5oFB4yzzM+t6MLjDRa5+mmdapMWp+IDt/JK5OVtbu63AC
        0kg6r/Lwik897XG5bveg19DI7CUfBRx6CIZOg8TKiAcPJpkK9pcSvQDMV1jtsHT6H2qMEGJduSa
        p6ST0tHtnZ8r5f48SrrLiqLb4u1XTsoqk8fQkNbQ=
X-Received: by 2002:a1f:a802:: with SMTP id r2mr29795052vke.14.1622033246156;
        Wed, 26 May 2021 05:47:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyflJsx/GTGmueUvxCqoT3eN+/IS1gmrFHEClDPJbgqchaHkmkdQt0f9ZaB2/HCSu4kcXqjEQ==
X-Received: by 2002:a1f:a802:: with SMTP id r2mr29795039vke.14.1622033246028;
        Wed, 26 May 2021 05:47:26 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:47:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: [RESEND PATCH v2 03/13] mfd: da9052: Simplify getting of_device_id match data
Date:   Wed, 26 May 2021 08:47:01 -0400
Message-Id: <20210526124711.33223-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
References: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use of_device_get_match_data() to make the code slightly smaller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

---

Changes since v1:
1. Add Ack
---
 drivers/mfd/da9052-i2c.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/da9052-i2c.c b/drivers/mfd/da9052-i2c.c
index 8ebfc7bbe4e0..8de93db35f3a 100644
--- a/drivers/mfd/da9052-i2c.c
+++ b/drivers/mfd/da9052-i2c.c
@@ -155,13 +155,8 @@ static int da9052_i2c_probe(struct i2c_client *client,
 		return ret;
 
 #ifdef CONFIG_OF
-	if (!id) {
-		struct device_node *np = client->dev.of_node;
-		const struct of_device_id *deviceid;
-
-		deviceid = of_match_node(dialog_dt_ids, np);
-		id = deviceid->data;
-	}
+	if (!id)
+		id = of_device_get_match_data(&client->dev);
 #endif
 
 	if (!id) {
-- 
2.27.0

