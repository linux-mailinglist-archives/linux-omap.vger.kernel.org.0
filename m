Return-Path: <linux-omap+bounces-2326-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7179916E4
	for <lists+linux-omap@lfdr.de>; Sat,  5 Oct 2024 14:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC1371C212FB
	for <lists+linux-omap@lfdr.de>; Sat,  5 Oct 2024 12:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8553015383F;
	Sat,  5 Oct 2024 12:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="QIrtBm0g"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B6614C5AE;
	Sat,  5 Oct 2024 12:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728132446; cv=none; b=OJaPrz8HgCcvqzTIKRjDFcfOtMNQTa8FHdp30GyGnQOvrQYKiV4FYEodrnbmdFXz0SQm2jTXEI7K0wnTD3k9IqCvtWFn4RMTBKmCNr541euYbKQG91bgHgtkzp43PhhublUt2n5EIX3T6afR/Il0DtISEdyhKQZIWM8APIfQPWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728132446; c=relaxed/simple;
	bh=Zfm5WdnxB5JQj8ViyWS1iuKc6KGaS55oRV/JIcQEN9g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WTBd9M8VLmczFmIDGbE7RG28tzW/UgDfo4hdlO6gUUeo0+PkROLxpIeWAQVACb1BLF9JlL7u1Xh8EEvkPHdpQ5DYUxK3tdNWN3EmrEbRkaWR3aGyhNraaWngs2qC0GalDdqhNPlC/ENznyNxPxMfOKAk0tcCs0IPgMiGOAlWm8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=QIrtBm0g; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=n0WcT2lZw1h2vJag9n+5dAZkKzRqfsiI2Q87+Bz0eX4=; b=QIrtBm0gBkQe8TKaxTfmkVzp1U
	yCDeBxk/KCJdx3UWdNOUfd88mJcmCLhfCg3BWPWd0122//WcsisUzDf3I5+27iG138nS1Ub95aoDe
	Kd4UNHiO1lqy35n8n4bpQ+BMV7EMYqID3Cyk7GpybfYTwyJUeGtWynF3SNLa8x6pjcdGDF/DXjqgV
	3c/unR1ksXLxhrDq8gwdY5+GvCeS8xlzeL5DVuXC0NQ4zQcPazzK2W3FI/P0PfWbDpXS3H0NcIdbD
	AEy2rZ8qjyg2J4PRGpXNEH9Paq6OojsaUC9CzUF4SIBQng6Z3xfmWG9ckXBtfUlYh5ew3SToQEW6k
	SIE0lGZg==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Tony Lindgren <tony@atomide.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Lee Jones <lee@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 2/3] clk: twl: remove is_prepared
Date: Sat,  5 Oct 2024 14:47:05 +0200
Message-Id: <20241005124706.601393-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241005124706.601393-1-andreas@kemnade.info>
References: <20241005124706.601393-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove is_prepared to simplify adding of TWL6030 support.
The default implementation should be enough.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Reviewed-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/clk/clk-twl.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/clk/clk-twl.c b/drivers/clk/clk-twl.c
index eab9d3c8ed8a..1d684b358401 100644
--- a/drivers/clk/clk-twl.c
+++ b/drivers/clk/clk-twl.c
@@ -77,26 +77,9 @@ static void twl6032_clks_unprepare(struct clk_hw *hw)
 		dev_err(cinfo->dev, "clk unprepare failed\n");
 }
 
-static int twl6032_clks_is_prepared(struct clk_hw *hw)
-{
-	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
-	int val;
-
-	val = twlclk_read(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE);
-	if (val < 0) {
-		dev_err(cinfo->dev, "clk read failed\n");
-		return val;
-	}
-
-	val &= TWL6030_CFG_STATE_MASK;
-
-	return val == TWL6030_CFG_STATE_ON;
-}
-
 static const struct clk_ops twl6032_clks_ops = {
 	.prepare	= twl6032_clks_prepare,
 	.unprepare	= twl6032_clks_unprepare,
-	.is_prepared	= twl6032_clks_is_prepared,
 	.recalc_rate	= twl_clks_recalc_rate,
 };
 
-- 
2.39.5


