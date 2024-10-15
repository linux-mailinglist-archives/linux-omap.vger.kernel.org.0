Return-Path: <linux-omap+bounces-2421-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A84B499DFA7
	for <lists+linux-omap@lfdr.de>; Tue, 15 Oct 2024 09:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D4F028261E
	for <lists+linux-omap@lfdr.de>; Tue, 15 Oct 2024 07:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 226A71AAE2C;
	Tue, 15 Oct 2024 07:49:47 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from cmccmta3.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF998189BBF;
	Tue, 15 Oct 2024 07:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728978586; cv=none; b=kw/Ssgy71zbxIDZ6CZxQAJ0Vc2v2x6ckMBaelzbrvaf3M5Z/yT80moXp3XgbVDtSDTs7++W0CfxPoJvPFk3XKzrYbL1/k3HpmEVv3nzbcwuPqOfFebaQVfGWSLsqo3e65sqNCzBYzPlC/jhXM+aavKfuqCIo31/++0wXNr8G6fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728978586; c=relaxed/simple;
	bh=ERi7IPOprRx59JXhjMC3xTcDaqfRPPR8xmHcnPlE138=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mlu9XtP4Ud2oY0YS7eE5TCY9lNzNhPy9bcn9pFPFr6bGrXuDjF/e5cYW6Z3DKCxMwO5n+xJF6KXmBDH9jJPP5Iij1BzU1cn52i3pXaGPVyC2I0E5cSingEBXZnT1c5OdMyj/IqnYx4pDOj3qgHdolkKDGIhM5A0r5ehFpoL0VXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee9670e1e9281e-2782b;
	Tue, 15 Oct 2024 15:49:40 +0800 (CST)
X-RM-TRANSID:2ee9670e1e9281e-2782b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.103])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee7670e1e93b5a-f518e;
	Tue, 15 Oct 2024 15:49:40 +0800 (CST)
X-RM-TRANSID:2ee7670e1e93b5a-f518e
From: Liu Jing <liujing@cmss.chinamobile.com>
To: peter.ujfalusi@gmail.com
Cc: jarkko.nikula@bitmer.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Jing <liujing@cmss.chinamobile.com>
Subject: [PATCH] Use card->dev in replace of the &pdev->dev argument in the dev_err function
Date: Tue, 15 Oct 2024 15:49:38 +0800
Message-Id: <20241015074938.6247-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because card->dev = &pdev->dev is already defined in the rx51_soc_probe function,
and then &pdev->dev is still used.

Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
---
 sound/soc/ti/rx51.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/ti/rx51.c b/sound/soc/ti/rx51.c
index 77296237575a..d9900c69e536 100644
--- a/sound/soc/ti/rx51.c
+++ b/sound/soc/ti/rx51.c
@@ -371,7 +371,7 @@ static int rx51_soc_probe(struct platform_device *pdev)
 
 		dai_node = of_parse_phandle(np, "nokia,cpu-dai", 0);
 		if (!dai_node) {
-			dev_err(&pdev->dev, "McBSP node is not provided\n");
+			dev_err(card->dev, "McBSP node is not provided\n");
 			return -EINVAL;
 		}
 		rx51_dai[0].cpus->dai_name = NULL;
@@ -381,7 +381,7 @@ static int rx51_soc_probe(struct platform_device *pdev)
 
 		dai_node = of_parse_phandle(np, "nokia,audio-codec", 0);
 		if (!dai_node) {
-			dev_err(&pdev->dev, "Codec node is not provided\n");
+			dev_err(card->dev, "Codec node is not provided\n");
 			return -EINVAL;
 		}
 		rx51_dai[0].codecs->name = NULL;
@@ -389,7 +389,7 @@ static int rx51_soc_probe(struct platform_device *pdev)
 
 		dai_node = of_parse_phandle(np, "nokia,audio-codec", 1);
 		if (!dai_node) {
-			dev_err(&pdev->dev, "Auxiliary Codec node is not provided\n");
+			dev_err(card->dev, "Auxiliary Codec node is not provided\n");
 			return -EINVAL;
 		}
 		rx51_aux_dev[0].dlc.name = NULL;
@@ -399,7 +399,7 @@ static int rx51_soc_probe(struct platform_device *pdev)
 
 		dai_node = of_parse_phandle(np, "nokia,headphone-amplifier", 0);
 		if (!dai_node) {
-			dev_err(&pdev->dev, "Headphone amplifier node is not provided\n");
+			dev_err(card->dev, "Headphone amplifier node is not provided\n");
 			return -EINVAL;
 		}
 		rx51_aux_dev[1].dlc.name = NULL;
@@ -408,7 +408,7 @@ static int rx51_soc_probe(struct platform_device *pdev)
 		rx51_codec_conf[1].dlc.of_node = dai_node;
 	}
 
-	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	pdata = devm_kzalloc(card->dev, sizeof(*pdata), GFP_KERNEL);
 	if (pdata == NULL)
 		return -ENOMEM;
 
@@ -439,7 +439,7 @@ static int rx51_soc_probe(struct platform_device *pdev)
 
 	err = devm_snd_soc_register_card(card->dev, card);
 	if (err) {
-		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", err);
+		dev_err(card->dev, "snd_soc_register_card failed (%d)\n", err);
 		return err;
 	}
 
-- 
2.27.0




