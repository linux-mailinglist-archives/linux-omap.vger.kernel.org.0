Return-Path: <linux-omap+bounces-4405-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD4BB3B77B
	for <lists+linux-omap@lfdr.de>; Fri, 29 Aug 2025 11:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4575D188FA1B
	for <lists+linux-omap@lfdr.de>; Fri, 29 Aug 2025 09:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057493043CC;
	Fri, 29 Aug 2025 09:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eH/vodEB"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D9718EFD1;
	Fri, 29 Aug 2025 09:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756459808; cv=none; b=IyF3g6BZLmKBOFr2LkHUHKuoDF51ZXuJWRp8YbA6V6iMWb5Xbri3yGUXh9T2j2kOK88unDhcV4qz91YZ2R/AmCHwdwK6XtK2Fm1HP6HeqDerT9/It4YR4tgAWYdBwvBB6bimSqt3RgrO/+F14FbcBumsZ2AnvlLye+6SZ5lhUlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756459808; c=relaxed/simple;
	bh=TT9T5lG9+gsuQOm2NzoIkTWogrEPe1Zsi6wClKJfSqQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZbdRcwAlB/8PAREdYWWGZYl35GRCO/E6tBsCRZ9jKfRI3E6yn4Ln69OeoYJ3Vp437x2V7amFQ6F7ikPUixEQotsaFiNmjQW0ZEQIdHBP116NM1axq9GFV5Byrr2WeBWhTtRObEI0xph30NNF5MR9h4flTWUpi6LPJF4p7QLeR5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=eH/vodEB; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57T9TpVB2215089;
	Fri, 29 Aug 2025 04:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756459791;
	bh=yOppVATPr3tlgDESn44nzE3RrXCtLBtFluyyUCTAAB8=;
	h=From:To:CC:Subject:Date;
	b=eH/vodEBN0hveGodykIar4hqLdPGai3vuiqiv8v7WZEbuczRBMn+n8slt+rYRA15K
	 JfDf1xxrZhQWi5qI6qTLSVYdLRC2/Ivp3vXNFslQITh/SRD9RtH7ctqkvzlfc2PYqL
	 dF96DyaSliLoRxT9zD4CsyfKQjEG1wC31LxlKNH0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57T9TpmQ4125105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 29 Aug 2025 04:29:51 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 29
 Aug 2025 04:29:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 29 Aug 2025 04:29:51 -0500
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [10.24.68.237])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57T9Tmoh1850123;
	Fri, 29 Aug 2025 04:29:48 -0500
From: Anurag Dutta <a-dutta@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>
CC: <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <vigneshr@ti.com>
Subject: [PATCH 0/2] AM57 timer fixes
Date: Fri, 29 Aug 2025 14:59:45 +0530
Message-ID: <20250829092947.855974-1-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi all
This series introduces a couple of fixes for the am57 board viz.
1. Add DRA7 SoC matching to avoid probe failures for timers
2. Use DMtimer as clocksource to avoid using 32k counter due to
incorrect frequency.

logs:
https://gist.github.com/anuragdutta731/9366b4e582f7adb86e40ede1add1c79c

Sinthu Raja (2):
  bus: ti-sysc: Add DRA7 SoC matching
  arm: dts: Use DMTimer as Clocksource instead of counter_32k

 arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dts | 9 +++++++++
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi          | 2 +-
 drivers/bus/ti-sysc.c                           | 3 ++-
 3 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.34.1


