Return-Path: <linux-omap+bounces-1292-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1558E8B1A0A
	for <lists+linux-omap@lfdr.de>; Thu, 25 Apr 2024 06:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB844282CBC
	for <lists+linux-omap@lfdr.de>; Thu, 25 Apr 2024 04:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8197D39AE7;
	Thu, 25 Apr 2024 04:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="g0mgFA3G"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6921139FD3
	for <linux-omap@vger.kernel.org>; Thu, 25 Apr 2024 04:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714020752; cv=none; b=RSpWw1XYWaoL8y8QCDW013Al+DhdMccrKjBUxpHHUjg7sKJoJi9ITZvmJFIejLYnjEgevwg6DB4sVyEKuaB6f2GQZxfBSukXTbYmpOD9WjagHRsM8Y6EVSrYkomMbRYhgTnPdy9bL7pqqFzvJFUrZYAk7ulIe0winEaML3LDUdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714020752; c=relaxed/simple;
	bh=pKxM3kug+6FaG53pNZPx1vcG2su9BKkq9n/vgd6jrCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oy2lg8yXtqfFLXhjwcrMEk7XH9CmXjtZVdsz3/ySweRC05nM8hKUHOibcMaE5mSXrVi6FMNKn40YhVr1bNuD0lApnB0sXkaLJobRqY8JkPABAKdlR2+79K2PZcZU3sBFPL4nYyM/dAif8X7bTKYOgidIMtN/cmpDs3lRkMEc7ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=g0mgFA3G; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 111B56054A;
	Thu, 25 Apr 2024 04:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1714020247;
	bh=pKxM3kug+6FaG53pNZPx1vcG2su9BKkq9n/vgd6jrCE=;
	h=From:To:Cc:Subject:Date:From;
	b=g0mgFA3G24Afpq5sNBMk/9N0QpWr0aV+DpH+/1TB3chGYKQLvFq5T+lAfmu+jGOKg
	 /8IP+zN4ui/CJf7wsyK27aaXXchQNr9flJ9rig7/AMhgp0XEcbD9Kz3JIlhkNz2Nz2
	 f8l9EDX6L6PXDyG5fC3U42JpoWQMdDWElMWg5BPBo4HF2N+KZ5zEa4MFHMpJElfiNL
	 deM4sz3dMCFUprrtLD6BVDl4gb2TH0aYBvQkJkTag8JVM3pD92DRoh0XztfqThUFlc
	 SYoC5AOwVSzZJ64A4z5xNamij/PC+5Kx0G3bKdMCtlkKwioX1/XB+ct3EX00KAsANg
	 lAE88RilLYUpQ==
From: Tony Lindgren <tony@atomide.com>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Devicetree changes for omaps for v6.10
Date: Thu, 25 Apr 2024 07:43:36 +0300
Message-ID: <pull-1714020191-304166@atomide.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.10/dt-signed

for you to fetch changes up to 32f4c19f6a52bdfa6ec73a067b6e7382b8d6653e:

  ARM: dts: dra7: Use clksel binding for CTRL_CORE_SMA_SW_0 (2024-04-10 09:15:54 +0300)

----------------------------------------------------------------
Devicetree changes for omaps for v6.10

Update n900 charge limit, and make use of the clksel binding for dra7
for the clksel clocks and other dpll output related clocks.

----------------------------------------------------------------
Arthur Demchenkov (1):
      ARM: dts: n900: set charge current limit to 950mA

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

 arch/arm/boot/dts/ti/omap/dra76x.dtsi        |  63 ++++---
 arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi | 270 ++++++++++++++++++---------
 arch/arm/boot/dts/ti/omap/omap3-n900.dts     |   2 +-
 3 files changed, 221 insertions(+), 114 deletions(-)

