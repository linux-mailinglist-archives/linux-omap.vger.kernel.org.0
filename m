Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5E754E60A
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jun 2022 17:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377921AbiFPP2L (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jun 2022 11:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377895AbiFPP2D (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jun 2022 11:28:03 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 535362497E
        for <linux-omap@vger.kernel.org>; Thu, 16 Jun 2022 08:27:58 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id y32so2747617lfa.6
        for <linux-omap@vger.kernel.org>; Thu, 16 Jun 2022 08:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yyP2OnOaFO8Lwdg1Y56RBPYvRwwhxDCK+DbFi5xi7Ps=;
        b=YQYub0KDIa58AYv3kblBACn8wRgDpS2mXU4FlDFxY6ovjNN191ACcewnTjgf+JM+WO
         yYIG+8+lNRdegGLx74AUOvCMfW3FJUbZz0ewjO6m2ikJtdE5HaSyJrIXPGJznCwwi0KR
         CU7NoYIByZqS9SZL1C+29PKbnkaHjsSzZZ4p7MRpdzt4K3evmmdw0DQIKNsnwdCLdyCV
         0E4LtcEGUl+bWTajl+9YneYGygJ2Nw5Vlaij9NiB19QIy+mkOUGQYI0kK+Pc69unTzBY
         Z/e0mJ3e1fK+LMqFu3+sxLHe7ByIU63XfinZj/yTCd9/guJNMEzoucXtq47P6Bi3wM48
         Q/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yyP2OnOaFO8Lwdg1Y56RBPYvRwwhxDCK+DbFi5xi7Ps=;
        b=Uq/nruc1TWMLvkazhIXOzhwFOI/YW2/d2m/4drqhkX5qs6Q7mAMePMMXUVnVcYjHcJ
         Pe9Dbb9uO9rL6XUJAl+znrMg7vda0qL6Sd8qo0a+pfQwfw4OQOsX8rwAYYT46P//QdvX
         gqyZrYekWUL56IN9AqzWzLWr/KxZHRMvBoKIeNuVE2VhKg2PILagNowKYnNkfTkY35md
         I7ppKA5ZyRn0CNfOKn2fiHDd1dEAJSXEQWN8hwbKBpTGkhjlLm9rEHYQYYIubxwRPRXT
         Ee1KtesLE/WiUkxUC4k4npud8aAheGu5FhbkFJPEGTJ/ByLNbGzeyje3YivRN1d4sIbi
         Ab/A==
X-Gm-Message-State: AJIora89LoZYqH9djLfEEtbSvB17GJOgXbjc/nxpaLdLxtryiukaCRgN
        XGiWYIHlOOuygW7OGYQlkiMNymF/riUYzFNVYLs=
X-Google-Smtp-Source: AGRyM1tFzdpLoG1ijcroywh1PKYhiDvhAKEMwaSKImTkGPFQl/3wROgYejt63zJEnLkgCKCGZJ8g8w==
X-Received: by 2002:a05:6512:1308:b0:47d:b9cc:ee88 with SMTP id x8-20020a056512130800b0047db9ccee88mr3037397lfu.680.1655393276957;
        Thu, 16 Jun 2022 08:27:56 -0700 (PDT)
Received: from localhost.localdomain (91-159-150-230.elisa-laajakaista.fi. [91.159.150.230])
        by smtp.gmail.com with ESMTPSA id t27-20020a192d5b000000b0047dab95a0d5sm274808lft.109.2022.06.16.08.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 08:27:56 -0700 (PDT)
From:   Peter Ujfalusi <peter.ujfalusi@gmail.com>
To:     lgirdwood@gmail.com, broonie@kernel.org
Cc:     tony@atomide.com, linux-omap@vger.kernel.org,
        alsa-devel@alsa-project.org, aaro.koskinen@iki.fi,
        jarkko.nikula@bitmer.com
Subject: [PATCH] ASoC: twl4030: Drop legacy, non DT boot support
Date:   Thu, 16 Jun 2022 18:35:21 +0300
Message-Id: <20220616153521.29701-1-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Legacy or non DT boot is no longer possible on systems where the
tw4030/5030 is used.

Drop the support for handling legacy pdata and replace it with a local
board_params struct to allow further cleanups on the mfd side.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
 sound/soc/codecs/twl4030.c | 101 ++++++++++++++++++++-----------------
 1 file changed, 54 insertions(+), 47 deletions(-)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index 0ba3546ef870..87b58017094b 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -34,6 +34,14 @@
 
 #define TWL4030_CACHEREGNUM	(TWL4030_REG_MISC_SET_2 + 1)
 
+struct twl4030_board_params {
+	unsigned int digimic_delay; /* in ms */
+	unsigned int ramp_delay_value;
+	unsigned int offset_cncl_path;
+	unsigned int hs_extmute:1;
+	int hs_extmute_gpio;
+};
+
 /* codec private data */
 struct twl4030_priv {
 	unsigned int codec_powered;
@@ -58,7 +66,7 @@ struct twl4030_priv {
 	u8 carkitl_enabled, carkitr_enabled;
 	u8 ctl_cache[TWL4030_REG_PRECKR_CTL - TWL4030_REG_EAR_CTL + 1];
 
-	struct twl4030_codec_data *pdata;
+	struct twl4030_board_params *board_params;
 };
 
 static void tw4030_init_ctl_cache(struct twl4030_priv *twl4030)
@@ -193,73 +201,71 @@ static void twl4030_codec_enable(struct snd_soc_component *component, int enable
 	udelay(10);
 }
 
-static void twl4030_setup_pdata_of(struct twl4030_codec_data *pdata,
-				   struct device_node *node)
+static void
+twl4030_get_board_param_values(struct twl4030_board_params *board_params,
+			       struct device_node *node)
 {
 	int value;
 
-	of_property_read_u32(node, "ti,digimic_delay",
-			     &pdata->digimic_delay);
-	of_property_read_u32(node, "ti,ramp_delay_value",
-			     &pdata->ramp_delay_value);
-	of_property_read_u32(node, "ti,offset_cncl_path",
-			     &pdata->offset_cncl_path);
+	of_property_read_u32(node, "ti,digimic_delay", &board_params->digimic_delay);
+	of_property_read_u32(node, "ti,ramp_delay_value", &board_params->ramp_delay_value);
+	of_property_read_u32(node, "ti,offset_cncl_path", &board_params->offset_cncl_path);
 	if (!of_property_read_u32(node, "ti,hs_extmute", &value))
-		pdata->hs_extmute = value;
+		board_params->hs_extmute = value;
 
-	pdata->hs_extmute_gpio = of_get_named_gpio(node,
-						   "ti,hs_extmute_gpio", 0);
-	if (gpio_is_valid(pdata->hs_extmute_gpio))
-		pdata->hs_extmute = 1;
+	board_params->hs_extmute_gpio = of_get_named_gpio(node, "ti,hs_extmute_gpio", 0);
+	if (gpio_is_valid(board_params->hs_extmute_gpio))
+		board_params->hs_extmute = 1;
 }
 
-static struct twl4030_codec_data *twl4030_get_pdata(struct snd_soc_component *component)
+static struct twl4030_board_params*
+twl4030_get_board_params(struct snd_soc_component *component)
 {
-	struct twl4030_codec_data *pdata = dev_get_platdata(component->dev);
+	struct twl4030_board_params *board_params = NULL;
 	struct device_node *twl4030_codec_node = NULL;
 
 	twl4030_codec_node = of_get_child_by_name(component->dev->parent->of_node,
 						  "codec");
 
-	if (!pdata && twl4030_codec_node) {
-		pdata = devm_kzalloc(component->dev,
-				     sizeof(struct twl4030_codec_data),
-				     GFP_KERNEL);
-		if (!pdata) {
+	if (twl4030_codec_node) {
+		board_params = devm_kzalloc(component->dev,
+					    sizeof(struct twl4030_board_params),
+					    GFP_KERNEL);
+		if (!board_params) {
 			of_node_put(twl4030_codec_node);
 			return NULL;
 		}
-		twl4030_setup_pdata_of(pdata, twl4030_codec_node);
+		twl4030_get_board_param_values(board_params, twl4030_codec_node);
 		of_node_put(twl4030_codec_node);
 	}
 
-	return pdata;
+	return board_params;
 }
 
 static void twl4030_init_chip(struct snd_soc_component *component)
 {
-	struct twl4030_codec_data *pdata;
+	struct twl4030_board_params *board_params;
 	struct twl4030_priv *twl4030 = snd_soc_component_get_drvdata(component);
 	u8 reg, byte;
 	int i = 0;
 
-	pdata = twl4030_get_pdata(component);
+	board_params = twl4030_get_board_params(component);
 
-	if (pdata && pdata->hs_extmute) {
-		if (gpio_is_valid(pdata->hs_extmute_gpio)) {
+	if (board_params && board_params->hs_extmute) {
+		if (gpio_is_valid(board_params->hs_extmute_gpio)) {
 			int ret;
 
-			if (!pdata->hs_extmute_gpio)
+			if (!board_params->hs_extmute_gpio)
 				dev_warn(component->dev,
 					"Extmute GPIO is 0 is this correct?\n");
 
-			ret = gpio_request_one(pdata->hs_extmute_gpio,
+			ret = gpio_request_one(board_params->hs_extmute_gpio,
 					       GPIOF_OUT_INIT_LOW,
 					       "hs_extmute");
 			if (ret) {
 				dev_err(component->dev,
 					"Failed to get hs_extmute GPIO\n");
-				pdata->hs_extmute_gpio = -1;
+				board_params->hs_extmute_gpio = -1;
 			}
 		} else {
 			u8 pin_mux;
@@ -290,14 +296,14 @@ static void twl4030_init_chip(struct snd_soc_component *component)
 	twl4030_write(component, TWL4030_REG_ARXR2_APGA_CTL, 0x32);
 
 	/* Machine dependent setup */
-	if (!pdata)
+	if (!board_params)
 		return;
 
-	twl4030->pdata = pdata;
+	twl4030->board_params = board_params;
 
 	reg = twl4030_read(component, TWL4030_REG_HS_POPN_SET);
 	reg &= ~TWL4030_RAMP_DELAY;
-	reg |= (pdata->ramp_delay_value << 2);
+	reg |= (board_params->ramp_delay_value << 2);
 	twl4030_write(component, TWL4030_REG_HS_POPN_SET, reg);
 
 	/* initiate offset cancellation */
@@ -305,7 +311,7 @@ static void twl4030_init_chip(struct snd_soc_component *component)
 
 	reg = twl4030_read(component, TWL4030_REG_ANAMICL);
 	reg &= ~TWL4030_OFFSET_CNCL_SEL;
-	reg |= pdata->offset_cncl_path;
+	reg |= board_params->offset_cncl_path;
 	twl4030_write(component, TWL4030_REG_ANAMICL,
 		      reg | TWL4030_CNCL_OFFSET_START);
 
@@ -692,7 +698,7 @@ static void headset_ramp(struct snd_soc_component *component, int ramp)
 {
 	unsigned char hs_gain, hs_pop;
 	struct twl4030_priv *twl4030 = snd_soc_component_get_drvdata(component);
-	struct twl4030_codec_data *pdata = twl4030->pdata;
+	struct twl4030_board_params *board_params = twl4030->board_params;
 	/* Base values for ramp delay calculation: 2^19 - 2^26 */
 	unsigned int ramp_base[] = {524288, 1048576, 2097152, 4194304,
 				    8388608, 16777216, 33554432, 67108864};
@@ -705,9 +711,9 @@ static void headset_ramp(struct snd_soc_component *component, int ramp)
 
 	/* Enable external mute control, this dramatically reduces
 	 * the pop-noise */
-	if (pdata && pdata->hs_extmute) {
-		if (gpio_is_valid(pdata->hs_extmute_gpio)) {
-			gpio_set_value(pdata->hs_extmute_gpio, 1);
+	if (board_params && board_params->hs_extmute) {
+		if (gpio_is_valid(board_params->hs_extmute_gpio)) {
+			gpio_set_value(board_params->hs_extmute_gpio, 1);
 		} else {
 			hs_pop |= TWL4030_EXTMUTE;
 			twl4030_write(component, TWL4030_REG_HS_POPN_SET, hs_pop);
@@ -741,9 +747,9 @@ static void headset_ramp(struct snd_soc_component *component, int ramp)
 	}
 
 	/* Disable external mute */
-	if (pdata && pdata->hs_extmute) {
-		if (gpio_is_valid(pdata->hs_extmute_gpio)) {
-			gpio_set_value(pdata->hs_extmute_gpio, 0);
+	if (board_params && board_params->hs_extmute) {
+		if (gpio_is_valid(board_params->hs_extmute_gpio)) {
+			gpio_set_value(board_params->hs_extmute_gpio, 0);
 		} else {
 			hs_pop &= ~TWL4030_EXTMUTE;
 			twl4030_write(component, TWL4030_REG_HS_POPN_SET, hs_pop);
@@ -806,10 +812,10 @@ static int digimic_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct twl4030_priv *twl4030 = snd_soc_component_get_drvdata(component);
-	struct twl4030_codec_data *pdata = twl4030->pdata;
+	struct twl4030_board_params *board_params = twl4030->board_params;
 
-	if (pdata && pdata->digimic_delay)
-		twl4030_wait_ms(pdata->digimic_delay);
+	if (board_params && board_params->digimic_delay)
+		twl4030_wait_ms(board_params->digimic_delay);
 	return 0;
 }
 
@@ -2168,10 +2174,11 @@ static int twl4030_soc_probe(struct snd_soc_component *component)
 static void twl4030_soc_remove(struct snd_soc_component *component)
 {
 	struct twl4030_priv *twl4030 = snd_soc_component_get_drvdata(component);
-	struct twl4030_codec_data *pdata = twl4030->pdata;
+	struct twl4030_board_params *board_params = twl4030->board_params;
 
-	if (pdata && pdata->hs_extmute && gpio_is_valid(pdata->hs_extmute_gpio))
-		gpio_free(pdata->hs_extmute_gpio);
+	if (board_params && board_params->hs_extmute &&
+	    gpio_is_valid(board_params->hs_extmute_gpio))
+		gpio_free(board_params->hs_extmute_gpio);
 }
 
 static const struct snd_soc_component_driver soc_component_dev_twl4030 = {
-- 
2.36.1

