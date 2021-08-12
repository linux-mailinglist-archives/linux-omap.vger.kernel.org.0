Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9153E9D93
	for <lists+linux-omap@lfdr.de>; Thu, 12 Aug 2021 06:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234036AbhHLEgd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Aug 2021 00:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234098AbhHLEgZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Aug 2021 00:36:25 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53838C0617A1
        for <linux-omap@vger.kernel.org>; Wed, 11 Aug 2021 21:36:00 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d1so5646611pll.1
        for <linux-omap@vger.kernel.org>; Wed, 11 Aug 2021 21:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xQGKod+1toETrZZygbeTDI/UD9O56l1AgluTcAmsQr0=;
        b=hpGYNDBGEyQkLVHPIW1XmsAQfqm6lMtcizJZT9wFryqif4CvN6lQx93IkKP+CIH8RC
         3ne6sueHneC5rp8enoVSBifcSV46fJ4r1rdWZFacDGaU2r5q3yG0w1EYLkgwfXhkbpDg
         a7wE0mqWmfyfHb7mozVb34JlMjsJq0P0s/XK6pcoh3YxlMODM8llnCSTngTAthw6U0Ab
         j0+ktxEXSk5SSG29DI1dvgDO9qhDBmMhNWgJI9ScSMFXWzd/w0n/oWZqiptOp710AGFO
         aSnYZDsdnO2aeQ6vNAf11Au7QNAkQcINdZsGQXZwPGb9K5H7Hi8jvqB+M6J6bj3cxvSk
         xvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xQGKod+1toETrZZygbeTDI/UD9O56l1AgluTcAmsQr0=;
        b=TBqlE3QRamZ4o7Racj0FfYV4DswHKHiDJNXjhTCK7Ffpe2WELzTr4fF2Tk+x3mIQh3
         FPzTuO4gHFjmVks2geiT7xXrROwJ9yMZrnKfgQiRU3xiGoCywwbiAsdF3k3CpiY09bSx
         hDIsbhYKSH4mMs475vf1SCe0UEIczhaGOT2NQGmfZ2SguOIOUP6qNbdjJ7KrB2rZcy51
         m3FXfvE9Tabj3vLXPv1hIeXXHSwGSiaEDytIKgh+BeoOhKzqgXzXW0RM6qYKrVzCJLbo
         Nf/mAFJuqH5I6Pmmo5dKPh562Wt2DcFBhv0bnqAQgAx8m8BL2E/tKQIW9YpfESyDT5BX
         trtQ==
X-Gm-Message-State: AOAM533biex+Vx0RdHM6k+ezAwoGHmmWTwTl+ttXRLgtM/OvGVJUrtjN
        XhV34kjKMpKIAZtUWgWfU/sZEg==
X-Google-Smtp-Source: ABdhPJzAA8MudywLLhjtP/QQ1IdErDufK2tfnse1BeGPHYp5ecjPRoSLdcxO7iykErJEhDI8plZm7g==
X-Received: by 2002:a63:ef02:: with SMTP id u2mr2198232pgh.298.1628742959909;
        Wed, 11 Aug 2021 21:35:59 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id t18sm535357pfg.111.2021.08.11.21.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 21:35:59 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rafael Wysocki <rjw@rjwysocki.net>,
        Vincent Donnefort <vincent.donnefort@arm.com>,
        lukasz.luba@arm.com, Quentin Perret <qperret@google.com>,
        Kevin Hilman <khilman@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V3 5/9] cpufreq: omap: Use .register_em() to register with energy model
Date:   Thu, 12 Aug 2021 10:05:18 +0530
Message-Id: <361a172d230964807c0b479738749c50d95d7b50.1628742634.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1628742634.git.viresh.kumar@linaro.org>
References: <cover.1628742634.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Set the newly added .register_em() callback with
cpufreq_register_em_with_opp() to register with the EM core.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/omap-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/omap-cpufreq.c b/drivers/cpufreq/omap-cpufreq.c
index e035ee216b0f..1b50df06c6bc 100644
--- a/drivers/cpufreq/omap-cpufreq.c
+++ b/drivers/cpufreq/omap-cpufreq.c
@@ -131,7 +131,6 @@ static int omap_cpu_init(struct cpufreq_policy *policy)
 
 	/* FIXME: what's the actual transition time? */
 	cpufreq_generic_init(policy, freq_table, 300 * 1000);
-	dev_pm_opp_of_register_em(mpu_dev, policy->cpus);
 
 	return 0;
 }
@@ -150,6 +149,7 @@ static struct cpufreq_driver omap_driver = {
 	.get		= cpufreq_generic_get,
 	.init		= omap_cpu_init,
 	.exit		= omap_cpu_exit,
+	.register_em	= cpufreq_register_em_with_opp,
 	.name		= "omap",
 	.attr		= cpufreq_generic_attr,
 };
-- 
2.31.1.272.g89b43f80a514

