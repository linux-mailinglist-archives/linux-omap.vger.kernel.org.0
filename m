Return-Path: <linux-omap+bounces-4285-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32385B2E1B6
	for <lists+linux-omap@lfdr.de>; Wed, 20 Aug 2025 18:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97A13A01367
	for <lists+linux-omap@lfdr.de>; Wed, 20 Aug 2025 15:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D91323AB9C;
	Wed, 20 Aug 2025 15:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="htY+Xgu3"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F497322552;
	Wed, 20 Aug 2025 15:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705520; cv=none; b=siB/2D4Mx/QP+JUgKxekiD27golT+I5r0dNcdtoxUnyCXSYXaxJ6jmLyIYjEfqb4gRANbRUWzGGphiIMqGsQBVYpNYpkbUqxU0yhtMTA7QSJxPdQXGiYskFFI9Ba5JPXqIjuB1L7KnL5mWUWj5K/tGZwmj0zsyP8qEhij7gWBC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705520; c=relaxed/simple;
	bh=82OKclnpvuD5JTVMrBqlAJu0EBMZWMFAgygO3iLIMjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bGPHapNOK3U2sNXNG0Gu0m17A4qvMc77RE2j8ggDt8eIh02sSLfjR310j2ul7n07PJJ2m2H+0+bL1etyBdABGzr4srW5b0pmimnxS6OrIKC++NWxIQgP4S8o+D6b7hvZTqNynxkIjYifgHbuO43H8CYWluaO6IAI5nttzvJaooI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htY+Xgu3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC37C4CEE7;
	Wed, 20 Aug 2025 15:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705518;
	bh=82OKclnpvuD5JTVMrBqlAJu0EBMZWMFAgygO3iLIMjQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=htY+Xgu35L1eDvFMvjtOBm4WrBQpGOHDGbBCSSz6VdfPGoP9FdppScKn94yuWQWag
	 1nNHhyJZJBhB8YC9TiUgrNmv2Dz/nQiD5UQ/juQKuaoFRifSJe9j71xvaVmwSER2wE
	 Pow7aULI8LhAjCa6XUMRQLEzhiE0JUn8GcgihXpumV+9KzYBd7djpWdsyIuOehSLDn
	 eBTYEV0oxpOPvrzqe6qj9PbGVPnTkLDG3VV+G2eHscgFqE0AzVXc8CSDwB/4v6oEoy
	 LXnd8KjWiupyx2Gk4Bm9p+mReDUnitRD7oWYgQNhnU9kEdq8vX73kLKIelw3+g/c8p
	 kO1wuvXmMNwCA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Michael Buesch <m@bues.ch>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 04/16] gpio: htc-egpio: Use modern PM macros
Date: Wed, 20 Aug 2025 23:40:25 +0800
Message-ID: <20250820154037.22228-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250820154037.22228-1-jszhang@kernel.org>
References: <20250820154037.22228-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the modern PM macros for the suspend and resume functions to be
automatically dropped by the compiler when CONFIG_PM or
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/gpio/gpio-htc-egpio.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index 2eaed83214d8..72935d6dbebf 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -364,21 +364,20 @@ static int __init egpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int egpio_suspend(struct platform_device *pdev, pm_message_t state)
+static int egpio_suspend(struct device *dev)
 {
-	struct egpio_info *ei = platform_get_drvdata(pdev);
+	struct egpio_info *ei = dev_get_drvdata(dev);
 
-	if (ei->chained_irq && device_may_wakeup(&pdev->dev))
+	if (ei->chained_irq && device_may_wakeup(dev))
 		enable_irq_wake(ei->chained_irq);
 	return 0;
 }
 
-static int egpio_resume(struct platform_device *pdev)
+static int egpio_resume(struct device *dev)
 {
-	struct egpio_info *ei = platform_get_drvdata(pdev);
+	struct egpio_info *ei = dev_get_drvdata(dev);
 
-	if (ei->chained_irq && device_may_wakeup(&pdev->dev))
+	if (ei->chained_irq && device_may_wakeup(dev))
 		disable_irq_wake(ei->chained_irq);
 
 	/* Update registers from the cache, in case
@@ -386,19 +385,15 @@ static int egpio_resume(struct platform_device *pdev)
 	egpio_write_cache(ei);
 	return 0;
 }
-#else
-#define egpio_suspend NULL
-#define egpio_resume NULL
-#endif
 
+static DEFINE_SIMPLE_DEV_PM_OPS(egpio_pm_ops, egpio_suspend, egpio_resume);
 
 static struct platform_driver egpio_driver = {
 	.driver = {
 		.name = "htc-egpio",
 		.suppress_bind_attrs = true,
+		.pm = pm_sleep_ptr(&egpio_pm_ops),
 	},
-	.suspend      = egpio_suspend,
-	.resume       = egpio_resume,
 };
 
 static int __init egpio_init(void)
-- 
2.50.1


