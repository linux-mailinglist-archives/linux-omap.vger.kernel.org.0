Return-Path: <linux-omap+bounces-1513-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B09DA902235
	for <lists+linux-omap@lfdr.de>; Mon, 10 Jun 2024 14:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AFD91F22D54
	for <lists+linux-omap@lfdr.de>; Mon, 10 Jun 2024 12:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E260B82495;
	Mon, 10 Jun 2024 12:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norik.com header.i=@norik.com header.b="azl33DBy"
X-Original-To: linux-omap@vger.kernel.org
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F29181737;
	Mon, 10 Jun 2024 12:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718024332; cv=none; b=mA/bZfO/jro9L2zhz/pEsRGawjygUb4C78adep/99Udb9laDivaY/O/uQrLhk9w7gE7tOiU7GB0GKXPFp8v8D5cPyfh5ejl23SBTzclfQW732t0P2S5ob/zjzXyjmtbgbRn9acjCANsIfVBVf/YTbJaVT79eghG3m+DPu1+3JxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718024332; c=relaxed/simple;
	bh=hs5yvBjMe5zbyXlRtFi3yH+jXaDN2jYG6b3IpAmMi7o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WjF/5slPkMg4uRSzKoPzbunmbQsGDbW2XH/yFtSwNP0VFrsXyPZNtYJ5iFM05QpKVDQ5cBKsC8sWz3X6Bn9eJJKG2oeilY/ix4ATwUicY1oVjdpvmWNFMplcllezVl7Rn3W8LIE9HyOLshX4JTPpvwUQw33lfkh64kTxrogP/Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=azl33DBy; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=lqCp3QFYEQgLNcRwyp3g/NgBK3T6HGS8y29EGKEsL5Y=; b=azl33DByNfd1A9DZ9NIx0IA3mN
	WURR8bsMqFqZhOEttXkXv+u5vLA6Fg3S6pZ963/hjZUjqHjyuMPqxwrub0keq1vxGqUxkMt1Bw1Ln
	/ctOmoK0k9zn5no43SUCp7aEY5JpGlF1ECcvD0ZrkTZVAL21aZi71XowGd6Ufa5uFl1rM7HtLF0fa
	f0CdCsTkg5VkSfrgF4STHqT0TUjb+fRR0dXVftvT+GBIWkGhVZDmulU4p97GqRBUNgL7yDxoA/JGi
	j+gRdMqJipRG1iMgvCWY+fQejRbeoMwkZcLWr4t3aiPnNk4eDgzNiQ6cliuexnMv8MJs67ukdkUv9
	+NaI2vnQ==;
Received: from [89.212.21.243] (port=36862 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1sGebo-00CJLR-0O;
	Mon, 10 Jun 2024 14:58:48 +0200
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
Subject: [PATCH v2] ASoC: ti: omap-hdmi: Fix too long driver name
Date: Mon, 10 Jun 2024 14:58:47 +0200
Message-Id: <20240610125847.773394-1-primoz.fiser@norik.com>
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

Set driver name to "HDMI". This simplifies the code and gets rid of
the following error messages:

  ASoC: driver name too long 'HDMI 58040000.encoder' -> 'HDMI_58040000_e'

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- use "HDMI" instead of DRV_NAME (requested)

 sound/soc/ti/omap-hdmi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index 639bc83f4263..cf43ac19c4a6 100644
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
2.25.1


