Return-Path: <linux-omap+bounces-4681-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DBCBD90CC
	for <lists+linux-omap@lfdr.de>; Tue, 14 Oct 2025 13:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E387B3AA8B3
	for <lists+linux-omap@lfdr.de>; Tue, 14 Oct 2025 11:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BDB030F937;
	Tue, 14 Oct 2025 11:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PaU4TmEt"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EE830F949
	for <linux-omap@vger.kernel.org>; Tue, 14 Oct 2025 11:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760441572; cv=none; b=d+rIOHUE2Fx2RicX2RztdiyJhEs+awfjTai7dQZe0glsLtTxh20vjqZECW8XkjJ87//sIWxE5DveDQOp1kpqFhT5pEPX6NQJ3+/uYqWbJjW8Ao/eehrE42N6+B02XhXUqLamlahjK6dNlRHmznAY+3CRAMp/ojkMvSX1/foU8QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760441572; c=relaxed/simple;
	bh=HhxulXQwatE6PXjsTOpERvUEfgAFTPUo3nVaCBHQfkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AM41UJ5HSICubiPO591DGBeSV2W34xuxjz+DUSfSqK00NZdPDp47d5wERF/oOc9+eikrc32z6JqCFeY4cJxpWRFyKD3B9APNc59CtACEiV3hg1sdDLtEQM+a3sI0zmvVYdWEAy0htx6gNABmLfUCc95EYwef57JpRH85kHCOJnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PaU4TmEt; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-791c287c10dso4394164b3a.1
        for <linux-omap@vger.kernel.org>; Tue, 14 Oct 2025 04:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760441570; x=1761046370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBUWIXVuX9TSH7iwZbReBbw9Y6KDyRcjsjDA5QvkLIc=;
        b=PaU4TmEt4KOBIKsAOesotTtCbsPJNe0uTBzp1QxRhSROJLCFT8q3MLq7fcYGVyz9VP
         wvrGO+gajyrZo5OBt4aa1RMRUjghgq7A34fNjsxs/jXg5xCx0ClBALErQrM7MIAkFKvp
         Rg0Rga+omEoCSAQSLWuMNDnmTLQlzU8uMv7cTvxvErr9lWROseEV+IyurMnBdZ0TRb5e
         B01ek1VIlVQZnTMvGVpH6AXyaVe/YMVQXBnAOriI0szXoSUHtJs5g9X6iXeeTXricn6l
         Lpe3GNz7Raf/+roEOGNnvsyh/NEpTHcrCV0sMwdjYIUAt7N69e4ytH2c13YncqXSr3vN
         KIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760441570; x=1761046370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBUWIXVuX9TSH7iwZbReBbw9Y6KDyRcjsjDA5QvkLIc=;
        b=vP/psCe8L/eIgJF9/a4MGyLwGChlG0+Bl+M40KLiZLFgRunzjMrTe02iNTncx/QuGD
         rYowdxKYmXX1nhkI/8pc4EOcgQmoBFEus0AAYRGWv2JwUJy7BDj1PSbOZAvZekBL13Ye
         SNmNK9AxSKqlITWDnylr88N1I5xlHMc1XzR2icNixN0ySOiMVbPpxbuw6/ZKPVdZ7qCg
         /ibzWqZ0JatEmpsbZz30QUsqDLP6322HsfTyps9w09MagTDJVdCrMtRUVQRFNpocKLBp
         a6arQslEaxxE5DC0KXjx36UIl6Qjx7iWxFobCVc4DB9GjuOwWh7zn0csYdRvw4fMdEP2
         tw8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeIpQeaetCCH/VriYAKxKappx8wIzZWmj99CPzkIglWv/pJDyzL7uKTDfW+Hc2B3bWNra0sWNMz4Sz@vger.kernel.org
X-Gm-Message-State: AOJu0YyNM5AJLZtdU1elURCMlwKxk+aimWR4eqTaKSlimsTtrZBupg5m
	aa5tsjWixxrn9gyBHEDV9+gtVvBdbBnpwMvDpKuBcFOoRUBxNKPELi20
X-Gm-Gg: ASbGncuPcmcp8msKBEEyYmc7re2Q69tItiJqfxHkyxaKQkVxJjpeN/CLnqhgB8xCR9m
	ElZcAgH/M/Yv3bu1edELF318Qjq875oF+5xCklwNOIa4NbiNjvj7vTMqyMc8DyanPIPrO5ereTr
	uimUWLV9+Bby9G/58ATeM0nv9z3QIWDaLoL2OOpJ40p+wx6qicLxBpVnD0dosCmjdt/xOXIl4y+
	98murC5QYgMsc3lv4LrgstA9NJ8q/AkKKMzNk2EIDH/kwt7skYDmYKGBeUYcsQiDKomWJ1gbrwW
	yFKoqyAAEYetjcDkp6aG/BCmRaHywLJ78KipDgNoJNhuc/utjbq+Uzk9Dikr3coojHigW0pB1Wq
	K/9/XkUZuyXVkGD4zVemrTzyOMv65GmVFkrZeQM0=
X-Google-Smtp-Source: AGHT+IHUZvlwK/tHfChIoy9WwwPnZcMKeQjitVT4QrngVrm6V72sz77ULhr0gyxke52yNoTSgqWuAA==
X-Received: by 2002:a05:6a00:c8c:b0:77f:6971:c590 with SMTP id d2e1a72fcca58-79387d0f36amr26600669b3a.22.1760441569783;
        Tue, 14 Oct 2025 04:32:49 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0965c3sm14871383b3a.52.2025.10.14.04.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:32:49 -0700 (PDT)
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
Subject: [PATCH v1 1/3] PCI: j721e: Propagate dev_err_probe return value
Date: Tue, 14 Oct 2025 17:02:27 +0530
Message-ID: <20251014113234.44418-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251014113234.44418-1-linux.amoon@gmail.com>
References: <20251014113234.44418-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure that the return value from dev_err_probe() is consistently assigned
back to ret in all error paths within j721e_pcie_probe(). This ensures
the original error code are propagation for debugging.

Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v1: new patch in this series
---
 drivers/pci/controller/cadence/pci-j721e.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 5bc5ab20aa6d..9c7bfa77a66e 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -569,20 +569,20 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	ret = pm_runtime_get_sync(dev);
 	if (ret < 0) {
-		dev_err_probe(dev, ret, "pm_runtime_get_sync failed\n");
+		ret = dev_err_probe(dev, ret, "pm_runtime_get_sync failed\n");
 		goto err_get_sync;
 	}
 
 	ret = j721e_pcie_ctrl_init(pcie);
 	if (ret < 0) {
-		dev_err_probe(dev, ret, "j721e_pcie_ctrl_init failed\n");
+		ret = dev_err_probe(dev, ret, "j721e_pcie_ctrl_init failed\n");
 		goto err_get_sync;
 	}
 
 	ret = devm_request_irq(dev, irq, j721e_pcie_link_irq_handler, 0,
 			       "j721e-pcie-link-down-irq", pcie);
 	if (ret < 0) {
-		dev_err_probe(dev, ret, "failed to request link state IRQ %d\n", irq);
+		ret = dev_err_probe(dev, ret, "failed to request link state IRQ %d\n", irq);
 		goto err_get_sync;
 	}
 
@@ -599,7 +599,7 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 
 		ret = cdns_pcie_init_phy(dev, cdns_pcie);
 		if (ret) {
-			dev_err_probe(dev, ret, "Failed to init phy\n");
+			ret = dev_err_probe(dev, ret, "Failed to init phy\n");
 			goto err_get_sync;
 		}
 
@@ -611,7 +611,7 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 
 		ret = clk_prepare_enable(clk);
 		if (ret) {
-			dev_err_probe(dev, ret, "failed to enable pcie_refclk\n");
+			ret = dev_err_probe(dev, ret, "failed to enable pcie_refclk\n");
 			goto err_pcie_setup;
 		}
 		pcie->refclk = clk;
@@ -638,7 +638,7 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 	case PCI_MODE_EP:
 		ret = cdns_pcie_init_phy(dev, cdns_pcie);
 		if (ret) {
-			dev_err_probe(dev, ret, "Failed to init phy\n");
+			ret = dev_err_probe(dev, ret, "Failed to init phy\n");
 			goto err_get_sync;
 		}
 
-- 
2.50.1


