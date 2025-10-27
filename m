Return-Path: <linux-omap+bounces-4783-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FAFC0C8FF
	for <lists+linux-omap@lfdr.de>; Mon, 27 Oct 2025 10:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C11BE1884905
	for <lists+linux-omap@lfdr.de>; Mon, 27 Oct 2025 09:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C6B2F83B8;
	Mon, 27 Oct 2025 09:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0t1wjFz"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EDE2F5A33
	for <linux-omap@vger.kernel.org>; Mon, 27 Oct 2025 09:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761555808; cv=none; b=ZQhorlDw8qm/yHVpSQpj4WceuDgnWIj79j1CP4EB6gwzkHbt+fFc29oh70CJoX0Lq52+xfzSJj6KVs75OMlA8QemBcISZk2VXv5jSmiwQDRijExSYFiSmJouwGAlErTdGJBUVcnoMMSgyPZTDnnom0GI/2l0a/IkaUqhkgxX+PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761555808; c=relaxed/simple;
	bh=eogBR5sxD05fZ6c/zTfkTbZBgKCFI/Gyw8bMtmzrf/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ndJkIsgD8vGDoYJTJoZ3TZP76Q2viURM99kJGACDSeqJkNU1JND2gcrGu8tIfNnGqskpwyY9aFXyyKM3DIJSbmZRfa5QU39FApvx0md1yavxoN6tczrDG3elafn9e9wdk53U9eQOKupfRTM46AWllwAtnRFs95keHe9BJBkm0sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0t1wjFz; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b55517e74e3so4054083a12.2
        for <linux-omap@vger.kernel.org>; Mon, 27 Oct 2025 02:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761555806; x=1762160606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDCevJO/jn4uxha5g3iGQ0Gi4sz+BoDakhPsr84awrg=;
        b=P0t1wjFzzv8xKGXVHp5WRpuE+lUaI+Z7UVZ47m56PohjaWjv2M3CYbUvshRfsrF7tw
         BTyHijKitPi2zRGmHL9SADRQr3CBGAlbgNuT58FAtDVD2F3ywc844KtX7MsyFaamynL5
         XGQyPIS/nfjhiTcMdtO5r0NehjmnebDUOYnZbL1fBkW639zW8ihbP6HbcRKOUtTF2SqW
         pkMmsQkCDABRqrQ0lPSzJNlmshzaqSMqohmpUB3u291GjR71qsMqP9cGicDN55MYVdgM
         eHHr4JGG/m8rb7Mtz2uiA4wIWxlqvTsJz9Zf57sQ3eqUN05UQe12B/fLed1DvGb8CetI
         +wFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761555806; x=1762160606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDCevJO/jn4uxha5g3iGQ0Gi4sz+BoDakhPsr84awrg=;
        b=roJfVQ3qXfGaO8hd9Zg+zWgqTHRl9QIKIsamWwayWV+i8nWyfULzosXbXHC84Hxim5
         ElqmXpYB2ic+W1ZGTgzFEQmuL0MBC2v1RH693Ney9n4W6TMpHGQtu2JHzr3PP1xAky4y
         ZyZnibPae7lYKpY/LOPa4/QAnC/5SjlAHtzn6DG+7nEDqOe4n2mxZZEAwjN5J9pK8Xgo
         mpoy2IcdOsmy1n+p9OCjEeNPNRrNPEr1VFrFA/OwCmpn8XU72mfv//P6bSkWQVozcb8Z
         Pds61xUAlDQdsasXB6AmNZvo3XBv8ALs+bPQXf8ZPOqVrdY9vImz1N+fHeRXdRrnxmHS
         G/gw==
X-Forwarded-Encrypted: i=1; AJvYcCUVvqB9APHvsL7Mn6x/hc+zwGvqjklRUMzQeMBUhxqqIogt2fxac3RbD4muWMM41E/gMshWWa/UEi9E@vger.kernel.org
X-Gm-Message-State: AOJu0YyhzplY1RtFOClEOOBg8EaVw+oxrCO6x1kP7cQT/O7hb3m0y1nE
	lGYa6iD4tjB+fCenCDpgu9mBYwNSFyR/MM1rJAMw2IzWNdnPSQeVRvN6
X-Gm-Gg: ASbGnctAS2Mn7Wnq/OQKuVaS0ataQNw6QBB/e3wI+eE7qh49thYWgIYw61wKKZ87v07
	dF+f/Bnkbmr8INirIuxF+DvmocVxnqM9U9DD6N311zDrrw7lJEOAB3/lAPDM/6Yp7BGPx0EkB/Y
	lk/H7+oLn0W3Rj/z64snLejisN0WwZ102WOK7QGVN8DDIsZA4xCsY7Iljv2wub0M/TmwnZ+qkhb
	2sZzdky4uAuGBf0bXal+zvp361cJ/98Ei9HwnpU1x2Don5sIyOiWMdI9sz3UyOQxtsrgHw/l2+K
	URoI2MkEaNICV5nIlVXq+0onoVE/9hSf+jFNeWx+YetvxJa51i6zg6hX8TmTUmGnHaZ+5p0+OzN
	u6NqixqTEe7bo9ldUc5ozwS3oHck+Jzv1O05aR6GUxqCfHLps3I9qkf5JHOz/HzRd5Ie4s84kRz
	0nZ7I7ifL9OCWfEWEubMw=
X-Google-Smtp-Source: AGHT+IHmIUD2h1GuwjjhJJdGb/O47J3PxX86EGpWbLGZgnTd2IndPXIXzCHY76GqEBfYMKQNDQz7ww==
X-Received: by 2002:a17:902:e84b:b0:290:c0ed:de42 with SMTP id d9443c01a7336-290caf8582emr559508755ad.36.1761555806053;
        Mon, 27 Oct 2025 02:03:26 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3433sm73881335ad.21.2025.10.27.02.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:03:25 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-omap@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v3 1/2] PCI: j721e: Use devm_clk_get_optional_enabled() to get the clock
Date: Mon, 27 Oct 2025 14:33:05 +0530
Message-ID: <20251027090310.38999-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251027090310.38999-1-linux.amoon@gmail.com>
References: <20251027090310.38999-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_clk_get_optional_enabled() helper instead of calling
devm_clk_get_optional() and then clk_prepare_enable(). It simplifies
the clk_prepare_enable() and clk_disable_unprepare() with proper error
handling and makes the code more compact.
The result of devm_clk_get_optional_enabled() is now assigned directly
to pcie->refclk. This removes a superfluous local clk variable,
improving code readability and compactness. The functionality
remains unchanged, but the code is now more streamlined.

Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v3: Clock needs to be disabled on Suspend and enabled on Resume.
v2: Rephase the commit message and use proper error pointer
    PTR_ERR(pcie->refclk) to return error.
v1: Drop explicit clk_disable_unprepare as it handled by
    devm_clk_get_optional_enabled, Since devm_clk_get_optional_enabled
    internally manages clk_prepare_enable and clk_disable_unprepare
    as part of its lifecycle, the explicit call to clk_disable_unprepare
    is redundant and can be safely removed.
---
 drivers/pci/controller/cadence/pci-j721e.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 5bc5ab20aa6d..a88b2e52fd78 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -479,7 +479,6 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 	struct cdns_pcie_ep *ep = NULL;
 	struct gpio_desc *gpiod;
 	void __iomem *base;
-	struct clk *clk;
 	u32 num_lanes;
 	u32 mode;
 	int ret;
@@ -603,19 +602,13 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 			goto err_get_sync;
 		}
 
-		clk = devm_clk_get_optional(dev, "pcie_refclk");
-		if (IS_ERR(clk)) {
-			ret = dev_err_probe(dev, PTR_ERR(clk), "failed to get pcie_refclk\n");
+		pcie->refclk = devm_clk_get_optional_enabled(dev, "pcie_refclk");
+		if (IS_ERR(pcie->refclk)) {
+			ret = dev_err_probe(dev, PTR_ERR(pcie->refclk),
+					    "failed to enable pcie_refclk\n");
 			goto err_pcie_setup;
 		}
 
-		ret = clk_prepare_enable(clk);
-		if (ret) {
-			dev_err_probe(dev, ret, "failed to enable pcie_refclk\n");
-			goto err_pcie_setup;
-		}
-		pcie->refclk = clk;
-
 		/*
 		 * Section 2.2 of the PCI Express Card Electromechanical
 		 * Specification (Revision 5.1) mandates that the deassertion
@@ -629,10 +622,8 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 		}
 
 		ret = cdns_pcie_host_setup(rc);
-		if (ret < 0) {
-			clk_disable_unprepare(pcie->refclk);
+		if (ret < 0)
 			goto err_pcie_setup;
-		}
 
 		break;
 	case PCI_MODE_EP:
@@ -679,7 +670,6 @@ static void j721e_pcie_remove(struct platform_device *pdev)
 
 	gpiod_set_value_cansleep(pcie->reset_gpio, 0);
 
-	clk_disable_unprepare(pcie->refclk);
 	cdns_pcie_disable_phy(cdns_pcie);
 	j721e_pcie_disable_link_irq(pcie);
 	pm_runtime_put(dev);
-- 
2.50.1


