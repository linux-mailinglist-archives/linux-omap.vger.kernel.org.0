Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99056159603
	for <lists+linux-omap@lfdr.de>; Tue, 11 Feb 2020 18:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729084AbgBKRQ5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 12:16:57 -0500
Received: from muru.com ([72.249.23.125]:54736 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727954AbgBKRQ5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 11 Feb 2020 12:16:57 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DA26E80D4;
        Tue, 11 Feb 2020 17:17:39 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        "Arthur D ." <spinal.by@gmail.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH] ASoC: ti: Allocate dais dynamically for TDM and audio graph card
Date:   Tue, 11 Feb 2020 09:16:45 -0800
Message-Id: <20200211171645.41990-1-tony@atomide.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can have multiple connections on a single McBSP instance configured
with audio graph card when using TDM (Time Division Multiplexing). Let's
allow that by configuring dais dynamically.

See Documentation/devicetree/bindings/sound/audio-graph-card.txt and
Documentation/devicetree/bindings/graph.txt for more details for
multiple endpoints.

I've tested this with droid4 where cpcap pmic and modem voice are both
both wired to mcbsp3. I've also tested this on droid4 both with and
without the pending modem audio codec driver that is waiting for n_gsm
serdev dependencies to clear.

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Arthur D. <spinal.by@gmail.com>
Cc: Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 sound/soc/ti/omap-mcbsp-priv.h |  2 +
 sound/soc/ti/omap-mcbsp.c      | 76 ++++++++++++++++++++++++----------
 2 files changed, 55 insertions(+), 23 deletions(-)

diff --git a/sound/soc/ti/omap-mcbsp-priv.h b/sound/soc/ti/omap-mcbsp-priv.h
--- a/sound/soc/ti/omap-mcbsp-priv.h
+++ b/sound/soc/ti/omap-mcbsp-priv.h
@@ -262,6 +262,8 @@ struct omap_mcbsp {
 	struct omap_mcbsp_platform_data *pdata;
 	struct omap_mcbsp_st_data *st_data;
 	struct omap_mcbsp_reg_cfg cfg_regs;
+	struct snd_soc_dai_driver *dais;
+	int dai_count;
 	struct snd_dmaengine_dai_dma_data dma_data[2];
 	unsigned int dma_req[2];
 	int dma_op_mode;
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -14,6 +14,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/of_graph.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -1304,23 +1305,53 @@ static int omap_mcbsp_remove(struct snd_soc_dai *dai)
 	return 0;
 }
 
-static struct snd_soc_dai_driver omap_mcbsp_dai = {
-	.probe = omap_mcbsp_probe,
-	.remove = omap_mcbsp_remove,
-	.playback = {
-		.channels_min = 1,
-		.channels_max = 16,
-		.rates = OMAP_MCBSP_RATES,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE,
-	},
-	.capture = {
-		.channels_min = 1,
-		.channels_max = 16,
-		.rates = OMAP_MCBSP_RATES,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE,
-	},
-	.ops = &mcbsp_dai_ops,
-};
+static int omap_mcbsp_init_dais(struct omap_mcbsp *mcbsp)
+{
+	struct device_node *np = mcbsp->dev->of_node;
+	int i;
+
+	if (np)
+		mcbsp->dai_count = of_graph_get_endpoint_count(np);
+
+	if (!mcbsp->dai_count)
+		mcbsp->dai_count = 1;
+
+	mcbsp->dais = devm_kcalloc(mcbsp->dev, mcbsp->dai_count,
+				   sizeof(*mcbsp->dais), GFP_KERNEL);
+	if (!mcbsp->dais)
+		return -ENOMEM;
+
+	for (i = 0; i < mcbsp->dai_count; i++) {
+		struct snd_soc_dai_driver *dai = &mcbsp->dais[i];
+
+		dai->name = devm_kasprintf(mcbsp->dev, GFP_KERNEL, "%s-dai%i",
+					   dev_name(mcbsp->dev), i);
+
+		if (i == 0) {
+			dai->probe = omap_mcbsp_probe;
+			dai->remove = omap_mcbsp_remove;
+			dai->ops = &mcbsp_dai_ops;
+		}
+		dai->playback.channels_min = 1;
+		dai->playback.channels_max = 16;
+		dai->playback.rates = OMAP_MCBSP_RATES;
+		if (mcbsp->pdata->reg_size == 2)
+			dai->playback.formats = SNDRV_PCM_FMTBIT_S16_LE;
+		else
+			dai->playback.formats = SNDRV_PCM_FMTBIT_S16_LE |
+						SNDRV_PCM_FMTBIT_S32_LE;
+		dai->capture.channels_min = 1;
+		dai->capture.channels_max = 16;
+		dai->capture.rates = OMAP_MCBSP_RATES;
+		if (mcbsp->pdata->reg_size == 2)
+			dai->capture.formats = SNDRV_PCM_FMTBIT_S16_LE;
+		else
+			dai->capture.formats = SNDRV_PCM_FMTBIT_S16_LE |
+					       SNDRV_PCM_FMTBIT_S32_LE;
+	}
+
+	return 0;
+}
 
 static const struct snd_soc_component_driver omap_mcbsp_component = {
 	.name		= "omap-mcbsp",
@@ -1409,18 +1440,17 @@ static int asoc_mcbsp_probe(struct platform_device *pdev)
 	mcbsp->dev = &pdev->dev;
 	platform_set_drvdata(pdev, mcbsp);
 
-	ret = omap_mcbsp_init(pdev);
+	ret = omap_mcbsp_init_dais(mcbsp);
 	if (ret)
 		return ret;
 
-	if (mcbsp->pdata->reg_size == 2) {
-		omap_mcbsp_dai.playback.formats = SNDRV_PCM_FMTBIT_S16_LE;
-		omap_mcbsp_dai.capture.formats = SNDRV_PCM_FMTBIT_S16_LE;
-	}
+	ret = omap_mcbsp_init(pdev);
+	if (ret)
+		return ret;
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &omap_mcbsp_component,
-					      &omap_mcbsp_dai, 1);
+					      mcbsp->dais, mcbsp->dai_count);
 	if (ret)
 		return ret;
 
-- 
2.25.0
