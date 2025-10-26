Return-Path: <linux-omap+bounces-4777-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEBCC0AB15
	for <lists+linux-omap@lfdr.de>; Sun, 26 Oct 2025 15:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD10D18A08E5
	for <lists+linux-omap@lfdr.de>; Sun, 26 Oct 2025 14:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641D12E8E08;
	Sun, 26 Oct 2025 14:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IkoJEIkM"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18DD21255B;
	Sun, 26 Oct 2025 14:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761490228; cv=none; b=R1ZfRMwfJVoRl2yPvYtJGzcp1/FvBoKWn+bhnroUC8jKd8cJzn0nZnanbJVnMzu/TWmG2eimO8Qo07tGTbhcghh+pV9t5n+/20jof14xoiyTY4um/tohZMS8LtKSXGaLZeRhq6fA6TQ8IfOS0wsMS9NOH5DtIrv0i2EvwPtu1rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761490228; c=relaxed/simple;
	bh=yvUYs4SLZPYGpHto3wjMTtbzd/25aLTBF4Ho2HzVyY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=COA7zCPhmgmvptaRbyuTwsZP8fiMAOnwUGiYbvyIrGzwGfsujUwq4wcJcp3UF6d8CO9KriBxciJ8hWEJaPk6KoMTBs1hb+evjiTH19ANDCzXroUiUgNKqYzTFZKEZEskgJFb+UYQxW8h7WEzXJuU9JTgikHcK9TiN7Viwu+ATw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IkoJEIkM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79AA8C4CEE7;
	Sun, 26 Oct 2025 14:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761490227;
	bh=yvUYs4SLZPYGpHto3wjMTtbzd/25aLTBF4Ho2HzVyY4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IkoJEIkMFX0SoPlOpjBienAr0mImZkXnkIiinNmAZSvLMrbDbcetcHYfRdsNW42qx
	 xnz7sbc1h9ZaoZ5K+QBcI6owXCmpZKTRV3SvhCMUfAPcqrxd8TotSeyyGvYj5oBYYK
	 K4kYabV9z785WIgrxQmX2s/EH1i4lkF77i6jwGCRhs1hZiTR2PjqHK5M2RGpj+9GQd
	 +j3dgtsGpSKJCOlfj9tzF9yrNbJzdn/yaSqCgB01uazZ2aX1qb82cSQRnG4b0YRVko
	 s9wUh0G14UPYt8XWJ2binXzVOJ+BingcchnZQHBpv15zqFHvrgRbC5nABGmIEHGZXz
	 wRmQAFijGZkHw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	kristo@kernel.org,
	alexandre.f.demers@gmail.com,
	linux-omap@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-5.15] clk: ti: am33xx: keep WKUP_DEBUGSS_CLKCTRL enabled
Date: Sun, 26 Oct 2025 10:48:52 -0400
Message-ID: <20251026144958.26750-14-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251026144958.26750-1-sashal@kernel.org>
References: <20251026144958.26750-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

[ Upstream commit 1e0d75258bd09323cb452655549e03975992b29e ]

As described in AM335x Errata Advisory 1.0.42, WKUP_DEBUGSS_CLKCTRL
can't be disabled - the clock module will just be stuck in transitioning
state forever, resulting in the following warning message after the wait
loop times out:

    l3-aon-clkctrl:0000:0: failed to disable

Just add the clock to enable_init_clks, so no attempt is made to disable
it.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES: The change simply marks WKUP_DEBUGSS as an always-on clock so the
driver no longer violates the AM335x erratum.

- `drivers/clk/ti/clk-33xx.c:261` now lists `l3-aon-clkctrl:0000:0` in
  `enable_init_clks`, explicitly keeping WKUP_DEBUGSS enabled as
  mandated by Errata Advisory 1.0.42; without this, the init sequence
  still tries to gate the module and hits the hardware deadlock
  described in the advisory.
- Today the disable path waits for the module to idle, times out, and
  prints `l3-aon-clkctrl:0000:0: failed to disable`
  (`drivers/clk/ti/clkctrl.c:194`), so every boot (and any later
  clk_disable_unused run) produces user-visible errors while leaving the
  clock stuck in “transitioning”; the patch stops that erroneous
  transition request entirely.
- Effect scope is tiny: one entry in an SoC-specific static list,
  matching how other errata workarounds (e.g. `l3-clkctrl:00bc:0`) are
  handled; the hardware already refuses to power down the block, so
  forcing it on introduces no new behaviour or power regression.
- No API or structural change, only affects AM33xx clock init, and it
  backports cleanly to older kernels using the same
  `omap2_clk_enable_init_clocks()` helper.

Suggested follow-up once backported: boot an AM335x board with
`clk_ignore_unused` removed to confirm the “failed to disable” warning
is gone.

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
2.51.0


