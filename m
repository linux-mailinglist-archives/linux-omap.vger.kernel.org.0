Return-Path: <linux-omap+bounces-4803-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F51FC158DD
	for <lists+linux-omap@lfdr.de>; Tue, 28 Oct 2025 16:43:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F08C2348D6D
	for <lists+linux-omap@lfdr.de>; Tue, 28 Oct 2025 15:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53903446B9;
	Tue, 28 Oct 2025 15:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxJjBx8r"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61EA3081B8
	for <linux-omap@vger.kernel.org>; Tue, 28 Oct 2025 15:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761666167; cv=none; b=tN1xPdSc7xGrCZDDR1hvFdnysTllDohyQ1Oqh6+eeL60cVuKIeu8FVMesJhHVfyndg4nFYLY/d9bwCP6lPhVIH8L3aIj77k2x+oUeNmWO8L0BAfOgR7DotApoYRVkrH51FSDJ5eKy57mZgm93yMPUEdcG0c9dAAes0nPeIie5n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761666167; c=relaxed/simple;
	bh=SRGxbsGV3MJee1qdQ/T8atB44Y+1gaZj7JGcpj8g8m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SvnjLNf0IyacVjtB1wm4/UmpajiySf6nMlILE672gAxFQj4WlZ8VsfVKCZGQHe3TaQpAvB/gwWtmnbtl1J6PcF9uEO+PCzxi5G1UBAIWMGI6MYxlp1rkG7Jo0qKFf2D7Hx4ag/G/au681vAVtSgzXpw3pPmUHju/PBgVOouIbUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxJjBx8r; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7a27c67cdc4so4861386b3a.3
        for <linux-omap@vger.kernel.org>; Tue, 28 Oct 2025 08:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761666165; x=1762270965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ATRw3tFFmEK1zPWNKP140zh9kBKwr+zrf40M6SOBpU=;
        b=LxJjBx8r/n5BnwpBeOrRrd+RdhA8sFNosGaPFphB/B7SMf92Cgxp6v2ck3MicJUhIW
         mR8YFkF+doM7kJmKEKfM8ggJR1pGe5d2SFWsYUKZUpnWx9o6H25EGhCOWzaUOtpTh3lA
         Uy5uEpohIrprib3l2KtYCNQuHMhdmmUDHVoAnLFbuFVDgVYAwHrA1sKtD7rptACXRzMA
         iwCOj+I4AgG8sQU/ql68sqvSXPXr+AH9LwnXwDkdU4UaeYaoh4+gU/REmwSxhIue7fWD
         Puyq4FyEk5bPIK7GXmuRCAR1BmwclZFKvUvPLxPFtfuCLzRIgEJ6sBEMsqD/m0/1axmS
         ODaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666165; x=1762270965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ATRw3tFFmEK1zPWNKP140zh9kBKwr+zrf40M6SOBpU=;
        b=ZxmRGCiI5/dZoj/A9HfBhhACk4ZEn8E0HYjGbn5ALb/be60UaIxdPH0nOFMcFVhMa1
         yIpM/5CmZSZzC7G4si+ApEztgK54VQdDya3UbRXT3cAmOTBvQFSkkc59gZ90e0FoPPQO
         +uhTAsjHh7HLsikRr7Y+1mC0S/MoBmVU4/W/t5QZZqfrag2D7T695dxooFIKZZcfwjwv
         8oQho6cKlMQ1CLuSXmbyYdkGNdbDCCf/dMjAjtIO0sDHtMOo93AjEIqtjtkDSwIrhtRz
         EXrGInEay7iLjp+uksH/dkZB0NtOK/KdJJAQwc/gA53dQD9DHBcMi5QCusUnT7uxE9if
         H3sA==
X-Forwarded-Encrypted: i=1; AJvYcCVDpayz9G4KRFp8wITOsTPNVyxTTzXjEOUkICCDMkqmUiTB9boUqAGsTB5/Yd+Jbjj6L4MFsFspgQ+Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxJAqHB6fcPsZWoInk8ssdJN8Lzvb4Xb4scpts+3euE/U4Gv2yQ
	JPUkGmlpCl1vbbLkIaNUEWFz7G5DSU1F9KsFsoxYhX1CTfk8fBlDna+f
X-Gm-Gg: ASbGncsbijQHiYONZk6I89+3EU8q/OBrAkvSmaUCAe64cwM/agAu6RP5es3muFXm1EY
	zne5xvzC7hWoPhJEVLzWKzV6IJ3q6Ne2zAPC7ZcRDMM1kQYJNFnDWZftR4Z/yTQ9AtbzF5eHTin
	z3gkGiD01MSNDyh9v6mp6svS3h/O/JbKl+zWpw4dZS307x48O6Mlmc4dzlcHO4vkrZUKa5Q8KAM
	dGYZ60A29Rvyn+AL58DS4zjdzJTJCjqVUYz7MD4pD942IvtN5hY39ACq3XnBlayEQhK6/rWWIq2
	RZpYl/xJIzWUyocys6pUlD+vdqzecnMDi9sUHYNTdHEK+ctCm2EKNBHu1fm3/6Ay1hpmiSFQNV9
	Ytg03kP7cxVWZNIARcAHnz2FVzlmncAgapa0b7IP8ROZzTCQDbVVigwOXTiKGulh7F9jPNNxpRA
	==
X-Google-Smtp-Source: AGHT+IFX1XKPhnz3Nfvrc+6BGz+aJT/D7E5JuxSlko5PpiJVk9W0Dbe0cl4ODkgGZEnXaVBp1Weykg==
X-Received: by 2002:a17:903:2348:b0:24c:cca1:7cfc with SMTP id d9443c01a7336-294cb6756bdmr53895455ad.59.1761666164805;
        Tue, 28 Oct 2025 08:42:44 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d0a4d9sm119815145ad.37.2025.10.28.08.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:42:44 -0700 (PDT)
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
Date: Tue, 28 Oct 2025 21:12:23 +0530
Message-ID: <20251028154229.6774-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251028154229.6774-1-linux.amoon@gmail.com>
References: <20251028154229.6774-1-linux.amoon@gmail.com>
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
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v4: Add Rb Siddharth
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


