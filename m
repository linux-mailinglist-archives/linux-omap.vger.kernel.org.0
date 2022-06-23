Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DFEC557AD1
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jun 2022 14:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbiFWMxh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jun 2022 08:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231818AbiFWMxf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jun 2022 08:53:35 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F5CE3B56E;
        Thu, 23 Jun 2022 05:53:34 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBvlr8011978;
        Thu, 23 Jun 2022 07:52:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Cu9tESwNAJCqNud4CH2wl7Pn1vWEacIdyZK6FUTRt2s=;
 b=nQ67567rrziiWuo8+0zYu+hVjf6omAUzwwZ3/+hZtC2g9OCT36IubELHDhfWB39cF2Tp
 yCbkSVsAYzuVq7Lw779+6bKDclIQhOMyW1cRdsD27odfKhRtQJq1OJKWhq/I4q8XoVQt
 LAm6JentLCWDEOc7aXrBW6vdpbpV8EBZgeTp0Yc7IQkdcEYczyWNWUrU//ZvZN+oKwLu
 SocVcm1/kiYoJ5AYOvVMiEJDH76SXU7bfHv2xhH/D2sJBG1vPiApTrHlkpPeT091Ijid
 YPdaBVdeS4RrnefvW4MsppxfkqbCSvLOy4utpsjBDg94vAP02gyD+RM56dUWsIEvMYJM KA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gsb4p6wvp-3
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 23 Jun 2022 07:52:53 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:51 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:51 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 16B3D475;
        Thu, 23 Jun 2022 12:52:51 +0000 (UTC)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <broonie@kernel.org>
CC:     <lgirdwood@gmail.com>, <kuninori.morimoto.gx@renesas.com>,
        <mripard@kernel.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <vkoul@kernel.org>, <nicolas.ferre@microchip.com>,
        <nsaenz@kernel.org>, <shawnguo@kernel.org>, <linux-imx@nxp.com>,
        <cezary.rojewski@intel.com>,
        <pierre-louis.bossart@linux.intel.com>,
        <linux-mips@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <daniel@zonque.org>, <srinivas.kandagatla@linaro.org>,
        <linux-rockchip@lists.infradead.org>, <krzk@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-xtensa@linux-xtensa.org>,
        <peter.ujfalusi@gmail.com>, <jarkko.nikula@bitmer.com>,
        <heiko@sntech.de>, <jbrunet@baylibre.com>, <kernel@pengutronix.de>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <dri-devel@lists.freedesktop.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <frattaroli.nicolas@gmail.com>
Subject: [PATCH v2 04/96] ASoC: img: Migrate to new style legacy DAI naming flag
Date:   Thu, 23 Jun 2022 13:51:18 +0100
Message-ID: <20220623125250.2355471-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: GcYbAiclxJEWpyUT1MrOi7axNXq5xsep
X-Proofpoint-ORIG-GUID: GcYbAiclxJEWpyUT1MrOi7axNXq5xsep
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Change the legacy DAI naming flag from opting in to the new scheme
(non_legacy_dai_naming), to opting out of it (legacy_dai_naming).
These drivers appear to be on the CPU side of the DAI link and
currently uses the legacy naming, so add the new flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/img/img-i2s-in.c       | 3 ++-
 sound/soc/img/img-i2s-out.c      | 3 ++-
 sound/soc/img/img-parallel-out.c | 3 ++-
 sound/soc/img/img-spdif-in.c     | 3 ++-
 sound/soc/img/img-spdif-out.c    | 3 ++-
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index 97cab6d95b169..56bb7bbd3976c 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -386,7 +386,8 @@ static int img_i2s_in_dai_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_component_driver img_i2s_in_component = {
-	.name = "img-i2s-in"
+	.name = "img-i2s-in",
+	.legacy_dai_naming = 1,
 };
 
 static int img_i2s_in_dma_prepare_slave_config(struct snd_pcm_substream *st,
diff --git a/sound/soc/img/img-i2s-out.c b/sound/soc/img/img-i2s-out.c
index 9ec6fc528e2b4..e3c6e662aa867 100644
--- a/sound/soc/img/img-i2s-out.c
+++ b/sound/soc/img/img-i2s-out.c
@@ -394,7 +394,8 @@ static int img_i2s_out_dai_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_component_driver img_i2s_out_component = {
-	.name = "img-i2s-out"
+	.name = "img-i2s-out",
+	.legacy_dai_naming = 1,
 };
 
 static int img_i2s_out_dma_prepare_slave_config(struct snd_pcm_substream *st,
diff --git a/sound/soc/img/img-parallel-out.c b/sound/soc/img/img-parallel-out.c
index cd6a6a8257419..08506b05e2265 100644
--- a/sound/soc/img/img-parallel-out.c
+++ b/sound/soc/img/img-parallel-out.c
@@ -201,7 +201,8 @@ static struct snd_soc_dai_driver img_prl_out_dai = {
 };
 
 static const struct snd_soc_component_driver img_prl_out_component = {
-	.name = "img-prl-out"
+	.name = "img-prl-out",
+	.legacy_dai_naming = 1,
 };
 
 static int img_prl_out_probe(struct platform_device *pdev)
diff --git a/sound/soc/img/img-spdif-in.c b/sound/soc/img/img-spdif-in.c
index a79d1ccaeec01..3f1d1a7e8735b 100644
--- a/sound/soc/img/img-spdif-in.c
+++ b/sound/soc/img/img-spdif-in.c
@@ -711,7 +711,8 @@ static struct snd_soc_dai_driver img_spdif_in_dai = {
 };
 
 static const struct snd_soc_component_driver img_spdif_in_component = {
-	.name = "img-spdif-in"
+	.name = "img-spdif-in",
+	.legacy_dai_naming = 1,
 };
 
 static int img_spdif_in_probe(struct platform_device *pdev)
diff --git a/sound/soc/img/img-spdif-out.c b/sound/soc/img/img-spdif-out.c
index f7062eba2611a..983761d3fa7e6 100644
--- a/sound/soc/img/img-spdif-out.c
+++ b/sound/soc/img/img-spdif-out.c
@@ -316,7 +316,8 @@ static struct snd_soc_dai_driver img_spdif_out_dai = {
 };
 
 static const struct snd_soc_component_driver img_spdif_out_component = {
-	.name = "img-spdif-out"
+	.name = "img-spdif-out",
+	.legacy_dai_naming = 1,
 };
 
 static int img_spdif_out_probe(struct platform_device *pdev)
-- 
2.30.2

