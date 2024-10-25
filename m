Return-Path: <linux-omap+bounces-2488-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8AB9B0A43
	for <lists+linux-omap@lfdr.de>; Fri, 25 Oct 2024 18:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E44D2855DE
	for <lists+linux-omap@lfdr.de>; Fri, 25 Oct 2024 16:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D26200BA0;
	Fri, 25 Oct 2024 16:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="yNDRoj5u"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5315E320B;
	Fri, 25 Oct 2024 16:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729874888; cv=none; b=r9TssbMM3lgzp+qdXmLdRgFDB8NYTveADQqCXpBrDI2wERuzu3/LxPUA0l22ySte6soDcPfvTou4RYVOoHDg6bW+lv7PCuU76E50NqqNaY+bgHgwx648ol24k4ikmllLDBoi/fkkow0ScRdo6T9L/hRqv0T1CD31WNtyIo/vAGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729874888; c=relaxed/simple;
	bh=fVwzm4P5u07Hy8LlHj9Q2nmSI8l8tWAh/hqvlTS2Mt4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J8sPuX7dN0/2/IrHKgFBBvaNgoIh9Vzqrv9c2qcY/t+hITG0QlmMJlEBwKT01wIeLCL1FOZ//tx1lHPpPp8pYkAVJGr4V6DfE32gs0DUwU66YUeGQJyrHcQFyeMZTDdI5NGe9BGamzwON2vYTN19IhKEQqww4cp6JJAI0xzON+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=yNDRoj5u; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=QW/HkjmGFO/yZTAr6biSTVRn2MsrB/6XGGTE9/qU0pM=; b=yNDRoj5ukF9rhdBiTREMO05QCt
	PbeBZiI9TbuuKyl2NIrPbdDVNtWbJJpL9Aft2QeLrKkzgPtkJ94MCLOJS+6L2CGalyfc+y+f/ku9d
	Ln5ar3RBNz6XkjbWoOaSexnJN2DR7PPjqcqxd4t7SB2BduSu5kCSQ4c9vnBuyTRWbllcRHJjvLAsx
	yFP8yUa1HtFQlPwM6KpQuG2V5A2qCmpCCLvTkqlybBf6jQHQRTSTFaHFxeK1cQLCigsbi3Hy0kVkI
	jVeaiLzwxRX4OKnX500b3k3ityraPH+jarueOZPZYQMOxfExmPCxHIvOnz8WexeClTM1IilaA+VyA
	c82yjoFw==;
From: Andreas Kemnade <andreas@kemnade.info>
To: tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Roger Quadros <rogerq@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ARM: dts: ti/omap: dra7: fix redundant clock divider definition
Date: Fri, 25 Oct 2024 18:46:22 +0200
Message-Id: <20241025164622.431146-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clock specifies ti,dividers as well as ti,max-div. That is in this case
redundant and not allowed by schema. Both specify possible dividers of
1 or 2. Remove redundant definition.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410252030.8B2JoTuq-lkp@intel.com/
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi b/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
index 04f08b8c64d2..0de16ee262cf 100644
--- a/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
@@ -1376,7 +1376,6 @@ optfclk_pciephy_div: clock-optfclk-pciephy-div-8@4a00821c {
 		clocks = <&apll_pcie_ck>;
 		#clock-cells = <0>;
 		reg = <0x021c>;
-		ti,dividers = <2>, <1>;
 		ti,bit-shift = <8>;
 		ti,max-div = <2>;
 	};
-- 
2.39.5


