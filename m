Return-Path: <linux-omap+bounces-4667-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E89ABD2837
	for <lists+linux-omap@lfdr.de>; Mon, 13 Oct 2025 12:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1C833B3CAB
	for <lists+linux-omap@lfdr.de>; Mon, 13 Oct 2025 10:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45E02FE584;
	Mon, 13 Oct 2025 10:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3qX2/5i"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7721B394F
	for <linux-omap@vger.kernel.org>; Mon, 13 Oct 2025 10:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760350667; cv=none; b=UqhAKlIoLyTYWVsvftdA+FirXdxClScrw0YnZAgJz2veV/1vg7ieVHjwpmwaXzZb6LTJOfzZYw8mZxFLDnD5sKDqF6cDh5XOfVezP0ydroZQP6tW0py7I68TmHFqoeo4oZIvtMStNLeDyTuVcWtLtoZ+HP6JOfURiTAgqsz4P40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760350667; c=relaxed/simple;
	bh=fLqhCB9ZHaE35jEAvUwL/XlQACvFsJNj7NN+aAdIw+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UOuh+tP2pmc8qm/v35n6jMWTX6JSbCEPFxxPUqdbTeQ3YFVX94FizyojALMPuDMo2Ds7vwk4otZ2/O8dcN6YqkF2t+qDPn+WW0Xr7+HHWsJlRjRCNOvVeog83NL84DpGnfszfWygNwl27ob9DSWzWucpgSgF5o5N2nBUBbchi9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3qX2/5i; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-339d7c403b6so3931075a91.2
        for <linux-omap@vger.kernel.org>; Mon, 13 Oct 2025 03:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760350665; x=1760955465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rL8Zvity0qBrpOIGKiLq2gATcEJ0bdlrudF1QRk85so=;
        b=e3qX2/5iepCXH6WkrSyxJe7ORCQ8SRV46El9RZmkR9AV4HwElRyK5OFc4nLFWqN1tR
         gnoeHcNW+nIS8o9uiAV/SE1Q7wl3F/qE9E+mee3jeFpwZk0rH2a3+8OAaUiapa5W9yfd
         x2zFo6OEod/Fz/y2Q76TpjFZqPfhGw8ntS9SXeTAoD4jwQySMmTGK0eUUbI3pHLI6YVH
         EQeXTy9Rf2qdt4Uj/zPNtaD5CEJN7UK1yXFM+T2gdrMiUykhhDWw4eN+Sr6J51Ep4aAB
         DarIacU/aSAQE2TRaE39UJXVQ4L+HKfRfv5p7XX2mMicXKJ53h9IQOHM6kP2NtygFNKb
         X4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760350665; x=1760955465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rL8Zvity0qBrpOIGKiLq2gATcEJ0bdlrudF1QRk85so=;
        b=F9gHQZPPVgmiTIYcsEJ/OtJNYbaVmNHsLG1MjnLQPY+f4ymVWTIfltMMYneBWmgEap
         NCyFc8C0S1+T4x9ZnMYV5rDq5q94LZavqhWBnaO+hi0EcXGyW0iSgRwRArPq/plhaMq1
         lazB/zdPE3aa2+iEf2nDAWZxnSXpHqM3Avbcb900pPV+FUYRJNjo/UmZ6lTYQBou1hxl
         Oo84UDzbGZG40CZRCzEzqlxCDNDsb8Nm39VAaFRY0lYdoqoPaY8mfG1Q2L9LTjho2uMe
         wFZ/rc2VRdr5oNFSuIwYOsz5H/wCGJgJ1mfmCH4h98q6ZCJ0dMDFSFaP6E6eW+HrpPyr
         pOmw==
X-Forwarded-Encrypted: i=1; AJvYcCXoBKvM/tdV0TQf/YOHdXujpCiR5Uq4ZrdoPDyvx42l+yONHIXf2CX439QBKyfvfyqe5Zk6pf6fD4TK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/h0MxGkL7wtSpBFrA9+8ZvlPryluDOPqHomhS48l+k8VV23eG
	1Agp0CRaudsp+MwzX1Ioa9z5/JOT9aH1lugD0+9w/do4epyjUZZT3CLy
X-Gm-Gg: ASbGncva/c0uw84ZIqIPC+8sX7Myr78+75h19dX9bO7JLe9/Y9rh91yfztjaFTq00n2
	VHlDkeOLGBKK48IOG96aGaEH7ws3YpW+OrgToWK9ljWoowV6jCtIcekyLD5Uylt1EVZhLCC152A
	7yC1ET2xbiJPaFDvZGzkFg03JmezJLfW/+N+Cug2cxHYHZE9fiC5MOavCPQx1+MK8UgnKcHWFqS
	hSXz3xOsBX7jRb+9hj501e6FR0jKPLMnN4snb3JvT/sug+aMJbR9RcknoBVMqg+bAw+/NiMddrX
	xU6rCizzj/l62mVzzMhV4loqCOjPByevlXWh1pzxoPoLgntyvSUw9sQy8OcP6PxbaGuTeTBxzji
	PSXN28FfedtN+6xpvhILiv5ta+wv+6wtyk+fCXsqVAzeSzrWAfw==
X-Google-Smtp-Source: AGHT+IHcngJ21CdNAU4iF9jGL+GrQ8wIh2V4zG56kXYLEpN2UR66JICC8m/eBuKADrldWfXWqWJEAw==
X-Received: by 2002:a17:90b:3846:b0:339:a323:30fe with SMTP id 98e67ed59e1d1-33b51168e73mr29465661a91.14.1760350665091;
        Mon, 13 Oct 2025 03:17:45 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b52a5656dsm7422864a91.11.2025.10.13.03.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:17:44 -0700 (PDT)
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
Subject: [RFC v1 1/2] PCI: j721e: Use devm_clk_get_optional_enabled() to get the clock
Date: Mon, 13 Oct 2025 15:47:23 +0530
Message-ID: <20251013101727.129260-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251013101727.129260-1-linux.amoon@gmail.com>
References: <20251013101727.129260-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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
 drivers/pci/controller/cadence/pci-j721e.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 5bc5ab20aa6d..d6bbd04c615b 100644
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
 			dev_err_probe(dev, ret, "failed to enable pcie_refclk\n");
 			goto err_pcie_setup;
 		}
-		pcie->refclk = clk;
 
 		/*
 		 * Section 2.2 of the PCI Express Card Electromechanical
-- 
2.50.1


