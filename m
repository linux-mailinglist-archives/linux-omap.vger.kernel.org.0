Return-Path: <linux-omap+bounces-1757-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E796992C0EC
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 18:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1A3028B0DB
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 16:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99BA18D4A3;
	Tue,  9 Jul 2024 16:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rzjb4GGg"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747A418C19F;
	Tue,  9 Jul 2024 16:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542332; cv=none; b=ty24Liw02ADRZLlAG8K2VhPg2qBFrkc/wUVFb1AxkgfhS99xq6ZfllP7AffvsNkovni3KevuQVrCPaQybvxuJ5b7hJnc61UtYxDwCB4P7gPTaX9f8Crx28ybP0gZqlqx0NwAjd8S763meNOER/46KNVlNMVPBIVJQapY4vtPoFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542332; c=relaxed/simple;
	bh=9mx+xXOJIbL4Gruc64zMLczRT2keXw6OrRtVSMDAPx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YEInLKWOTb01hqQbrzxNF3zk7UoPDnVBEB6QLcaiYB83BlOiY3GrJG0e/JZ+8ZvD9p0vZXbu0aYeDDxioNYsR7IQ1bJ/lknkE2ipc2jTJpqEjp/pC5RG6yUuaxdBYXovxx7wIGax19FPIVbDgaLz5xDIOdp3tDi//omsKkP/hDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rzjb4GGg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB50C4AF0A;
	Tue,  9 Jul 2024 16:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542332;
	bh=9mx+xXOJIbL4Gruc64zMLczRT2keXw6OrRtVSMDAPx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rzjb4GGgqrrv4tgwlE7+GVnSpO6ZgTGPAPuJnK7gGZf4yYMEtl9/W7ZH0fFhjgRvw
	 cQv+j9FvAVPzpCrxkJSnp0pQSKscVI+ESZBoexHaR338U028LTkUqXHgeSTSBIcp24
	 FgrEf5f+WOdKERCBgGYCOIyMqfxxt2Sp4QMccM+E4QrxljA0sB1fxVFvnnqWkMxUYP
	 X7hwzPrTsUmfrnqe06lAgoFPL7tKYhPXNis7zsNOVZNtKxyJFRIt0UXwx9VpOEVyiO
	 OJSmQs/SCGNdHrcU3KQbZz/JTAc0xQBbgKnJJ5/fekKZ4bjKF6vwjCbF9pZbt1mDQn
	 pGcUDpSMs940g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Primoz Fiser <primoz.fiser@norik.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	jarkko.nikula@bitmer.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 06/17] ASoC: ti: omap-hdmi: Fix too long driver name
Date: Tue,  9 Jul 2024 12:24:50 -0400
Message-ID: <20240709162517.32584-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162517.32584-1-sashal@kernel.org>
References: <20240709162517.32584-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.162
Content-Transfer-Encoding: 8bit

From: Primoz Fiser <primoz.fiser@norik.com>

[ Upstream commit 524d3f126362b6033e92cbe107ae2158d7fbff94 ]

Set driver name to "HDMI". This simplifies the code and gets rid of
the following error messages:

  ASoC: driver name too long 'HDMI 58040000.encoder' -> 'HDMI_58040000_e'

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Link: https://lore.kernel.org/r/20240610125847.773394-1-primoz.fiser@norik.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/ti/omap-hdmi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index 3328c02f93c74..1dfe439d13417 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -353,11 +353,7 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 	if (!card)
 		return -ENOMEM;
 
-	card->name = devm_kasprintf(dev, GFP_KERNEL,
-				    "HDMI %s", dev_name(ad->dssdev));
-	if (!card->name)
-		return -ENOMEM;
-
+	card->name = "HDMI";
 	card->owner = THIS_MODULE;
 	card->dai_link =
 		devm_kzalloc(dev, sizeof(*(card->dai_link)), GFP_KERNEL);
-- 
2.43.0


