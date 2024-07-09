Return-Path: <linux-omap+bounces-1754-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AAD92BFBA
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 18:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C4C21F21749
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 16:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3511A2C08;
	Tue,  9 Jul 2024 16:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fbt1WR2I"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA191A01D1;
	Tue,  9 Jul 2024 16:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542042; cv=none; b=OlXDAJMKnvxEZjJD8GHyYUiGYvakXeSmmvOXqccFI2u+7sjsSCbFti+eWCV726KlDgB6cvlU3/FvfaQcNY1lJbx43sHuSYQ51dvG6e8IZ1AmgFU+0cc4mb84I2HAcMcz44VtFYp/sBpmdBBVhH4LwmYXysF7ledjeN47g6fcuSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542042; c=relaxed/simple;
	bh=El8iCeDfNXj82T/GEiSAVFqPl9EnHXRVzN8ETpCQwYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dMK682h2h4thoSi6eX8rVZWG8ndjHHRm8N5oMjQqVTDaIKi3df0JlAEPD2SAVLQGVYUeUPGRbScCUhKPYw389uGCtN8+YLF1XbrZzUU6OIpvgI3Kqw78ncjHiaU1SdBVon3lb9ZTGjnsC1pk5j/CCdiI90IW8U14RlmEtzEzTgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fbt1WR2I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A68C4AF0A;
	Tue,  9 Jul 2024 16:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542042;
	bh=El8iCeDfNXj82T/GEiSAVFqPl9EnHXRVzN8ETpCQwYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fbt1WR2IbRazfYiB5isczZRxiPUOuWx6dDqlHxPgrF5OfSAlJLrREa0Kgk7pIbc5H
	 AZG66PCjBTTtBu7eAZzQ6p82tdxT7Rc0Yhyw3cr3s3l0kNMnsvt19PRX9jEXuZeGm4
	 yLcffx7oob6lPfuP9XBsYMDtS8X+CDhF6YKJUykTBM3C4wL5e5NUZSZ+5jaQJJ7QHo
	 wxFw1kNXdbc+A6o85GSfqvoUW5V786YHmGL5Bv8xAIwaDNQQ7tuUr18o6+y2gyYimG
	 GfWS7zikYXSbCz5GEclMkdOS5rDE2qHDKYVy8cADm5QSqLC9aEvA7yCYODVei7bmx1
	 CpaKZS9LvWzlg==
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
Subject: [PATCH AUTOSEL 6.9 14/40] ASoC: ti: omap-hdmi: Fix too long driver name
Date: Tue,  9 Jul 2024 12:18:54 -0400
Message-ID: <20240709162007.30160-14-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162007.30160-1-sashal@kernel.org>
References: <20240709162007.30160-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.8
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
index 4513b527ab970..ad8925b6481ca 100644
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


