Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69CB44389FA
	for <lists+linux-omap@lfdr.de>; Sun, 24 Oct 2021 17:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231733AbhJXPmW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 24 Oct 2021 11:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231699AbhJXPmV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 24 Oct 2021 11:42:21 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B94A1C061745;
        Sun, 24 Oct 2021 08:40:00 -0700 (PDT)
Date:   Sun, 24 Oct 2021 15:39:56 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1635089998;
        h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g50gduEGBSY+ideoguu6iU1dmhxEDVh8QVKLPEg9Oeo=;
        b=CsVMZpm6hdgD/5NuTaY1alTSWTbWYN2h+ClvF5mdjZqqhAx8cHYVAssRW1dUJbd4cAbwm3
        /1dkq6CNLGOYwDqzIa3klpgqF6GkPSdD2fYLGerOZRhLCBZH1HrfcSx+8fMJ1L0gOsTy82
        UjOgyIJW7B/wLENOBWkjMc5ZAlw05Zusuor7yMGMsnnGep0UM3LmtnC0f+eoDdM/EsFk5R
        txM0OXMGEGtS1oKaDbZq2pFkwBAS7oBsi/E5pLPfr/K2+k2oM8jsa0n3eJ3JCyq4FmEn37
        wqs3A3doCMfxpvB2gAGhO/o/aYkki2ibRDvznpoIsLSARp04VkEQNmdCYedGVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1635089998;
        h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g50gduEGBSY+ideoguu6iU1dmhxEDVh8QVKLPEg9Oeo=;
        b=cOxnKr/R5BKbzLzg4MmHuHmPih1NErUgpm4/WeW2lc9voj2RxnNTF1T1ZhifElnH7DtyWE
        6HvMZtMtvc470ODQ==
From:   "tip-bot2 for Kees Cook" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To:     linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] clocksource/drivers/timer-ti-dm: Select TIMER_OF
Cc:     kernel test robot <lkp@intel.com>,
        Tony Lindgren <tony@atomide.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>,
        Sebastian Reichel <sebastian.reichel@collabora.co.uk>,
        Ladislav Michl <ladis@linux-mips.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-omap@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20210828175747.3777891-1-keescook@chromium.org>
References: <20210828175747.3777891-1-keescook@chromium.org>
MIME-Version: 1.0
Message-ID: <163508999694.626.15597528223513744347.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     eda9a4f7af6ee47e9e131f20e4f8a41a97379293
Gitweb:        https://git.kernel.org/tip/eda9a4f7af6ee47e9e131f20e4f8a41a97379293
Author:        Kees Cook <keescook@chromium.org>
AuthorDate:    Sat, 28 Aug 2021 10:57:47 -07:00
Committer:     Daniel Lezcano <daniel.lezcano@linaro.org>
CommitterDate: Thu, 21 Oct 2021 14:18:53 +02:00

clocksource/drivers/timer-ti-dm: Select TIMER_OF

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
Acked-by: Tony Lindgren <tony@atomide.com>
Link: https://lore.kernel.org/r/20210828175747.3777891-1-keescook@chromium.org
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index ac56b56..e71ac54 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -24,6 +24,7 @@ config I8253_LOCK
 
 config OMAP_DM_TIMER
 	bool
+	select TIMER_OF
 
 config CLKBLD_I8253
 	def_bool y if CLKSRC_I8253 || CLKEVT_I8253 || I8253_LOCK
