Return-Path: <linux-omap+bounces-4668-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F3FBD283D
	for <lists+linux-omap@lfdr.de>; Mon, 13 Oct 2025 12:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 190D44EFF89
	for <lists+linux-omap@lfdr.de>; Mon, 13 Oct 2025 10:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC8B2FF14F;
	Mon, 13 Oct 2025 10:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajHd53Uu"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8796D2FF177
	for <linux-omap@vger.kernel.org>; Mon, 13 Oct 2025 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760350674; cv=none; b=OdGMRyLnZuRV48gLfrbq6Jw1T7+m6M2g7wvqtzaKWILcwWFpjWauhzEEVr9oCIfmS3tYwB4yJpIrh1mPN2bPfHPmL1GtghDSJDtS+J0QZrpluJu3nGBQ63AMxvmqaLCBGYpj+hIFxdaRvW/1AgARktg1ZUEa9m4gcUdxYTPPRr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760350674; c=relaxed/simple;
	bh=gNh1Q25ZNGRtB3EJ1DwzkXZengb0FpJ74GxfaGXFVu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TfmAXpH2uNt6CmOCCUGs5xtqRWuRdr09M4JRoVA0p70stNAH/1C+87ijGGr9ql93s7DQ2L9QJ+WvBkXEHSiwobQEKf7k2Rrh/r20K0E05UMFql6MIupmYsqMrJ7vXyxapip2u7XAOOFfS+MQGXH5Rqs68Rq2+36SekWE7gsmesU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajHd53Uu; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-33274fcf5c1so4282839a91.1
        for <linux-omap@vger.kernel.org>; Mon, 13 Oct 2025 03:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760350671; x=1760955471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19kHdtY5ZhpAxDQMVT/2nG/beuKDqoa8OjmMddMbQbE=;
        b=ajHd53UudJG9M7Br4Ob6S4j01SwITX8ETUlwysJE9vrgDAva67AoEdTzmOOyypBe4Z
         0500bfcaRTIOo5/VQ0h231a8WJZVJu1lrZOQ2uCEv07RQKH/fFkh2Se2ifBPDYGe42Qt
         GXDbCp4iJQbf9gePk2Lp9A/6/EljtPvW5iSBEvrSUwvl3t+AxujQ1Ox2TsS6LtkDqEeL
         uqAWH29HRRrB2sGVoQv0CLC10xr/4yq1UNa+7vEmu4oENc2q+NFKoaLFPt39FzIDx5ON
         T90TmL7kTXu4EuZ/Poy9LKfE2rXeK6XjC4O8THgAdcWaRKYIPpEzDX2iZ5H7F0ibIA4Z
         sWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760350671; x=1760955471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19kHdtY5ZhpAxDQMVT/2nG/beuKDqoa8OjmMddMbQbE=;
        b=L4b0M2CkFsHyPdltD9kAsoC1bkwAFvmy/Hg4LQRZgbnCIySxWnRX9ZQhXcCr6s6QZe
         klWrU+U8nlPs4njZwRm3sRrPrYLYMUeUkxwPMmk8rCGK3rfxXkVqg+sybqZXhki1s+G8
         4dpz7/m0yWHID1eCIjvFF4WI8Ol3/8m62hS1U5aBz3m99BQnhRbDHxRi+Cbw2SMeraaA
         xtkazu7Cl2dbUF++VzwXuzFR6LiEl84VzO0ojn2B2OzH2p/SUj52qi4QGcLdXerCZzMu
         0b/Jp16HIrGgUPmEHVHBC1l4/LdsKhEX4B+gjKMT43/HaVdk5Zh8wpEP0M1B9t4YtfM0
         8O6g==
X-Forwarded-Encrypted: i=1; AJvYcCVNI0edX0B1ATO9lNFuacns7D1/Wbkr7DbuRv9MfVAxVNOjrOjH1V32q7CkNJW8fA8zgsx8ckKA56hE@vger.kernel.org
X-Gm-Message-State: AOJu0YzsvhIzlXFfAPiYi9iabMexUofk7+qnJWXkhiH9zWuVBJ9eoKLu
	gpLHQ+D6vcrXvuvEOijX8EBYfJDDhp5CwogPbUTSUbSmD9Ni0G2UmpqJ
X-Gm-Gg: ASbGnctZUdrkirI/f9qQpGkDLCmrNY04vnJbEuSzv/ra0aYwwvhsxfC7zwDdHIex+Gf
	ejciwc0PaotSxvxTFxjO27tMm95bWDXbGVT0CfPgC1TStF/M4cpwkWvLjxgn7pT+OMuN0y5im+f
	5ybfOdXx5evM/vDKYNdSMm5b/FzWUWcD/W2AeQ1SHm6aHwxujiq1hjsLE9aS6wY/BZFX8yrsjiq
	pzXtOOAq6qCHVDJDUBYR3Hi7Jv9DSXpo9FcCuPPZud9teBq7JX/AywWkjPUwYVN6daDxaNtpD4F
	aq23Q19PoaY4K8mTzOFhIY4v27JkFfa0zq5XKRvbnCOsvs+cI11j29Ys3MYCgTzpg+GL5x1+A7P
	V5vB+7089yTlNHYxXVIkrXeqClF8cucVZ3CnSMoAB+bbtSgMiCw==
X-Google-Smtp-Source: AGHT+IEyZirSf3fnKNnVB5Ye7lidBycAPJF9I2FEB25F5npassyZdVGtvN5Z0VaAFP1R3FsWO44BJg==
X-Received: by 2002:a17:90b:4990:b0:338:3b73:39ce with SMTP id 98e67ed59e1d1-33b5138e3a7mr27708156a91.25.1760350671380;
        Mon, 13 Oct 2025 03:17:51 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b52a5656dsm7422864a91.11.2025.10.13.03.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:17:50 -0700 (PDT)
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
Subject: [RFC v1 2/2] PCI: j721e: Use inline reset GPIO assignment and drop local variable
Date: Mon, 13 Oct 2025 15:47:24 +0530
Message-ID: <20251013101727.129260-3-linux.amoon@gmail.com>
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

Change removes the unnecessary local gpiod variable and assigns the result
of the devm_gpiod_get_optional() call directly to pcie->reset_gpio.
This makes the code more concise and readable without changing the
behavior.

Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/cadence/pci-j721e.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index d6bbd04c615b..1ece4b183dfa 100644
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
@@ -615,9 +614,9 @@ static int j721e_pcie_probe(struct platform_device *pdev)
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


