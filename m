Return-Path: <linux-omap+bounces-754-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBCB86A876
	for <lists+linux-omap@lfdr.de>; Wed, 28 Feb 2024 07:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EFD31F23D5A
	for <lists+linux-omap@lfdr.de>; Wed, 28 Feb 2024 06:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8EE92263E;
	Wed, 28 Feb 2024 06:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="G85+NW1l"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C8236B
	for <linux-omap@vger.kernel.org>; Wed, 28 Feb 2024 06:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709102466; cv=none; b=CWw374rOLyn+ROIcAzWoocA3cvTL2cZx768tASkQyUJuWnAhYO2tTW4Fhft4Ua1TyDpCZ0N9gM29e7d0pfbEfK5c/7YiXKz1IHXOT+YbapZsi+UYDI8IrMVW+r5wn7oPzXfM+v4Sb+h/xj4y0OM6wVyn8f1tc8FRDlhYUwYgTwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709102466; c=relaxed/simple;
	bh=TPfI/lcDNrhg6PzKe8s3nQTlVd4svZedNDUy3gcY8/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=loBpSgGvHl0VYHfARPbaHPRv1zsdcOTNdyzZ3eHEKRo+0zqGE6+vrZDdQLy79gQMTb+H1d8Tbg6S6rk/+ZCa/cMh/8O6/9pKCVBwSpM7sLrD7+OfRd4jE4WxK78jigfaRC+AHtnkmX6n5gLxwi0shx/KVVhc548YZtO7KmKpWik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=G85+NW1l; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 8F5B3603C6;
	Wed, 28 Feb 2024 06:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1709102464;
	bh=TPfI/lcDNrhg6PzKe8s3nQTlVd4svZedNDUy3gcY8/E=;
	h=From:To:Cc:Subject:Date:From;
	b=G85+NW1l51Wc1JyZ2knuyM0kH72Mb/9pp0n7VuBDVTlXdHQY5nEQ9963y7Sh4soXx
	 n0coT7mJs/YLnStlViIFM/KMCG62GhpbA4IT4g//HvoOupDDuJUQA4as6C83MNKtWP
	 /AxHCMDmU9ArWg3J7unynG4u0ET7DZQK5tSKBnuKBx/2vcN/E2UAd27eIwZNkoQtF2
	 ZViPdmJtN7OehmzTE4ykOZCM8MY4MhE9uIqYimglMwrgMIs0/+CQGNSf9JHRpYRcyZ
	 uRXbuET0L6GIuRyFnECnywPh6TUC0uUxD+0OkRM38b9NZatwAKkJbaaCYh0nZztM1J
	 LfPBnpRdv992w==
From: Tony Lindgren <tony@atomide.com>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Update TI clksel clocks to use reg
Date: Wed, 28 Feb 2024 08:40:47 +0200
Message-ID: <pull-1709102378-94138@atomide.com>
X-Mailer: git-send-email 2.43.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.9/dt-warnings-signed

for you to fetch changes up to 808e65304d1844aa4a0ab317ae1d36f9ab6da174:

  ARM: dts: omap3: Update clksel clocks to use reg instead of ti,bit-shift (2024-02-26 13:08:45 +0200)

----------------------------------------------------------------
Update TI clksel clocks to use reg

Updates for TI clksel clocks to use the standard reg property instead of
the non-standard ti,bit-shift legacy property.

There are still lots of TI composite clock related devicetree warnings for
missing bindings, and overlapping reg properties. We have grouped some of
the TI composite clocks under the clksel clock node, but did not consider
the reg property issue. Let's update the existing users before we continue
grouping more of the composite clocks.

----------------------------------------------------------------
Tony Lindgren (4):
      clk: ti: Handle possible address in the node name
      clk: ti: Improve clksel clock bit parsing for reg property
      ARM: dts: am3: Update clksel clocks to use reg instead of ti,bit-shift
      ARM: dts: omap3: Update clksel clocks to use reg instead of ti,bit-shift

 arch/arm/boot/dts/ti/omap/am33xx-clocks.dtsi       |  39 +-
 arch/arm/boot/dts/ti/omap/am35xx-clocks.dtsi       |  18 +-
 arch/arm/boot/dts/ti/omap/omap3430es1-clocks.dtsi  |  52 ++-
 .../boot/dts/ti/omap/omap34xx-omap36xx-clocks.dtsi |  86 ++--
 .../omap36xx-am35xx-omap3430es2plus-clocks.dtsi    |  28 +-
 arch/arm/boot/dts/ti/omap/omap36xx-clocks.dtsi     |   7 +-
 .../ti/omap/omap36xx-omap3430es2plus-clocks.dtsi   |  46 +-
 arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi     | 510 +++++++++++----------
 drivers/clk/ti/apll.c                              |  11 +-
 drivers/clk/ti/clk.c                               |  71 ++-
 drivers/clk/ti/clock.h                             |   1 +
 drivers/clk/ti/divider.c                           |   5 +-
 drivers/clk/ti/gate.c                              |   9 +-
 drivers/clk/ti/interface.c                         |   4 +-
 drivers/clk/ti/mux.c                               |   6 +-
 include/linux/clk/ti.h                             |   3 +
 16 files changed, 491 insertions(+), 405 deletions(-)

