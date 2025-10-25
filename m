Return-Path: <linux-omap+bounces-4767-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2476DC08D8D
	for <lists+linux-omap@lfdr.de>; Sat, 25 Oct 2025 09:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADD891C8757E
	for <lists+linux-omap@lfdr.de>; Sat, 25 Oct 2025 07:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3A82E5B11;
	Sat, 25 Oct 2025 07:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8WUl0bw"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1230B2E6CA7
	for <linux-omap@vger.kernel.org>; Sat, 25 Oct 2025 07:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761378241; cv=none; b=qWfYvNIenqT8vtwKD+AUPx1QUVY7cLhpf7KcaZBsqThGe/SV8AUc0bVFW5Z5N62bIOD9jJsBoTsAuXg3OsB/0SvKGFolTDwz6jX3E6IVMWTBYWEc01nfWiMPR/mxkXjAFQZJktpBifFhmkJYVRWqEErEGHZR//WYdj3nzMeW8nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761378241; c=relaxed/simple;
	bh=m/7BPONg68GpSItsiRmhbTDWbchfGgM+P5xwH8qJZCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+B0wqpOJjN2BCTdX6HEPfj/wGgcXtrMTm2GrpSGSwsM2jhy0KhPmgNrjezwfwiM9Y04mmtGFxfnrxEAtspqeWj4uzMFgyOUY1Jtxmg5c48s8BC+m+J4TrUn0IkQRIYuTtzSXJAm61joP7CzP6KZ20BabPzpcwYaKHyFZY+xf9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8WUl0bw; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-79ef9d1805fso3175916b3a.1
        for <linux-omap@vger.kernel.org>; Sat, 25 Oct 2025 00:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761378239; x=1761983039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAWi08Lab8Pg0FL7IYkK8ydZGRVaUiT7SC194s0JYPE=;
        b=G8WUl0bweiBaj+0V7YRznPlhSg894PknHJWVabF96EwMPVkqNeBdduYijeN/b5inIp
         rEtn2R8oykoCgzKs1p7b/v6cDpHhcZP65DWNOQwaxyN8wUh2z0r3f6uSRtfe3qnZpVAb
         IRAa0gZKhqUADh7vy/Xh1T1gOb95TkCNHqM+tNj4/76adUzK+d7o70e4WcygVpL5j+YL
         976nOJZrQB6eyPiD+SGw+OlpCVWftyZJa9QBNCojEONZKB3yhPRwnl/z7r/OIvrhxHV8
         ts2Cam/1bpQ2S2R8QEWE7UAEdSzbui2vDoKjT2VFFSzKSjOD8i+s+sbenbTmvVWfZELQ
         axgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761378239; x=1761983039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAWi08Lab8Pg0FL7IYkK8ydZGRVaUiT7SC194s0JYPE=;
        b=k2FsJ1jimLMejwCoY9Oo+WRxUAkR9+S5P/9uqbtcvHWwLhZNBPMlhb2pCApOKGHcxC
         0TnF/SS13LmR3oN5yewbg4nyeZuzt7tEa87wDhPk5B0Vhw1z+xglV6/dWb96dPAg28lj
         rlbih7TOxnNlOk47bgSt//OEGapjjMO0w6N5bryhAvbzRn3I56ZPH3LXGjZgmIns8LgZ
         WKoeA8sishcYWWU6cuWVvxOpJDwWALJR8bEe8hrShS6qvc5Y+h6CLk11wkylNxY8HX8+
         Ulm3mC4uwrsz81TOx/fW/CRaLewsz7Nn2DG6iPlof9J4OT1axwQsjw1I3Gq+BLxIe8IR
         glzw==
X-Forwarded-Encrypted: i=1; AJvYcCXmBs0+mGH2b1WlZY0qOV1+FvGSvpiEs1wJneUbI+bv5HNmXdX0s5nP3AVLWD4Y93NMYno4UEjWglhl@vger.kernel.org
X-Gm-Message-State: AOJu0Yynbl/i+XxsshaFnVxhaZPPDqaTYylysbGk9RPL3yBq8ixchbEA
	y83zDzmY0fFjW+ASLdOgE4QI3/CtZaEcw2spOQGqRgLaB2J7H4dpT91n
X-Gm-Gg: ASbGnctMD830+HjzrkW+lHBw1DJJ0egjafiCsfXIN5jMpubxdENSRDte6A4uBAJkdcR
	lcosR5QWCxiWe4fUKKtrJrALK8O0gjxmWarYIOw/QciMsF7myM2u9fbefNFmuT+OOXHD44Y6q2K
	c1J8b3s8LEKkc0gcZNkSTRJXCj9tCADy5crtMm2FAWVmlEXpWFFvhHSaG6mOWTzxgrKSpcHBiVj
	isJaKnefwInRFavp3L8GkOTyEJzZ8H3fFg2IRs4jgQkArTy/8Tl1Ru49/vkt92VAShNhZfXcaiM
	LFBEH6BwseWTiDqBVfTbnnxN2N5x3sg3KmQ7rgMN8A4QHUlUFtbKrlZ8sctC+R6WFHYXNcW54Dp
	p45NsPYU340Qu3oajWU4B3q/LKwYd4c7LQq/tDo6uHFHcWGkw1WrSkG1QQwXoT1+tJz5Sfm5LUW
	UeYDKyb3lrNJinQOZ4z2U=
X-Google-Smtp-Source: AGHT+IGHRGT9hB86/YyYWO+q0YYgQ20bBMxTaREfTvNN83eWQaMSQ0mxbxIpiJAX3TL83FC5ARBuiA==
X-Received: by 2002:a05:6a20:1590:b0:334:b732:6e5c with SMTP id adf61e73a8af0-33c600a5574mr9633829637.13.1761378239355;
        Sat, 25 Oct 2025 00:43:59 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41404d760sm1395083b3a.39.2025.10.25.00.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 00:43:58 -0700 (PDT)
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
Subject: [PATCH v2 2/2] PCI: j721e: Use inline reset GPIO assignment and drop local variable
Date: Sat, 25 Oct 2025 13:13:32 +0530
Message-ID: <20251025074336.26743-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251025074336.26743-1-linux.amoon@gmail.com>
References: <20251025074336.26743-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The result of devm_gpiod_get_optional() is now assigned directly
assigned to pcie->reset_gpio. This removes a superfluous local gpiod
variable, improving code readability and compactness. The functionality
remains unchanged, but the code is now more streamlined

Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v2: fix the commit message.
v1: Add Rb - Siddharth
---
 drivers/pci/controller/cadence/pci-j721e.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index b678f7d48206..633fe8f93102 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -477,7 +477,6 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 	struct j721e_pcie *pcie;
 	struct cdns_pcie_rc *rc = NULL;
 	struct cdns_pcie_ep *ep = NULL;
-	struct gpio_desc *gpiod;
 	void __iomem *base;
 	u32 num_lanes;
 	u32 mode;
@@ -589,12 +588,12 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 
 	switch (mode) {
 	case PCI_MODE_RC:
-		gpiod = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
-		if (IS_ERR(gpiod)) {
-			ret = dev_err_probe(dev, PTR_ERR(gpiod), "Failed to get reset GPIO\n");
+		pcie->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+		if (IS_ERR(pcie->reset_gpio)) {
+			ret = dev_err_probe(dev, PTR_ERR(pcie->reset_gpio),
+					    "Failed to get reset GPIO\n");
 			goto err_get_sync;
 		}
-		pcie->reset_gpio = gpiod;
 
 		ret = cdns_pcie_init_phy(dev, cdns_pcie);
 		if (ret) {
@@ -616,9 +615,9 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 		 * This shall ensure that the power and the reference clock
 		 * are stable.
 		 */
-		if (gpiod) {
+		if (pcie->reset_gpio) {
 			msleep(PCIE_T_PVPERL_MS);
-			gpiod_set_value_cansleep(gpiod, 1);
+			gpiod_set_value_cansleep(pcie->reset_gpio, 1);
 		}
 
 		ret = cdns_pcie_host_setup(rc);
-- 
2.50.1


