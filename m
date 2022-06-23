Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE6AA557B3A
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jun 2022 14:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbiFWMx7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jun 2022 08:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231954AbiFWMxy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jun 2022 08:53:54 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F90D2D1FD;
        Thu, 23 Jun 2022 05:53:53 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N6FQeV013924;
        Thu, 23 Jun 2022 07:53:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=sW35yMEAhpqMwtioXqY0ldNVVBynIZiI7vWJLow7w50=;
 b=SNIty/+a5PD2in5/4yFUi5XQ8k7xZyb308pjML2dpyd45Ci3EvI2o+88zPkxFiqN5N7q
 2R7vt39nW1fUjv6rhWrC/vBuXRj54I+iY3XSSq5iEs32boXTDXz7G07u/qqudFNdltbs
 p/S0vAvX8AOOj7RcOdewXX5nFDQuZHSMrGGmCVo3OGezOiWRnrt3oJRQQLMQp/nXMJpc
 9TJZVDNS7mXyyV8eTn8MxjXeWJP0PtleYi3HQZOy10bZ9KLPmmVcThtF6PiX4/obGD34
 uEaXzZnC5C08wvPCfb9XggrYOIPctAqbrIOStjuurgE/l1vivvYMbCUOJ6r5S1hPv6n0 IQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4x-7
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 23 Jun 2022 07:53:08 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:56 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:56 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 43EAC11D3;
        Thu, 23 Jun 2022 12:52:56 +0000 (UTC)
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
Subject: [PATCH v2 62/96] ASoC: tlv320*: Remove now redundant non_legacy_dai_naming flag
Date:   Thu, 23 Jun 2022 13:52:16 +0100
Message-ID: <20220623125250.2355471-63-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 1dni_xI6Xv_G90iMp3275GmL6Pymmw0c
X-Proofpoint-ORIG-GUID: 1dni_xI6Xv_G90iMp3275GmL6Pymmw0c
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The ASoC core has now been changed to default to the non-legacy DAI
naming, as such drivers using the new scheme no longer need to specify
the non_legacy_dai_naming flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/tlv320adcx140.c | 1 -
 sound/soc/codecs/tlv320aic23.c   | 1 -
 sound/soc/codecs/tlv320aic26.c   | 1 -
 sound/soc/codecs/tlv320aic31xx.c | 1 -
 sound/soc/codecs/tlv320aic32x4.c | 2 --
 sound/soc/codecs/tlv320aic3x.c   | 1 -
 sound/soc/codecs/tlv320dac33.c   | 1 -
 7 files changed, 8 deletions(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index de5b184a701ef..6618ac4a7d5c8 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -1053,7 +1053,6 @@ static const struct snd_soc_component_driver soc_codec_driver_adcx140 = {
 	.idle_bias_on		= 0,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static struct snd_soc_dai_driver adcx140_dai_driver[] = {
diff --git a/sound/soc/codecs/tlv320aic23.c b/sound/soc/codecs/tlv320aic23.c
index c86ca793a2b66..c47aa4d4162dd 100644
--- a/sound/soc/codecs/tlv320aic23.c
+++ b/sound/soc/codecs/tlv320aic23.c
@@ -586,7 +586,6 @@ static const struct snd_soc_component_driver soc_component_dev_tlv320aic23 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 int tlv320aic23_probe(struct device *dev, struct regmap *regmap)
diff --git a/sound/soc/codecs/tlv320aic26.c b/sound/soc/codecs/tlv320aic26.c
index f85f8061639f3..8bae4b4750688 100644
--- a/sound/soc/codecs/tlv320aic26.c
+++ b/sound/soc/codecs/tlv320aic26.c
@@ -331,7 +331,6 @@ static const struct snd_soc_component_driver aic26_soc_component_dev = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config aic26_regmap = {
diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index aacee23679924..0847302121f6e 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -1417,7 +1417,6 @@ static const struct snd_soc_component_driver soc_codec_driver_aic31xx = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_dai_ops aic31xx_dai_ops = {
diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index a8e6adf62ac82..4b74805cdd2e5 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -1077,7 +1077,6 @@ static const struct snd_soc_component_driver soc_component_dev_aic32x4 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_kcontrol_new aic32x4_tas2505_snd_controls[] = {
@@ -1199,7 +1198,6 @@ static const struct snd_soc_component_driver soc_component_dev_aic32x4_tas2505 =
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int aic32x4_parse_dt(struct aic32x4_priv *aic32x4,
diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index 610e41bbf388c..08938801daec2 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -1697,7 +1697,6 @@ static const struct snd_soc_component_driver soc_component_dev_aic3x = {
 	.num_dapm_routes	= ARRAY_SIZE(intercon),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static void aic3x_configure_ocmv(struct device *dev, struct aic3x_priv *aic3x)
diff --git a/sound/soc/codecs/tlv320dac33.c b/sound/soc/codecs/tlv320dac33.c
index 371026eb8f41b..17ae3b1d96fb4 100644
--- a/sound/soc/codecs/tlv320dac33.c
+++ b/sound/soc/codecs/tlv320dac33.c
@@ -1431,7 +1431,6 @@ static const struct snd_soc_component_driver soc_component_dev_tlv320dac33 = {
 	.num_dapm_routes	= ARRAY_SIZE(audio_map),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 #define DAC33_RATES	(SNDRV_PCM_RATE_44100 | \
-- 
2.30.2

