Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E60913917DE
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 14:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234928AbhEZMvx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 08:51:53 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56967 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234713AbhEZMth (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 08:49:37 -0400
Received: from mail-vs1-f71.google.com ([209.85.217.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llsxB-00014g-MB
        for linux-omap@vger.kernel.org; Wed, 26 May 2021 12:48:05 +0000
Received: by mail-vs1-f71.google.com with SMTP id v15-20020a67c00f0000b029023607a23f3dso193305vsi.10
        for <linux-omap@vger.kernel.org>; Wed, 26 May 2021 05:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0G840/6Lxcb0Mf0VQ/EHwzTpuJEk0LuU0gTLTIwmZhs=;
        b=LUja/VyrzVvB8gIMppkIxTfT1zDGk7VHzHfKPqC5DfUsLB/mi0jugeEoswPhfgOdwr
         dVGPOHm0P6klpouSu7OOGW0u6QsdG723XO8XWTjmpYxXjRaFcXo0m3GCAHyRrnqPo2ED
         fuoLGGzFvjNAAdWNnlb6Kpof42GONdqqVhfcbI00qiQFHVlH5zu0ORveLJJCRL3wrc3p
         DWYVdnrdW8/mbM+xDJeXnGU17UjFnLZbWpsH8mJR5Mps8/18MkV27EvvI0miX8oS94El
         GxWLjJt0G/se1ezEd3/BSQoONHB2MotvMNYnZG8dWAUNTn6Cb0c5/ruvXXXeloUGs3/4
         lqRQ==
X-Gm-Message-State: AOAM530fBjpIj639gbeqb4Cmvuv0+jyPGI7iRagIbd7PM6Vfyi2euSAf
        YgFNanxnOgcw7WvH8ye6iPWcNAkDS0heES9RU/MJywW7f55oZ2RcaGuJ4am9OY8ek1zLo6Ga/73
        ciGlQhuqyQ1aXaLaZTCooY4YlYCBKo646To5sTmE=
X-Received: by 2002:a67:ec4f:: with SMTP id z15mr29705037vso.27.1622033284477;
        Wed, 26 May 2021 05:48:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCoTnt6t9OzH8wpF2Ii6dBrFO6A3IuSsgipAxOrGMJk8cgaaL0/Ep+nV8/pkm14FWQbrzLzQ==
X-Received: by 2002:a67:ec4f:: with SMTP id z15mr29705029vso.27.1622033284342;
        Wed, 26 May 2021 05:48:04 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:48:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [RESEND PATCH v2 13/13] mfd: sec: Remove unused platform data members
Date:   Wed, 26 May 2021 08:47:11 -0400
Message-Id: <20210526124711.33223-14-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
References: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Samsung PMIC drivers for early chipsets like S5M8767 stored quite a
lot in platform data (struct sec_platform_data).  The s5m8767 regulator
driver currently references only some of its fields.  Newer regulator
drivers (e.g. s2mps11) use even less platform data fields.

Clean up the structure to reduce memory footprint and source code size.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 include/linux/mfd/samsung/core.h | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index b0d049a56d16..f92fe090473d 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -80,8 +80,6 @@ struct sec_platform_data {
 	struct sec_opmode_data		*opmode;
 	int				num_regulators;
 
-	bool				buck_voltage_lock;
-
 	int				buck_gpios[3];
 	int				buck_ds[3];
 	unsigned int			buck2_voltage[8];
@@ -91,35 +89,12 @@ struct sec_platform_data {
 	unsigned int			buck4_voltage[8];
 	bool				buck4_gpiodvs;
 
-	int				buck_set1;
-	int				buck_set2;
-	int				buck_set3;
-	int				buck2_enable;
-	int				buck3_enable;
-	int				buck4_enable;
 	int				buck_default_idx;
-	int				buck2_default_idx;
-	int				buck3_default_idx;
-	int				buck4_default_idx;
-
 	int				buck_ramp_delay;
 
-	int				buck2_ramp_delay;
-	int				buck34_ramp_delay;
-	int				buck5_ramp_delay;
-	int				buck16_ramp_delay;
-	int				buck7810_ramp_delay;
-	int				buck9_ramp_delay;
-	int				buck24_ramp_delay;
-	int				buck3_ramp_delay;
-	int				buck7_ramp_delay;
-	int				buck8910_ramp_delay;
-
-	bool				buck1_ramp_enable;
 	bool				buck2_ramp_enable;
 	bool				buck3_ramp_enable;
 	bool				buck4_ramp_enable;
-	bool				buck6_ramp_enable;
 
 	int				buck2_init;
 	int				buck3_init;
-- 
2.27.0

