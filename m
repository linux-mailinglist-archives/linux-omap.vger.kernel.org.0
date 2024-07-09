Return-Path: <linux-omap+bounces-1755-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF25292C0C1
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 18:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 607CFB26C8C
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 16:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60161C0926;
	Tue,  9 Jul 2024 16:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYW7kALo"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A4A1C0072;
	Tue,  9 Jul 2024 16:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542170; cv=none; b=PYiSecK9gidrE3yHlXbNj0C4dmFnCfzdfvxIF45UBAKjmNrz8Q/4b+dvUmjn0tBH3meEWZwT7lvWbwG+In8P0aQjSyE1GQrswVDJz/jEZRBEfvMmiD9S7E6iusrV/7Px/5wSOVeqhfvl0+6apAgfVTMFzMzIf2GiE0BBYjG15Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542170; c=relaxed/simple;
	bh=EkfH03gMd1QxWZGFiDRmkKUiWinBbLFG7E0MUORO4s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/a+f9IxiZsAdyIKovCU4cMjpxZjManEcnOzBgSMlXQ54Qkovgug6j5oSbgZyMLRkzxHze83bi+0raADTJqZAEmfG+UDPyWp+CfePyLpdLJXFDxt4rnjx1xQnH8cYIMqk3s31EO2lY/coeGQmeVFYy8sy+ppEWBfKJKme7PAjOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYW7kALo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1BCC4AF07;
	Tue,  9 Jul 2024 16:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542170;
	bh=EkfH03gMd1QxWZGFiDRmkKUiWinBbLFG7E0MUORO4s0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cYW7kALo8zwJPYuSKzPqaHuioV2O2OdfPf+g087tivaAdkT2mZNR0jcMOwduKhJIA
	 v3P4qOzDTFu1ZDfE6Te/2l9K6KWqRUehRFt3WEikQHw8nzQX8c4m06dCnGCaiMmWUh
	 oxM9v6qVTQCmLXiItSL9PrZ7y+vtOL61jOMCtZym0f/07QA/qDmovg1+jrCY+EoseB
	 aME4NUcQ9aaPC5BFWwPWaFSmUdp/BH+hBd8l69PxD69weaPK4yRBCuGcIqqMD+W5i6
	 t7tH6xahiXXKnkuNPH7jDrb1QCNjt1H3QSuBqG+RaI754JknGwuMyXFkBTsfBu18lI
	 Ud8O90ArRMozQ==
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
Subject: [PATCH AUTOSEL 6.6 11/33] ASoC: ti: omap-hdmi: Fix too long driver name
Date: Tue,  9 Jul 2024 12:21:37 -0400
Message-ID: <20240709162224.31148-11-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162224.31148-1-sashal@kernel.org>
References: <20240709162224.31148-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.38
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
index a3663ab065ac2..0a731b21e5a58 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -354,11 +354,7 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
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


