Return-Path: <linux-omap+bounces-755-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA10786A880
	for <lists+linux-omap@lfdr.de>; Wed, 28 Feb 2024 07:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73C892892C5
	for <lists+linux-omap@lfdr.de>; Wed, 28 Feb 2024 06:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0639122EED;
	Wed, 28 Feb 2024 06:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="CYVKp22i"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8181021370
	for <linux-omap@vger.kernel.org>; Wed, 28 Feb 2024 06:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709102816; cv=none; b=HgVyklCDUUwqOp0JZi2xvukowFdX6jlNGOhOlZqm2IkyU068fWJ9yQonlSAaOZ2gki6pjmZnWjDLLtAwra0e5kyejjO2xlARrqy+/9xcVe1PqEWnOz758R82zR29F66cYRKSvFpEhvh4Gx0cqjHSJi4p7JiEORwn5TxrSSJGxIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709102816; c=relaxed/simple;
	bh=9ubBFJomTelFQYCNQDlraKNfLFIZTTOeZiEYzjEs5/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T2JqPgAvMBg86FlOKbQXwZlM7MSaXDu8ApBB7ZeHLUf8eM5mJJqMUQ2nJldqh4A2XdaZRazlA6tW1ZwogHb2Dz3xwJAZlgU/UZhji/FRis942NPigB60p4xEXMOLT4/0UlA0bPOvwyqLch/yOCc3vVbWQeUJYvXr808BtmXDKas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=CYVKp22i; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 64A16604A0;
	Wed, 28 Feb 2024 06:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1709102812;
	bh=9ubBFJomTelFQYCNQDlraKNfLFIZTTOeZiEYzjEs5/8=;
	h=From:To:Cc:Subject:Date:From;
	b=CYVKp22iq/u04cldd8iOMU8t5si9xc8kkOwSYH+nMT8edRNzV7pDXk/3hkggm4TZX
	 /a4P2X8D6ryem9ltkJAadUPPZOGKyB3eYZIc4R94GEF6M12stCSy7dSXY1eKmhff3d
	 IGyK+KcLNS0BgOK7MPOJDUnAADAbr13ySkdIFd61CWPy4YN9SfiK82bG4VaFfbDcAZ
	 TrcHu2y8RyVpZXvzWIh4XnDdJQ5ht8UKVVr3WC6ewTgFy3bEgul0iTKIr3LIrxkFGo
	 1AN6aiD7dZQrfDCRxjWPcGb1UU2QuNjPt/SpH6TEpzd04ipG6NqSm/JVNRv6xTIsyR
	 C+oa6f2hpyvWw==
From: Tony Lindgren <tony@atomide.com>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Devicetree changes for omaps for v6.9
Date: Wed, 28 Feb 2024 08:46:38 +0200
Message-ID: <pull-1709102762-376748@atomide.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.9/dt-signed

for you to fetch changes up to 391b3e9abe4423b79a904ac9de3fe7f17914a746:

  ARM: dts: omap4-panda-common: Enable powering off the device (2024-02-26 14:00:04 +0200)

----------------------------------------------------------------
Devicetree changes for omaps for v6.9 merge window

Few device tree warning fixes, updates to use https links, and
add system-power-controller property for omap4-panda and
omap4-epson-embt2ws.

----------------------------------------------------------------
Andreas Kemnade (2):
      ARM: dts: omap-embt2ws: system-power-controller for bt200
      ARM: dts: omap4-panda-common: Enable powering off the device

Nishanth Menon (1):
      ARM: dts: omap: Switch over to https:// url

Romain Naour (3):
      ARM: dts: ti: omap: add missing phy_gmii_sel unit address for dra7 SoC
      ARM: dts: ti: omap: add missing sys_32k_ck unit address for dra7 SoC
      ARM: dts: ti: omap: add missing abb_{mpu,ivahd,dspeve,gpu} unit addresses for dra7 SoC

 arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dts              | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dts              | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dts              | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-baltos-leds.dtsi               | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi                    | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-base0033.dts                   | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi               | 4 ++--
 arch/arm/boot/dts/ti/omap/am335x-cm-t335.dts                    | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-evmsk.dts                      | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-guardian.dts                   | 4 ++--
 arch/arm/boot/dts/ti/omap/am335x-icev2.dts                      | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-igep0033.dtsi                  | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myc.dtsi              | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts               | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-nano.dts                       | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dts            | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dts            | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dts            | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts                     | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts          | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts                   | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-sl50.dts                       | 3 ++-
 arch/arm/boot/dts/ti/omap/am437x-cm-t43.dts                     | 2 +-
 arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dts                    | 2 +-
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts               | 2 +-
 arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts               | 2 +-
 arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dts                  | 2 +-
 arch/arm/boot/dts/ti/omap/compulab-sb-som.dtsi                  | 2 +-
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi                          | 2 +-
 arch/arm/boot/dts/ti/omap/dra7.dtsi                             | 8 ++++----
 arch/arm/boot/dts/ti/omap/dra74x-p.dtsi                         | 2 +-
 arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi                    | 2 +-
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts               | 1 +
 arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi               | 1 +
 arch/arm/boot/dts/ti/omap/omap4-sdp.dts                         | 2 +-
 arch/arm/boot/dts/ti/omap/omap5-igep0050.dts                    | 2 +-
 arch/arm/boot/dts/ti/omap/twl4030.dtsi                          | 2 +-
 arch/arm/boot/dts/ti/omap/twl6030.dtsi                          | 4 ++--
 39 files changed, 46 insertions(+), 43 deletions(-)

