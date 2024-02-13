Return-Path: <linux-omap+bounces-553-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B01852E83
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 11:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 306D71F23911
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 10:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A7528E3C;
	Tue, 13 Feb 2024 10:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="QsLEftpN"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741842BD1F;
	Tue, 13 Feb 2024 10:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707821887; cv=none; b=LCE9qU2naI3bV2TE4+GzdFN/4qwuD74ccB4atD81g0Ykkq2QfmUl2qHnGIfkgnU73hIBVW2VqdrPSrzj3qZXyVDEP/Mppt4x68wj7qaIHYxiX32KDL0LX/fBIdWT/fxbwLk/I4m74g/ELq2BuGa3KlUyNidh1h+1fRo+6vksjSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707821887; c=relaxed/simple;
	bh=kopArpcuQCSouSpXenUUV3QRyUYrHiH511wLjUGnKcM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KHANHFwIFm42DeMy+nqvzHu5oYdYY9L02B7zRiSxh+Dx9hF5ljtqfpjILiHiicjP+q3r4WZpn3/54vX7okdp8tXhqpPOjErB0lH2l4+Q6VZY0CM9m5+64thPcs6KsRuK5MuIYQ28FFI8t9OaCONjNMxh44EInn6yOvj78zhAUPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=QsLEftpN; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 73A816058D;
	Tue, 13 Feb 2024 10:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1707821884;
	bh=kopArpcuQCSouSpXenUUV3QRyUYrHiH511wLjUGnKcM=;
	h=From:To:Cc:Subject:Date:From;
	b=QsLEftpNm5hTA2ZFPOMPQluWwFne0UEgj0UFlbihZprofxH+lxsa/PJMFFra5cpXM
	 T//i8NRgeZTm5iyB7JFR9TB00Je2liCMOuRxYlOId5KeMyBYaCZyj0lSpWzI4Kgvvv
	 +MeeBzPzxvXUZ5JUSXsnZDExwIbOlJog/JpWLZnlLkx7k3ObS1m+YIJH4LjAtI9L4x
	 rQwNoE57BmMTbiVlpmmxEwvjUeeJDA9kXpxrB0DD+n7YRNhZKMG4cHXNI6JUqQ/n3H
	 tDtFKJ8582pRGkJ6P15FMPvF50dkNwgflmlKJLlDAq99ACb1+LPO9bFGRAHCrF4IjW
	 5y4CrvtyeEIxA==
From: Tony Lindgren <tony@atomide.com>
To: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/4] Use reg instead of ti,bit-shift for clksel
Date: Tue, 13 Feb 2024 12:56:40 +0200
Message-ID: <20240213105730.5287-1-tony@atomide.com>
X-Mailer: git-send-email 2.43.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series updates the clksel clocks to use the standard reg property
instead of ti,bit-shift.

I'd like to apply these before we make further use of the clksel clocks
to reduce the dtb check warnings.

Regards,

Tony

Tony Lindgren (4):
  clk: ti: Handle possible address in the node name
  clk: ti: Improve clksel clock bit parsing for reg property
  ARM: dts: am3: Update clksel clocks to use reg instead of ti,bit-shift
  ARM: dts: omap3: Update clksel clocks to use reg instead of
    ti,bit-shift

 arch/arm/boot/dts/ti/omap/am33xx-clocks.dtsi  |  39 +-
 arch/arm/boot/dts/ti/omap/am35xx-clocks.dtsi  |  18 +-
 .../boot/dts/ti/omap/omap3430es1-clocks.dtsi  |  52 +-
 .../dts/ti/omap/omap34xx-omap36xx-clocks.dtsi |  86 +--
 ...map36xx-am35xx-omap3430es2plus-clocks.dtsi |  28 +-
 .../arm/boot/dts/ti/omap/omap36xx-clocks.dtsi |   7 +-
 .../omap/omap36xx-omap3430es2plus-clocks.dtsi |  46 +-
 .../arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi | 510 +++++++++---------
 drivers/clk/ti/apll.c                         |  11 +-
 drivers/clk/ti/clk.c                          |  71 ++-
 drivers/clk/ti/clock.h                        |   1 +
 drivers/clk/ti/divider.c                      |   5 +-
 drivers/clk/ti/gate.c                         |   9 +-
 drivers/clk/ti/interface.c                    |   4 +-
 drivers/clk/ti/mux.c                          |   6 +-
 include/linux/clk/ti.h                        |   3 +
 16 files changed, 491 insertions(+), 405 deletions(-)

-- 
2.43.1

