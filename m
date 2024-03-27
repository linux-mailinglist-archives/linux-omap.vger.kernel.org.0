Return-Path: <linux-omap+bounces-994-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6460688D761
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 08:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB255B21F41
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 07:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50CB32C190;
	Wed, 27 Mar 2024 07:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="jkgUg4Hm"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040D81849;
	Wed, 27 Mar 2024 07:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525160; cv=none; b=dMMaxGblvU8Pl5xrtAe6c13g6o++SGK/l5a+qa87/hSmdTB+RhIliER2nbqqg2ZEj4U3hR4Nc1LJMWiPRJ6iozHLA6c++8R5mojSoLyMt+jv+RA8BypM3tJ/uSDEKgoTcWpi5cvQM1H7JUOzJ+ES3yyO+36ElkYmVpLTYQIjMc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525160; c=relaxed/simple;
	bh=EEZSlhT90UtM8HmwTRBmhcb8ZFjnn4FjOgqSe3XDvUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PoI2NrrfruQcezDICGs4+L7JjT7QzUSsqrdy73WFXkSsQ4GYxBH76z2OLWQVoSkGJe2q3KxPnz5HeLcdfSBQqbmxPXOh636j77hcyuT3cUBcU9ScINu3T56yR21E/ZU4PGw0UM4h/fue0qTfKxP3O1vrs5p0tjtz9AE01khayqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=jkgUg4Hm; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 7447460434;
	Wed, 27 Mar 2024 07:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1711525151;
	bh=EEZSlhT90UtM8HmwTRBmhcb8ZFjnn4FjOgqSe3XDvUQ=;
	h=From:To:Cc:Subject:Date:From;
	b=jkgUg4HmeTFCs7Bq8RTMdyNuhsh4Sy4JPCfMtp94CtLdyUJJjJQGWmhKw6NaPxQn8
	 o63ATQthNid5VddMSsZEuB7R8H/HI4DfGcizXdYsuOrewYu/I9jrDcHu+4HIP6T9iE
	 fSmNZA6u+eF/exB9iphAQS/dj7mcNOpphPqGzhJQdRHfWMtwA4DW2PkdFlZBnbykzM
	 JoCqQn14f0M90J4JsE6um9VIzrRRo7OwfP3PI4ko+ds30uv3Wi07kIii9uxx2bQMpG
	 ea2LHjZbA9IgXDsJufxv+kT1hej2uFM8nGGmT76q7hdk19MmrC57xbo84xmyluO/sF
	 acC18YHKKBDTg==
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 00/12] Use clksel for more clocks for dra7
Date: Wed, 27 Mar 2024 09:38:44 +0200
Message-ID: <20240327073856.21517-1-tony@atomide.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series of patches updates dra7 to use more clksel clocks.
This simplifies things for dealing with the remaining make W=1
dtbs unique_unit_address warnings.

After this series, dra7 is left with the following clocks that
should be updated:

- DPLL output related clksel registers that should be updated
  to use clksel clocks to get rid of the remaining warnings
  for unique_unit_address

- Read-only clkctrl clocks still mapped as composite clocks
  and should be updated to use the clkctrl binding to drop
  the use of the custom ti,bit-shift property

The DPLL output clocks are problematic at this point as the
clock driver makes assumptions based on no reg property in
_register_dpll_x2() for the ti,omap4-dpll-x2-clock. After
the driver issues are solved, the DPLL output related clocks
can also use the clksel binding.

Regards,

Tony

Tony Lindgren (12):
  ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_CORE
  ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_DSP
  ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_IVA
  ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_GPU
  ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_DRR
  ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_GMAC
  ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_EVE
  ARM: dts: dra7: Use clksel binding for CM_CLKSEL_CORE
  ARM: dts: dra7: Use clksel binding for CM_CLKSEL_ABE_PLL_SYS
  ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_PER
  ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_USB
  ARM: dts: dra7: Use clksel binding for CTRL_CORE_SMA_SW_0

 arch/arm/boot/dts/ti/omap/dra76x.dtsi        |  63 +++--
 arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi | 270 +++++++++++++------
 2 files changed, 220 insertions(+), 113 deletions(-)

-- 
2.44.0

