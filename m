Return-Path: <linux-omap+bounces-1756-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D80392C0A7
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 18:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03FDA1F22312
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 16:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D31B210184;
	Tue,  9 Jul 2024 16:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oiLx/L3G"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC3F20FAB6;
	Tue,  9 Jul 2024 16:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542261; cv=none; b=hf5X53UqvPmN61OtpY/myzY+GiMAanuRvTjdfSnKWgsWhmh8lNjxQsgsME6XiqNsXoZ90Lg3TEQ2hBtMz3bYy86bshlCMPEJBUTS5W4DRLxi9aJ/I/7O/GEcC0aWW5SJZ9n2tBO33xy0cQF0eRlfTn+jAO1v3OyvyRCImb+jQWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542261; c=relaxed/simple;
	bh=GqWztKzgc740X2A43eI62FoenASUmMj51Y7n7LdBHkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKlOhsnRKeFxwjimoVZ1sLC0trP4NtrOjOk4AxuW6KAnlbP9DMTBLSp6lzaZNskgyhTTOamVL6Y0kL9LX7PzG0Uo8+d2Dz+B5T7cWcgrhbYCtXAdoEyOxgwhEMUg7lCREbV0SQ0kCmPgB6GnrefLRD+tFwlSd+bEPGzfb7Fra7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oiLx/L3G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D66C4AF0A;
	Tue,  9 Jul 2024 16:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542260;
	bh=GqWztKzgc740X2A43eI62FoenASUmMj51Y7n7LdBHkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oiLx/L3GE3BnY2SOdDBn01b+T/X301k9lZkmg9XCKRjACo1uEiqWgqhwg5Cnh2Ctx
	 9vbRt2z8knuMDikmiOfLPtt3kEAdmqylPIe0k6qZ4QTy8+NCaNrY88yLJllv2CERDg
	 Oa+rRX1kySjaTiOXwochWWaYVngUb/c0VN1tIPztB0oOnE/t2Lma6kf8Nsh/T7qjCg
	 I3zaBbrClukM5XY29579GRifKUfO32VgMFeT6ltKMcYDmEPVSu1TWndVtzazBMPEkU
	 Jsd5l3WAgGWcdFtdZIAt0HVoMkEL/fJtLPvzXJkzq9xa5Zdyw5qpH8gNfBeu/BIGxr
	 /Do4h7+sv7XkQ==
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
Subject: [PATCH AUTOSEL 6.1 09/27] ASoC: ti: omap-hdmi: Fix too long driver name
Date: Tue,  9 Jul 2024 12:23:23 -0400
Message-ID: <20240709162401.31946-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162401.31946-1-sashal@kernel.org>
References: <20240709162401.31946-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.97
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
index 0dc0475670ffe..554e7896e8053 100644
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


