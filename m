Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB822174D37
	for <lists+linux-omap@lfdr.de>; Sun,  1 Mar 2020 13:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgCAMTw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 1 Mar 2020 07:19:52 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:50321 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgCAMTw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 1 Mar 2020 07:19:52 -0500
Received: by mail-pj1-f68.google.com with SMTP id nm14so474641pjb.0;
        Sun, 01 Mar 2020 04:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=tZdH7MfE9a/k+w/TEEMFe9I/lJoqMfajnky1lKZSTb0=;
        b=DggX/rPB3iRf92C0LCjl8pWjZ2lkGhxuHTfT8s7fKB3UN0TvjuV6GjN0DTyRZ/43tO
         Ht9nZAtLml6F3Frefljkc+xJ4TwtFk6BP+wBGNuoXm4KeQxiQrIb/elJZUikpUpaE/xy
         AXf7Fipb9Hh42a37Qa/Lj4KQSTPcIqhlFQ5UnGpLx0lAcwP73CzU2mZR+1Hgh9g+rGZN
         7YNH+YqpyT9aTDM+ZkW+Na3XfLM/TTo+sa3Qi88Swl35a1MPcTQwWiX4zyQpYNNoOV4T
         59tC3P4jr2qXcEEEPIghg5rJllWHwiugkLjo9gI1tVt0+Z3oxlJTTX2XnwyZyJKaq/sC
         6bVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tZdH7MfE9a/k+w/TEEMFe9I/lJoqMfajnky1lKZSTb0=;
        b=Pj4DRpqssktc6juswiXs824qWE4m5CcwLH4pyU4DVeJ3rPTHS4LhRVlAgtyo92BE+C
         aX2izB/bNev6FqX1OU/dk9HkhUtrNmccn6JcsNMvcndSNS8TuBrHezmYN5s56fkdzLf6
         aOg8ZaunR2euU1xxedBzmWppIMILICgE9wlI0TWhE2mVX8SSBu+o0Lbugnmz/TZOldno
         eiCaC7guAujWMmYRgNcyIcz7Yx2XMhy4mWn+0g4XMpR65oyccqvgeTNhUyq11IJ839z2
         i9km0EOvQsryZR/DGUev26YbvPhX/OpFwCMdG5LbeZOKsn5BaLK7d8qZLQqq0QGp8IiX
         TAtw==
X-Gm-Message-State: APjAAAUm9cvwLupsHjTa0k/f0zghg2j6kJUgxzbU8uSEZ8QByAAx966P
        bEQcSrHo0JYtPcXG1iwb7Dk=
X-Google-Smtp-Source: APXvYqxgTeeH5joC/tE8y4pGhIvBgCPH5KJByfNVC8B4RWcLt+hPsmO1yrbwMAVmOtT966LWV2t3qQ==
X-Received: by 2002:a17:90b:46c4:: with SMTP id jx4mr15335366pjb.32.1583065191086;
        Sun, 01 Mar 2020 04:19:51 -0800 (PST)
Received: from localhost.localdomain ([106.51.232.35])
        by smtp.gmail.com with ESMTPSA id u1sm17359636pfn.133.2020.03.01.04.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 04:19:50 -0800 (PST)
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Kevin Hilman <khilman@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     afzal mohammed <afzal.mohd.ma@gmail.com>
Subject: [PATCH v3] ARM: OMAP: replace setup_irq() by request_irq()
Date:   Sun,  1 Mar 2020 17:49:44 +0530
Message-Id: <20200301121945.3604-1-afzal.mohd.ma@gmail.com>
X-Mailer: git-send-email 2.18.0
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

request_irq() is preferred over setup_irq(). Invocations of setup_irq()
occur after memory allocators are ready.

Per tglx[1], setup_irq() existed in olden days when allocators were not
ready by the time early interrupts were initialized.

Hence replace setup_irq() by request_irq().

[1] https://lkml.kernel.org/r/alpine.DEB.2.20.1710191609480.1971@nanos

Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>
---
Hi sub-arch maintainers,

If the patch is okay, please take it thr' your tree.

Regards
afzal

v3:
 * Split out from series, also create subarch level patch as Thomas
	suggested to take it thr' respective maintainers
 * Modify string displayed in case of error as suggested by Thomas
 * Re-arrange code as required to improve readability
 * Remove irrelevant parts from commit message & improve
 
v2:
 * Replace pr_err("request_irq() on %s failed" by
           pr_err("%s: request_irq() failed"
 * Commit message massage

 arch/arm/mach-omap1/pm.c       | 13 ++++++-------
 arch/arm/mach-omap1/time.c     | 10 +++-------
 arch/arm/mach-omap1/timer32k.c | 10 +++-------
 arch/arm/mach-omap2/timer.c    | 11 +++--------
 4 files changed, 15 insertions(+), 29 deletions(-)

diff --git a/arch/arm/mach-omap1/pm.c b/arch/arm/mach-omap1/pm.c
index d068958d6f8a..2c1e2b32b9b3 100644
--- a/arch/arm/mach-omap1/pm.c
+++ b/arch/arm/mach-omap1/pm.c
@@ -596,11 +596,6 @@ static irqreturn_t omap_wakeup_interrupt(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction omap_wakeup_irq = {
-	.name		= "peripheral wakeup",
-	.handler	= omap_wakeup_interrupt
-};
-
 
 
 static const struct platform_suspend_ops omap_pm_ops = {
@@ -613,6 +608,7 @@ static const struct platform_suspend_ops omap_pm_ops = {
 static int __init omap_pm_init(void)
 {
 	int error = 0;
+	int irq;
 
 	if (!cpu_class_is_omap1())
 		return -ENODEV;
@@ -656,9 +652,12 @@ static int __init omap_pm_init(void)
 	arm_pm_idle = omap1_pm_idle;
 
 	if (cpu_is_omap7xx())
-		setup_irq(INT_7XX_WAKE_UP_REQ, &omap_wakeup_irq);
+		irq = INT_7XX_WAKE_UP_REQ;
 	else if (cpu_is_omap16xx())
-		setup_irq(INT_1610_WAKE_UP_REQ, &omap_wakeup_irq);
+		irq = INT_1610_WAKE_UP_REQ;
+	if (request_irq(irq, omap_wakeup_interrupt, 0, "peripheral wakeup",
+			NULL))
+		pr_err("Failed to request irq %d (peripheral wakeup)\n", irq);
 
 	/* Program new power ramp-up time
 	 * (0 for most boards since we don't lower voltage when in deep sleep)
diff --git a/arch/arm/mach-omap1/time.c b/arch/arm/mach-omap1/time.c
index 524977a31a49..de590a85a42b 100644
--- a/arch/arm/mach-omap1/time.c
+++ b/arch/arm/mach-omap1/time.c
@@ -155,15 +155,11 @@ static irqreturn_t omap_mpu_timer1_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction omap_mpu_timer1_irq = {
-	.name		= "mpu_timer1",
-	.flags		= IRQF_TIMER | IRQF_IRQPOLL,
-	.handler	= omap_mpu_timer1_interrupt,
-};
-
 static __init void omap_init_mpu_timer(unsigned long rate)
 {
-	setup_irq(INT_TIMER1, &omap_mpu_timer1_irq);
+	if (request_irq(INT_TIMER1, omap_mpu_timer1_interrupt,
+			IRQF_TIMER | IRQF_IRQPOLL, "mpu_timer1", NULL))
+		pr_err("Failed to request irq %d (mpu_timer1)\n", INT_TIMER1);
 	omap_mpu_timer_start(0, (rate / HZ) - 1, 1);
 
 	clockevent_mpu_timer1.cpumask = cpumask_of(0);
diff --git a/arch/arm/mach-omap1/timer32k.c b/arch/arm/mach-omap1/timer32k.c
index 0ae6c52a7d70..780fdf03c3ce 100644
--- a/arch/arm/mach-omap1/timer32k.c
+++ b/arch/arm/mach-omap1/timer32k.c
@@ -148,15 +148,11 @@ static irqreturn_t omap_32k_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction omap_32k_timer_irq = {
-	.name		= "32KHz timer",
-	.flags		= IRQF_TIMER | IRQF_IRQPOLL,
-	.handler	= omap_32k_timer_interrupt,
-};
-
 static __init void omap_init_32k_timer(void)
 {
-	setup_irq(INT_OS_TIMER, &omap_32k_timer_irq);
+	if (request_irq(INT_OS_TIMER, omap_32k_timer_interrupt,
+			IRQF_TIMER | IRQF_IRQPOLL, "32KHz timer", NULL))
+		pr_err("Failed to request irq %d(32KHz timer)\n", INT_OS_TIMER);
 
 	clockevent_32k_timer.cpumask = cpumask_of(0);
 	clockevents_config_and_register(&clockevent_32k_timer,
diff --git a/arch/arm/mach-omap2/timer.c b/arch/arm/mach-omap2/timer.c
index 0d0a731cb476..8b09cdacc30d 100644
--- a/arch/arm/mach-omap2/timer.c
+++ b/arch/arm/mach-omap2/timer.c
@@ -91,12 +91,6 @@ static irqreturn_t omap2_gp_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction omap2_gp_timer_irq = {
-	.name		= "gp_timer",
-	.flags		= IRQF_TIMER | IRQF_IRQPOLL,
-	.handler	= omap2_gp_timer_interrupt,
-};
-
 static int omap2_gp_timer_set_next_event(unsigned long cycles,
 					 struct clock_event_device *evt)
 {
@@ -382,8 +376,9 @@ static void __init omap2_gp_clockevent_init(int gptimer_id,
 				     &clockevent_gpt.name, OMAP_TIMER_POSTED);
 	BUG_ON(res);
 
-	omap2_gp_timer_irq.dev_id = &clkev;
-	setup_irq(clkev.irq, &omap2_gp_timer_irq);
+	if (request_irq(clkev.irq, omap2_gp_timer_interrupt,
+			IRQF_TIMER | IRQF_IRQPOLL, "gp_timer", &clkev))
+		pr_err("Failed to request irq %d (gp_timer)\n", clkev.irq);
 
 	__omap_dm_timer_int_enable(&clkev, OMAP_TIMER_INT_OVERFLOW);
 
-- 
2.25.1

