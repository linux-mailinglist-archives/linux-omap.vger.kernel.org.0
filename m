Return-Path: <linux-omap+bounces-1471-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3472D8FDF4A
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 09:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 350161C2365C
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 07:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450A013AA5D;
	Thu,  6 Jun 2024 07:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norik.com header.i=@norik.com header.b="qYmUcVRW"
X-Original-To: linux-omap@vger.kernel.org
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2550D19D890;
	Thu,  6 Jun 2024 07:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717657609; cv=none; b=afFp8e6Bk3wUN1182xF+BCcgP8TKKe32E9MSiVFYKtKLCOg2gwJfWUJsyUyT3tp/ruZEGPnsSlx7L72LUq/4NafbVplLei2YmVy469pwC6gCp28Iw+mpvO+7nf4xiYOfDmYbOF8JTO3Y6X5N82pb+MP55ypM3WcCIznzQ25Juno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717657609; c=relaxed/simple;
	bh=2OUU5c+0oHQOjiWiuROmSRGh8j3BqgUxQjKXgFVzcJo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=noDYsodMYw3JFeg2Bm4B8Q9bvhDn0jx7mkCO19cBITJ6kwSasxLKSom1+MmuUPdLZ9c8f3XByPWc+6bh++8oUSXmNpnifFbbvDhwtDEXl/PEcKrlSfIruLKV5ppDOHo/ijKyNc9ECVZdjC/2/ss0LSfdCY6cAbw1F1cJXa7wAso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=qYmUcVRW; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+eJtUnrby00UuoYKS4VrVufy1eG1BTDW7IZPCyp/z7Y=; b=qYmUcVRWvbjX5/xj0PoVu+tz2N
	jF2ZU0UEQ8d2sOcVbXn6+BRC6fxCQ3uCDkQqloOgx/H//mS7FxUesSahfTYB77SffP0Y8q2Ui4PPQ
	1+wzk/MuOoI7sh8+K62MAQwQIoD60b/KelCtq7E/H/l+5GCgsUeQEjiStKxJQYwdk2SgJc87C3j8k
	drPOCeszU7JTRglLz6u5OJuhYqWui+ku6zqKHXE5HTkcwh/VpYQa+jmmvLLSmeUU87SdrIssT6F6n
	J2c++EF+JabD5uKDDnyFRhQenPhaRww3+/TOEzbnZ0m/Yb04vYULkbub+23QD3TmSOgyxUiSGxR1v
	ZIgunZlw==;
Received: from [89.212.21.243] (port=46262 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1sF7Cw-00BN3X-31;
	Thu, 06 Jun 2024 09:06:46 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: upstream@lists.phytec.de
Subject: [PATCH] ASoC: ti: omap-hdmi: Fix too long driver name
Date: Thu,  6 Jun 2024 09:06:45 +0200
Message-Id: <20240606070645.3519459-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Set driver name to DRV_NAME. This simplifies the code and gets rid of
the following error messages:

  ASoC: driver name too long 'HDMI 58040000.encoder' -> 'HDMI_58040000_e'

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 sound/soc/ti/omap-hdmi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index 639bc83f4263..3f35eedeea41 100644
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
+	card->name = DRV_NAME;
 	card->owner = THIS_MODULE;
 	card->dai_link =
 		devm_kzalloc(dev, sizeof(*(card->dai_link)), GFP_KERNEL);
-- 
2.25.1


