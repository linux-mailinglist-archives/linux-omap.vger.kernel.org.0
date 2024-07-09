Return-Path: <linux-omap+bounces-1758-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7640E92C126
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 18:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F99A1F2292E
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 16:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F2C1A707F;
	Tue,  9 Jul 2024 16:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kf5TwRZI"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839381A706E;
	Tue,  9 Jul 2024 16:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542386; cv=none; b=iW5lvJZTF98iwN3QD7/UGytMy2ID099zDJsafzuCvHAPbRdHeX83IfxR167rc1QoDci56asH9za9YudsMRV25yHR9LORJW8DW6NqfVh+gst3tKs2PGhqn6WtMuAslMUOjQ/W6TWSS0Czu88naW+macOxvlgB9VQqDjFjfcoXjiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542386; c=relaxed/simple;
	bh=9mx+xXOJIbL4Gruc64zMLczRT2keXw6OrRtVSMDAPx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VvQLEoowqlk7O4H/Pa6yAiNesIbHdp39z/tLN9UNAyY/quRFME+UFQkWXqxFlaLFDOmHoBFoDVEP3Hid8kzMWMyksEnbd+Lg+fKnKgLvTFe5iBKbqpacKFDJaWUFX9RaX38CcihnFPVW/2gRIyBLGiFrKFuKXa3a5cGSjFqKSd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kf5TwRZI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61A9C32786;
	Tue,  9 Jul 2024 16:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542386;
	bh=9mx+xXOJIbL4Gruc64zMLczRT2keXw6OrRtVSMDAPx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kf5TwRZIK7ofiPQQqWmC0re32/MeHh6f7+f2L2/i2GcfNXbYoEL6oNFetDZH29DOF
	 vpc6cm+zBUCVmQIk/c+qlu+Webj2MdwPn79xp1JEonPSsWyAs6SOBdNEKLGFSmMifO
	 0Le78+loBfxP0JQMn0x3HYGxxgNXTLrYvz6UFmfhrHKb8GdxXWyFV0+ZFLGl/5kXt0
	 WOPjBdeW8viUSUPYsqu4PFvNMoOn9dfuGE47BGACY0K60qs0YTWDakv3n1ENOd920m
	 RK6UI1CWUcrnyxMFeqBItoAVCEvZA4DbbWVOk4BOETQjWiHwomRD+vGfzqdj4frCjN
	 r+xHkoQx/32cw==
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
Subject: [PATCH AUTOSEL 5.10 06/14] ASoC: ti: omap-hdmi: Fix too long driver name
Date: Tue,  9 Jul 2024 12:25:50 -0400
Message-ID: <20240709162612.32988-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162612.32988-1-sashal@kernel.org>
References: <20240709162612.32988-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.221
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


