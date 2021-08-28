Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3750B3FA711
	for <lists+linux-omap@lfdr.de>; Sat, 28 Aug 2021 19:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhH1R6s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 28 Aug 2021 13:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbhH1R6q (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 28 Aug 2021 13:58:46 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E3EFC061796
        for <linux-omap@vger.kernel.org>; Sat, 28 Aug 2021 10:57:56 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d17so6063751plr.12
        for <linux-omap@vger.kernel.org>; Sat, 28 Aug 2021 10:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qoRrda6U6GxHzpOEaIJ6gVUXCj3XTmN8tjTe4PtJ0hc=;
        b=mmMbPiCU3U+syXMjU8vmu6LDmEoQU8JvLN7kPzP2kUB2pj1DoBzCimW/GwtZyrYsiu
         ddQHHN+WPFjOXjVBZdvWcwpfDfER+4xVOWV93BdAAmPCASjc1I1FSB6KLfHvnofn1nHK
         i1/OgItiwbOqlNZtnkp2Ww50woEvHsYEsO+V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qoRrda6U6GxHzpOEaIJ6gVUXCj3XTmN8tjTe4PtJ0hc=;
        b=Dm+PV34L3GUspg1SIABoxGUxm+dHvj8EJHxatWRxgTDbaRa7NmZl5JDafkFMkDK0ft
         x1FY4uZ01JTeuTY0INsjGlyZjQIqV81+nqCT2UNXS/GVTa+eefP2E+VB+nvWK4VWnp/u
         aziIqFydYD/o3m9R5bVQcX7Kh+0zAkRgkuOLDkZii3UN09bTwCZumFjHyE4uIu44ePZE
         Bp7o/5IQFDIeDtZgPFAOZArwZQWjjRI+FQCtjpdTAlHpz21DUBXJ4u9BBqanSdIUtxJe
         j7iuuw8Z8gCPTFip5QkYwaELUvicgmFvxIa5e89J1ZMUcgjUoADIBLY2+yDGSplCqsOG
         XL5w==
X-Gm-Message-State: AOAM533b7RKD6OwQCdJxiWLhUx5cBwmTGsbQsJr91/xvwyCKLPRTG2Fh
        e90ecxbopPsDhEMIUjbDXvTFKA==
X-Google-Smtp-Source: ABdhPJwIfzGrqWWVKr5y17UZd/DsAh6nRMZPSFCys6z9v4x1Eg8H5t+RpDONcLx091gGh24zKeqkUA==
X-Received: by 2002:a17:902:fe81:b0:133:851e:5923 with SMTP id x1-20020a170902fe8100b00133851e5923mr14151597plm.25.1630173475568;
        Sat, 28 Aug 2021 10:57:55 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t15sm11199595pgi.80.2021.08.28.10.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 10:57:54 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Kees Cook <keescook@chromium.org>,
        kernel test robot <lkp@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>,
        Sebastian Reichel <sebastian.reichel@collabora.co.uk>,
        Ladislav Michl <ladis@linux-mips.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-omap@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH] clocksource/drivers/timer-ti-dm: Select TIMER_OF
Date:   Sat, 28 Aug 2021 10:57:47 -0700
Message-Id: <20210828175747.3777891-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1368; h=from:subject; bh=9jx5uQPQqpp6TrFslvjEgR6EW3HiZEM9ERGP13bv27o=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhKnka8IMpGL75t9SdPtlw5cO32b0cj/Ljslc5NM+C Mk3bmEKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYSp5GgAKCRCJcvTf3G3AJsbaD/ 9aHBUpWn4I1adVnh/gDEinuFwYEId8xHXMAzcKmAtGYn9aDrtjoho0QB65x/XE3thwjJv4rCtM6cfP im14GI7xHW/uIfagrW0Jiv9Rg9b1t0Gu2w6x6HrzymAHfrplvvcm8A8TDdFOWBrECEbKKEyFHvKxvI 7LEnxaaIY5RGxG17eFQXW2wdFuGppuHhZqenCfX8JRIZ2XzGKOJ6VnV7i5qWldvBe7jSPUbiYAK+xm Mi+AN3Xqkc1Guj/KGGMJ6nAyZKHRQ0l8SVTJeShnoPnWuor8X6haOExTFTH6tPl+0pbOisdtXiOumw axOUWWOeU7ga0QFJ+vacWTKXFmc+fMAS6355YTYFM3q2Rnv1eLDTZoetNwjxvitQtVfoeoY6+DQUtg uRMxDbULb22uh2rWpm5GkRABAdPiNXfbSUjTFRKAOjYFFxA85CC3XlHI9eW4Sa0Xr1hbffFm50Fb7j L+XEGRWoVoO/UONT74eVGC1HLJXDqGUs71GTXbWDRG77Sg2CN/+GNTI+JlJjznLvbWPT8njCD7Qr5n 0ZXDIlKtM2NF2xfDOWksUL6GgQc1sGloiVyDtxVgiyJIpNsHC4AG9hJUSQ0zi0PzoIr3LAz/3ylz6e ktGmQcMYLEmlX14y5Vn4v+WxMigNBrSEQU8vbERGmENn9RVkg4tg3OAs9NHA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When building OMAP_DM_TIMER without TIMER_OF, there are orphan sections
due to the use of TIMER_OF_DELCARE() without CONFIG_TIMER_OF. Select
CONFIG_TIMER_OF when enaling OMAP_DM_TIMER:

arm-linux-gnueabi-ld: warning: orphan section `__timer_of_table' from `drivers/clocksource/timer-ti-dm-systimer.o' being placed in section `__timer_of_table'

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/lkml/202108282255.tkdt4ani-lkp@intel.com/
Cc: Tony Lindgren <tony@atomide.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: Ladislav Michl <ladis@linux-mips.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: linux-omap@vger.kernel.org
Fixes: 52762fbd1c47 ("clocksource/drivers/timer-ti-dm: Add clockevent and clocksource support")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/clocksource/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 0f5e3983951a..08f8cb944a2a 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -24,6 +24,7 @@ config I8253_LOCK
 
 config OMAP_DM_TIMER
 	bool
+	select TIMER_OF
 
 config CLKBLD_I8253
 	def_bool y if CLKSRC_I8253 || CLKEVT_I8253 || I8253_LOCK
-- 
2.30.2

