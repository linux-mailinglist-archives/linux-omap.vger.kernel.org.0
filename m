Return-Path: <linux-omap+bounces-4682-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ABDBD90D8
	for <lists+linux-omap@lfdr.de>; Tue, 14 Oct 2025 13:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F11593B81CE
	for <lists+linux-omap@lfdr.de>; Tue, 14 Oct 2025 11:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B0A30FC35;
	Tue, 14 Oct 2025 11:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ccpaD//s"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD9330DEA4
	for <linux-omap@vger.kernel.org>; Tue, 14 Oct 2025 11:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760441578; cv=none; b=hfhBrWLhZdz8boUv2+R/9voNuX3KmqEcxkkvwv8nkk1tG1+Wu/twcqBbuTrz/CYXSTThuSwAnudp92dZESspU9tVNAqlH6hrQ8bAXw2FsIzbQjHDb5+DWltT5OHtlUr7S9Zl1398cMg+bVIIp5ianqF2D5aTnBBNbfQ4G+60dCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760441578; c=relaxed/simple;
	bh=PoKOs9TgSjfkqiMX2+2Ly0Vb1OFpd3epTvsXddSqn5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ojaLN1aN0hLo/yPuKVsv3BLgKS3lK43WsMz2iJfVFtzBUQUmLS/uE2Wt/tOM6KGYhkkgRUx6ptJ6j/D2zqA+kwTWuTFYk2iXzuAyGG+c/99kA+slIKbtHopsCbyZ1Z3yJiv7F+M+gIjJyfGuSWqkZjeFATIvsCToPJerj5n0cBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ccpaD//s; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-79ef9d1805fso482465b3a.1
        for <linux-omap@vger.kernel.org>; Tue, 14 Oct 2025 04:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760441576; x=1761046376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7UerwX9ObkYiq6vERvNVgcsL6sbi2km2IZoP2hNgnA=;
        b=ccpaD//spzzaSxtfpn3a98ddUjjV4cDzVLsd6W4R+fWzJVH62b33RPfUti9wtAaMQ7
         qbe560HBwhjH4dJLIZmhmErnseh4HF1OtaoPuw//OFfhUD+ciFhLPIHrny/6qhTYKEv9
         LVvJcqFHWqG37vPIBWYgtU6awZE3g4whDYHnswG5xbI0XOo/NVDxp36m3APC2nq6ElOy
         eAkCG/m2qDjNckqrJ3A3M2KpcSf8FNMySAe8gNopyGWEzqhEq2srdvy6aYUgREiFEBkU
         XStKv/DCCCTnJUEO90DJH+znobht6GOC6v9MXKsVK3/fQxl7OS/OEpB14gLC+ld0XPnW
         i2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760441576; x=1761046376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7UerwX9ObkYiq6vERvNVgcsL6sbi2km2IZoP2hNgnA=;
        b=uu6UTBw0toQ9V6sLIfxteLYHABXh1KDyr1raJsDVwJkIMc9w67ZCvT6sCDd0VBUwHJ
         ndrgLhZNtFbTtmLDlvr+BtkwoAJ5qGCM1GbPb5gJpOvW+9EYu94qCy6PnbxGpOuyJ6NT
         0Kj5DLA4U7OCWOx0i13f+4cZmd02fGC+LpQORzT5Df77yemoDZidSKylLLCoiLYnb8Og
         hQXRhUvSuuwcfATGlbkLj7x76gpJLNRmH3hCPMUrexRuaFqPSjLQ7ziC9rgUiqRXVFlj
         DVLf8zsAiEeWpkyhDI8YbKo+AUY2NsCtva9l9Nl6LyapiWpBEiwPOcxqIX37oO2nvhkJ
         LCkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ9ygRex4RQIoOqcuHW0DRrTOCOcHD8As4dz+9a/FmfyXjtM6+9jOpu3WcEW2iAaxcqAp1G+K647zA@vger.kernel.org
X-Gm-Message-State: AOJu0YwVJr9sWuzzynHTqcEATtHdyV+rOyzn7xKCMWx6S4h0EOW/PJkZ
	PIfpCicPe15l91IGt4+kzsu0HyidICFzVhCA4tF/R42LI/xnhNehZ1wS
X-Gm-Gg: ASbGnctuAjWwryzQbXMWcK+lDIFQyimNe3N0K56hZB13Y2BrLJ4YdOcZTMx7T546QMw
	JFKfWwvBP5ivZJ2WAUq8Kxm13Bo2T+mPpal9I0xFStEr+6uGj65HZkzEFsvRuS+ytqbxPkDnZbJ
	1lsxdKlBn1Aa+f1iMOva1BAOz2wLPUL2OmSalmbH8XkSCv/hEJ0KcWg0+Xv9vl+uth7fawD39ib
	q4dqxYAdIEEF3K7J0zmMbkFyV+yY5JvRiOqjmlLhD0LhCvHxGfO8TmAhDrF/zHQW0/Jsc8JgPtD
	+JrohZu6fQWgcqSP0CgO4BeNTImIfbX0Uzkaqij86Yl84oJBb6RIC8SLlkDK0OMu68KFCkRMYJi
	hMMYAGvMVyjS2C+7VTIfmZhttZ1/vv+0VZJgQBPWTwEv400nakg==
X-Google-Smtp-Source: AGHT+IFL/A1wjKWekovh/oihjR4JIjfCM839DB7WtztyHa+NpAIMVWIzCgumtsxtL4h7BgUTWYN4Fw==
X-Received: by 2002:a05:6a00:182a:b0:781:275a:29d9 with SMTP id d2e1a72fcca58-7938742c7aemr32083308b3a.18.1760441575343;
        Tue, 14 Oct 2025 04:32:55 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0965c3sm14871383b3a.52.2025.10.14.04.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:32:54 -0700 (PDT)
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
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 2/3] PCI: j721e: Use devm_clk_get_optional_enabled() to get the clock
Date: Tue, 14 Oct 2025 17:02:28 +0530
Message-ID: <20251014113234.44418-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251014113234.44418-1-linux.amoon@gmail.com>
References: <20251014113234.44418-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use devm_clk_get_optional_enabled() helper instead of calling
devm_clk_get_optional() and then clk_prepare_enable(). It simplifies
the error handling and makes the code more compact. This changes removes
the unnecessary clk variable and assigns the result of the
devm_clk_get_optional_enabled() call directly to pcie->refclk.
This makes the code more concise and readable without changing the
behavior.

Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v1: Drop explicit clk_disable_unprepare — handled by devm_clk_get_optional_enabled
    Since devm_clk_get_optional_enabled internally manages clk_prepare_enable and
    clk_disable_unprepare as part of its lifecycle, the explicit call to
    clk_disable_unprepare is redundant and can be safely removed.
---
 drivers/pci/controller/cadence/pci-j721e.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 9c7bfa77a66e..ed8e182f0772 100644
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
@@ -603,18 +602,11 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 			goto err_get_sync;
 		}
 
-		clk = devm_clk_get_optional(dev, "pcie_refclk");
-		if (IS_ERR(clk)) {
-			ret = dev_err_probe(dev, PTR_ERR(clk), "failed to get pcie_refclk\n");
-			goto err_pcie_setup;
-		}
-
-		ret = clk_prepare_enable(clk);
-		if (ret) {
+		pcie->refclk = devm_clk_get_optional_enabled(dev, "pcie_refclk");
+		if (IS_ERR(pcie->refclk)) {
 			ret = dev_err_probe(dev, ret, "failed to enable pcie_refclk\n");
 			goto err_pcie_setup;
 		}
-		pcie->refclk = clk;
 
 		/*
 		 * Section 2.2 of the PCI Express Card Electromechanical
@@ -630,7 +622,6 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 
 		ret = cdns_pcie_host_setup(rc);
 		if (ret < 0) {
-			clk_disable_unprepare(pcie->refclk);
 			goto err_pcie_setup;
 		}
 
@@ -679,7 +670,6 @@ static void j721e_pcie_remove(struct platform_device *pdev)
 
 	gpiod_set_value_cansleep(pcie->reset_gpio, 0);
 
-	clk_disable_unprepare(pcie->refclk);
 	cdns_pcie_disable_phy(cdns_pcie);
 	j721e_pcie_disable_link_irq(pcie);
 	pm_runtime_put(dev);
-- 
2.50.1


