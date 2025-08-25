Return-Path: <linux-omap+bounces-4322-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1D0B342D1
	for <lists+linux-omap@lfdr.de>; Mon, 25 Aug 2025 16:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76605188D110
	for <lists+linux-omap@lfdr.de>; Mon, 25 Aug 2025 14:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4FC2ED17B;
	Mon, 25 Aug 2025 14:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="HeCIhxzu";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="lLwAcdyD"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC322ECE9E;
	Mon, 25 Aug 2025 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756130907; cv=none; b=pDDume+l4DIjSz+PjJTd3Q4vDPLmiR4TUjT1iciuD2RBeqnhpPmUYj1IZvy8X/np0wwNnK7nH8wufPVZrQylS+nYfWsgGVe40bRZGIsrCDKHQlA+gvFKe3e+acQpjwXr5b34r5H8/ADa98uQrx2HiW/m7JLdjLpGUkup/6QZ03A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756130907; c=relaxed/simple;
	bh=q2i1lD8/NLs7XFgROZ3GTkd+7LpvfMjEBlntS29bCWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A/eYuydJdAwf6N7IldTmkPfiutwmxpRbDORZnA9ydGMjcetWGDXjb7fCQp0Zwr+rporHVJ/0pzbOtWtC15XurVYjyqzocWIxjHjzU3bAExmGtKL/J0f16DPDeNpjhzb4cYlEgTSgSRWQrWVwavUbZHdJhuxwu5XDERz3ylUzjZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=HeCIhxzu; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=lLwAcdyD reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756130903; x=1787666903;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rLx+MN+sb4hVCsLJydaJdCblYaYKo6FoytwS5P52MOo=;
  b=HeCIhxzu67cf+PfubrAgvTzDCRLrzieyFtgtUBO8sv4PJoGgW9vh+M1v
   KBaOzmYTh1VXcGdkcryfUGApebyWE3gg3qQvPDqRXhLVorKIg86JLSCJz
   p2sD8bo3kns4f6zTvpXnnjctHdrhhVo+ubbigG7vNCT3ZH331kN7n3mkG
   +ud6iWI8Fkiili9DjE7Bo8FIzLLSu4MEHtv0AoVvgqm8W6GdjqP0TE3Sk
   q4jT4VhwLYUjiB1l9ikya4w1aAPBTRtKDLtJbpKXhjJ7wjl3g5E1+vrXp
   YVAUOq6W2nCRLu2xHVSVSmubFJXBB7RNoBbautLOVWbChKw5J+cNYtUER
   g==;
X-CSE-ConnectionGUID: D0HienxOQX+SSPbh7cHmEA==
X-CSE-MsgGUID: W8P7mUvHSYu2nuE8hdYxzA==
X-IronPort-AV: E=Sophos;i="6.18,213,1751234400"; 
   d="scan'208";a="45895844"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Aug 2025 16:08:19 +0200
X-CheckPoint: {68AC6E53-12-20CAA7DA-EC9DC758}
X-MAIL-CPID: F1469DF620F32CA268DC821C898F1CBE_0
X-Control-Analysis: str=0001.0A002101.68AC6E54.0032,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AEA11164191;
	Mon, 25 Aug 2025 16:08:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756130895; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=rLx+MN+sb4hVCsLJydaJdCblYaYKo6FoytwS5P52MOo=;
	b=lLwAcdyD9Tis/NdsxX9ZxJxz4JHkO0CIEbg4FMJXocwcDxpT1QkfGDZ8H2fy0Ulbxj5Bwl
	iYnHK1/AeiDjrTiERoNS6+SDe0FpNxH0JiByFWkfa2Ie4asTTBz0gIda5KGGQe89Dc2r1k
	9zfADP4aQyjcRkRyJTSWBqgkVyrOSlAKiWh44RiqvZTvTMPeULbtB3wlIHMiZDRgj0tqA2
	qUaDUNQXtMuwf4Dab36bqQUcEX8U9eSfP7fUWOFNCNyFpql268aDnRZQe23EaHwOsI/ET9
	cxoyhWoLPkcMaqm+sN2Rp7EfdjqaekjBcjSYpHZptkdgyeOBRjRldkywXca3Yw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Tero Kristo <kristo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	linux-omap@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/1] clk: ti: am33xx: keep WKUP_DEBUGSS_CLKCTRL enabled
Date: Mon, 25 Aug 2025 16:08:11 +0200
Message-ID: <20250825140812.2222185-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

As described in AM335x Errata Advisory 1.0.42, WKUP_DEBUGSS_CLKCTRL
can't be disabled - the clock module will just be stuck in transitioning
state forever, resulting in the following warning message after the wait
loop times out:

    l3-aon-clkctrl:0000:0: failed to disable

Just add the clock to enable_init_clks, so no attempt is made to disable
it.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/clk/ti/clk-33xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/ti/clk-33xx.c b/drivers/clk/ti/clk-33xx.c
index 85c50ea39e6da..9269e6a0db6a4 100644
--- a/drivers/clk/ti/clk-33xx.c
+++ b/drivers/clk/ti/clk-33xx.c
@@ -258,6 +258,8 @@ static const char *enable_init_clks[] = {
 	"dpll_ddr_m2_ck",
 	"dpll_mpu_m2_ck",
 	"l3_gclk",
+	/* WKUP_DEBUGSS_CLKCTRL - disable fails, AM335x Errata Advisory 1.0.42 */
+	"l3-aon-clkctrl:0000:0",
 	/* AM3_L3_L3_MAIN_CLKCTRL, needed during suspend */
 	"l3-clkctrl:00bc:0",
 	"l4hs_gclk",
-- 
2.43.0


