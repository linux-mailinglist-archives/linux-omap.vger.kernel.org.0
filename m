Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 052EE20ACA1
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jun 2020 08:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728622AbgFZG6K (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Jun 2020 02:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728585AbgFZG5v (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 26 Jun 2020 02:57:51 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09412C08C5DB
        for <linux-omap@vger.kernel.org>; Thu, 25 Jun 2020 23:57:51 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f139so8292693wmf.5
        for <linux-omap@vger.kernel.org>; Thu, 25 Jun 2020 23:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LxP+pj5dAfq9jSQlmqxGkL2BQjDUMxM20D8uW61hd/0=;
        b=Vfi1pBqWKvy+Zc8b6ok7wbVccd/dzbvbdRZeJ5pR8nYf1oFkBEn+32PfanZ68mKmr4
         X7Tz4VRmpdTJNEbXUjgt/SMOKgRA7SoYdp1+rdmzItdFaoND9odQiqI4x7PWlymMow7j
         47xl3ZNui7jVUD3/NPVzpvi3EVWYilYP2Jzrcr63XY4eDP1liqeFJQyXGPgziN12Wj82
         b/Wl7AaVTxk1N7JZssKKbllkIfoVOUuPtnnjpdNEOVIDFnW/8NycoeMynve7OiuLkyFm
         MSiuq21fBdUJwWGnr52ypxku7WTHmFnVpZf+bceWW8T7hjkb7IxLrE+km3hzsv6Wnq9y
         QqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LxP+pj5dAfq9jSQlmqxGkL2BQjDUMxM20D8uW61hd/0=;
        b=GrLMRT3iq+Ms1GAIsvDWF3Tu95spyRmPGH/jooLHBB1bEn1qiN6+9X3bzzeOsfsEpH
         1BFegyMaYKd+43Df22qFv5UYKqHo4G1CxWCMF6l0Im2gIdvFIHCCs5bHyor7a0WlZDja
         OWrUlUkZJzOCkdOSBFrE0QlFbTkU+HyBFu4KYdQni4yijJtcYmkewurJw31vEhXi4/iq
         E6ntVO2CR0CUHd1T2bcYXP3ICIKt7EWxQRMfDqfSuWN8i7HO8UywmpyvGaO3g/O47XD5
         LRbjDNRvBvl+TnXgsY7VJC0aRhiPMVUmhg/maqUVFwyRiqWtXg+kz8mh2PDn0cq9+ZHu
         P7Pg==
X-Gm-Message-State: AOAM533sj5NtfLuyoInqooAwuAtEhtJB0mOd0aefbNaL5fBHAfqnIkwB
        JMEM3BRv+p1xkk5MlNNyAVNRfw==
X-Google-Smtp-Source: ABdhPJw73SIBNHcTFiMa5r63xLyQriFo1/WVEXa9xIrz7jwg0GpR9c0vG5B4g091gEXs8yriVT/9Og==
X-Received: by 2002:a1c:4185:: with SMTP id o127mr1808366wma.8.1593154669736;
        Thu, 25 Jun 2020 23:57:49 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x18sm15355269wmi.35.2020.06.25.23.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 23:57:49 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     broonie@kernel.org, lgirdwood@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        linux-omap@vger.kernel.org
Subject: [PATCH 7/9] regulator: tps65218-regulator: Remove pointless 'is unsigned int <0' check
Date:   Fri, 26 Jun 2020 07:57:36 +0100
Message-Id: <20200626065738.93412-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626065738.93412-1-lee.jones@linaro.org>
References: <20200626065738.93412-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

'rid' is declared as unsigned int, so there is little point checking for <0.

Removing these checks fixes the following W=1 warnings:

 drivers/regulator/tps65218-regulator.c: In function ‘tps65218_pmic_set_suspend_enable’:
 drivers/regulator/tps65218-regulator.c:131:10: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
 131 | if (rid < TPS65218_DCDC_1 || rid > TPS65218_LDO_1)
 | ^
 drivers/regulator/tps65218-regulator.c: In function ‘tps65218_pmic_set_suspend_disable’:
 drivers/regulator/tps65218-regulator.c:144:10: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
 144 | if (rid < TPS65218_DCDC_1 || rid > TPS65218_LDO_1)
 | ^

Cc: Keerthy <j-keerthy@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Cc: Dave Gerlach <d-gerlach@ti.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/regulator/tps65218-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/tps65218-regulator.c b/drivers/regulator/tps65218-regulator.c
index 05d13f8079182..9133d0af793a7 100644
--- a/drivers/regulator/tps65218-regulator.c
+++ b/drivers/regulator/tps65218-regulator.c
@@ -128,7 +128,7 @@ static int tps65218_pmic_set_suspend_enable(struct regulator_dev *dev)
 	struct tps65218 *tps = rdev_get_drvdata(dev);
 	unsigned int rid = rdev_get_id(dev);
 
-	if (rid < TPS65218_DCDC_1 || rid > TPS65218_LDO_1)
+	if (rid > TPS65218_LDO_1)
 		return -EINVAL;
 
 	return tps65218_clear_bits(tps, dev->desc->bypass_reg,
@@ -141,7 +141,7 @@ static int tps65218_pmic_set_suspend_disable(struct regulator_dev *dev)
 	struct tps65218 *tps = rdev_get_drvdata(dev);
 	unsigned int rid = rdev_get_id(dev);
 
-	if (rid < TPS65218_DCDC_1 || rid > TPS65218_LDO_1)
+	if (rid > TPS65218_LDO_1)
 		return -EINVAL;
 
 	/*
-- 
2.25.1

