Return-Path: <linux-omap+bounces-2291-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED95198D1F7
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2024 13:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B0881C2155D
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2024 11:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09921EBFF9;
	Wed,  2 Oct 2024 11:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="m2YgW4It"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D839F19D07D;
	Wed,  2 Oct 2024 11:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727867257; cv=none; b=PLDn9aIdAhX1bWdLMKORvw5bXTKgNyuxc0LUzuP2018mWsqg9orwsqMSCp+Jo+h6wB5vrL9aUHKMSbQqZ0e2+EFLOdSrSrGdYRpntNzyW5ePynYxGB/uopjpkKiorf6ipA52S/zpuVCseKLn9OdicMVbGOMK5owZ4gbXdsbHqdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727867257; c=relaxed/simple;
	bh=3yXEUzconOtIkk4NPQcgTFwK9TurmiOWQFGd+HRirJA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cVZRN54iWT5Mkw/gvX90ipKJpt83ZojiShfGaNmd7s+UehfUT84h9jL6x6/OApoZJK98hcMuU3n7n+S8JZXcadBpn1IvzISRw9esA98ZS/k9fiJ2KRaL3hUhfDGn8kaGZtrCy3sjtfS+hEi8RaikOZbRizCucvsF/62pXFDi/qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=m2YgW4It; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=B7At8BuiWMC0EtZ0gWWkKYgt1LQkrFiLgOqHpS4o1Tg=; b=m2YgW4ItKGsc+f8/tAoCxDcQ5B
	08en79lRotBPHo9YD7QTvVBJHjHApE8HHhZRF9shXjYScaY1W727sfxkIeT18CtiawNy2WL4htLZ9
	+6DwQUhiD3VyXp16LSma7Mo0aISDu4XbNk9/FblDc2rQXpPbpA9lTZrV18NqYl0vGY0+3XhwUyRJC
	ryLl8ehqoBGdAjMsVBI+drtPzN9WY/kJdZ1hyO05frrmrv12Nc3pv32UtJ2UsA5xr3DxjKB0nOOxn
	X6Yriq7X6Kb3nU6mPmrjsyf+qYgTMT/eoQuiQHZ7uydgs1DLlNgMSYdDlMeCB5BjVfjdMjxgX6trs
	Dt/ihfiA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Stephen Boyd <sboyd@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	linux-omap@vger.kernel.org,
	Roger Quadros <rogerq@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 2/3] clk: twl: remove is_prepared
Date: Wed,  2 Oct 2024 13:07:17 +0200
Message-Id: <20241002110718.528337-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241002110718.528337-1-andreas@kemnade.info>
References: <20241002110718.528337-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remave is_prepared to simplify adding of TWL6030 support.
The default implementation should be enough.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
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


