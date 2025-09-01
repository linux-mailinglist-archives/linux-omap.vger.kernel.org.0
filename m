Return-Path: <linux-omap+bounces-4432-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A10F9B3DFE2
	for <lists+linux-omap@lfdr.de>; Mon,  1 Sep 2025 12:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FDA7178B53
	for <lists+linux-omap@lfdr.de>; Mon,  1 Sep 2025 10:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF9B301493;
	Mon,  1 Sep 2025 10:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QA3NRp8a"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483901AB6F1;
	Mon,  1 Sep 2025 10:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756721747; cv=none; b=kfHKEhmyBBC4/dYYpDtmTqNMmUtflRMr+rXDcgVMNt2h27odg7F7tX4IU+feNXGn6vQvQhihBCPOxgfXDXxUXApiOuMe9nXhT6KSMSY7yQgV12bo3E6IaMQJt609u/wAHGmIfG151nAAOzJdFavS/gb26nS+7af/o1X3xsz2uVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756721747; c=relaxed/simple;
	bh=jOcRK6379zTJfEh897Z9q5lHmAZiy5/QlE4nfFHAOTE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i+9Pn+cdP6PBIJPSpf48bQ9cnHVdEJw5Ei2JXb/GFNsZyB0nZ6Ky8FnjsNK43SrxZ7EWsvcoWFS4fwgjLX5H+wvr6h4D7q3yO1iseSoEq7LVK8utFONIjzVeNw1AocY2bWweRW6+HipbAV3ZCWkTNuwoRoNxtvCj6PGrGAvZfJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QA3NRp8a; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 581AFTdC2293495;
	Mon, 1 Sep 2025 05:15:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756721729;
	bh=iHiF28Jb+6m7hdcjEM9alaxSTeWIxEGd2Xv92zrZtJ4=;
	h=From:To:CC:Subject:Date;
	b=QA3NRp8a/Zzst4gQ5MA20xx+Bk5+xyjfnVMd8zAtBnSD9vfxIJCQKx6sXPaeCPgrI
	 B6kPFzLNZm0BinydFYEq5S/1KmrEODyVdYmBu7nJfSGeqtmHIyI3JMhMlP/RqekbrM
	 WULXDK22ybRboUwHdtbZepSmgF8ZxY+yVL671x5o=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 581AFT871475706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 1 Sep 2025 05:15:29 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 1
 Sep 2025 05:15:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 1 Sep 2025 05:15:29 -0500
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [10.24.68.237])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 581AFPrY2047319;
	Mon, 1 Sep 2025 05:15:26 -0500
From: Anurag Dutta <a-dutta@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>
CC: <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <vigneshr@ti.com>
Subject: [PATCH v2 0/2] AM57 timer fixes
Date: Mon, 1 Sep 2025 15:45:23 +0530
Message-ID: <20250901101525.1090334-1-a-dutta@ti.com>
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

Changelog: v1:
1. Modified commit messages and subject according to review comments

Sinthu Raja (2):
  bus: ti-sysc: Add DRA7 SoC matching
  ARM: dts: ti: omap: Use DMTimer as Clocksource instead of counter_32k

 arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dts | 9 +++++++++
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi          | 2 +-
 drivers/bus/ti-sysc.c                           | 3 ++-
 3 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.34.1


