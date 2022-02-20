Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1D824BCB5A
	for <lists+linux-omap@lfdr.de>; Sun, 20 Feb 2022 01:38:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241921AbiBTAa6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 19 Feb 2022 19:30:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232470AbiBTAa5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 19 Feb 2022 19:30:57 -0500
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu [31.186.226.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE3A42A14
        for <linux-omap@vger.kernel.org>; Sat, 19 Feb 2022 16:30:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645316098; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=iHTfEyOMVKQCQUWTEkxAl7lD59sCRhIq4DcgSqMi+dBUaQI/XXXLG33RtXJUKF9uYLaXkGHujgROognsNWRqybGaRtAZyou1K//uu3TVVV6lLzIh4z7J2gQvreQKpPEdzz9U4oOH7eKa+E8VLW/t1ZgCS3a3QwWp0PMMfq5kejo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1645316098; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=I2SPFUqVbuiNnXgGeTuoa/g4+z6ufb1oWENl/qsaZ88=; 
        b=IihROJ3ugIWVGgG6QS7hYdrzkUhhCaxoTv4Js1Pbl4Pjqi9ogFgL11i+1z5Yh08Gv6qVoiLEQHUARzH9MYceGANS4oFR2a4jAr1ApBdVdWVd5i89IAuxdE5/b7jxknrgAbhPu3fT/quDassy3sngUBlfXjDvU26g/tjYN5lA0S0=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (ip-037-201-192-120.um10.pools.vodafone-ip.de [37.201.192.120]) by mx.zoho.eu
        with SMTPS id 1645316096336579.5571665667055; Sun, 20 Feb 2022 01:14:56 +0100 (CET)
Date:   Sun, 20 Feb 2022 01:14:54 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     "kuninori.morimoto.gx@gmail.com" <kuninori.morimoto.gx@gmail.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "merlijn@wizzup.org" <merlijn@wizzup.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "sre@kernel.org" <sre@kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: [PATCH 1/6] ASoC: simple_card_utils: call
 snd_soc_component_set_jack() at asoc_simple_init_jack()
Message-Id: <20220220011454.34b190c26487faa18c16e4d2@uvos.xyz>
In-Reply-To: <OS3PR01MB8426FD3FD1B45BB31C971A56D4509@OS3PR01MB8426.jpnprd01.prod.outlook.com>
References: <20211228190931.df5d518220080a734532ebfd@uvos.xyz>
        <87a6gawxpe.wl-kuninori.morimoto.gx@gmail.com>
        <20220105101028.620b7f2cb7727eedfccd933e@uvos.xyz>
        <87r19ld48v.wl-kuninori.morimoto.gx@gmail.com>
        <20220108145749.f55500222b049f344415a5c3@uvos.xyz>
        <OS3PR01MB8426FD3FD1B45BB31C971A56D4509@OS3PR01MB8426.jpnprd01.prod.outlook.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,FROM_SUSPICIOUS_NTLD,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Current simple-card / audio-graph-card are detecting HP/MIC at card->probe
timing (= A), and not calling snd_soc_component_set_jack() for it.
Other sound card drivers are using dai_link->init timing (= B) for
both detecting and set_jack().

	static int snd_soc_bind_card(...)
	{
		....
(A)		ret = snd_soc_card_probe(card);
		...
		for_each_card_rtds(card, rtd) {
(B)			ret = soc_init_pcm_runtime(card, rtd);
			...
		}
		...
	}

This patch
(a) calls set_jack() (= Y) at asoc_simple_init_jack() (= X) which is
    used to detect HP/MIC.
(b) calls it from dai_link->init timing (= B) instead of card->probe
    timing (= A).
(c) allows  non-gpio jacks to be reported by a componant give it via
    snd_soc_component_set_jack if a of node defined by the driver is set
(d) remove card->init (= A) timing function from
    simple-card / audio-graph-card.

(X)	int asoc_simple_init_jack(...)
	{
		...
		if (gpio_is_valid(det)) {
			...

			snd_soc_card_jack_new(...);
			snd_soc_jack_add_gpios(...);
			for_each_card_components(card, component)
(Y)				snd_soc_component_set_jack(component, ...);
		}
		...
	}

One note here is that simple-card needs PREFIX to detecting HP/MIC,
but it is not needed on audio-graph-card.
Thus simple-card uses local function for it, and audio-graph-card is
using global function and sharing the code with
audio-graph-card / audio-graph-card2 / audio-graph-card2-custom-sample /
tegra_audio_graph_card.

Co-Developed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 include/sound/simple_card_utils.h             |  2 +-
 .../generic/audio-graph-card2-custom-sample.c |  3 +-
 sound/soc/generic/audio-graph-card2.c         |  3 +-
 sound/soc/generic/simple-card-utils.c         | 20 +++++++++-
 sound/soc/generic/simple-card.c               | 40 ++++++++++---------
 sound/soc/tegra/tegra_audio_graph_card.c      |  2 +-
 6 files changed, 44 insertions(+), 26 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index df430f1c2a10..34891da5a0fa 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -182,7 +182,7 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 			       struct link_info *li);
 int asoc_simple_remove(struct platform_device *pdev);
 
-int asoc_graph_card_probe(struct snd_soc_card *card);
+int asoc_graph_dai_init(struct snd_soc_pcm_runtime *rtd);
 int asoc_graph_is_ports0(struct device_node *port);
 
 #ifdef DEBUG
diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.c b/sound/soc/generic/audio-graph-card2-custom-sample.c
index 4a2c743e286c..da6cb69faa8d 100644
--- a/sound/soc/generic/audio-graph-card2-custom-sample.c
+++ b/sound/soc/generic/audio-graph-card2-custom-sample.c
@@ -34,8 +34,7 @@ static int custom_card_probe(struct snd_soc_card *card)
 
 	custom_priv->custom_params = 1;
 
-	/* you can use generic probe function */
-	return asoc_graph_card_probe(card);
+	return 0;
 }
 
 static int custom_hook_pre(struct asoc_simple_priv *priv)
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index b6049bcfb771..dacf158389f9 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -710,7 +710,7 @@ static void graph_link_init(struct asoc_simple_priv *priv,
 		daiclk = snd_soc_daifmt_clock_provider_fliped(daiclk);
 
 	dai_link->dai_fmt	= daifmt | daiclk;
-	dai_link->init		= asoc_simple_dai_init;
+	dai_link->init		= asoc_graph_dai_init;
 	dai_link->ops		= &graph_ops;
 	if (priv->ops)
 		dai_link->ops	= priv->ops;
@@ -1180,7 +1180,6 @@ int audio_graph2_parse_of(struct asoc_simple_priv *priv, struct device *dev,
 	if (!li)
 		return -ENOMEM;
 
-	card->probe	= asoc_graph_card_probe;
 	card->owner	= THIS_MODULE;
 	card->dev	= dev;
 
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 850e968677f1..a135c85584df 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -588,6 +588,8 @@ int asoc_simple_init_jack(struct snd_soc_card *card,
 		return -EPROBE_DEFER;
 
 	if (gpio_is_valid(det)) {
+		struct snd_soc_component *component;
+
 		sjack->pin.pin		= pin_name;
 		sjack->pin.mask		= mask;
 
@@ -603,6 +605,15 @@ int asoc_simple_init_jack(struct snd_soc_card *card,
 
 		snd_soc_jack_add_gpios(&sjack->jack, 1,
 				       &sjack->gpio);
+
+		for_each_card_components(card, component)
+			snd_soc_component_set_jack(component, &sjack->jack, NULL);
+	} else if (of_property_read_bool(dev->of_node, prefix)) {
+		snd_soc_card_jack_new(card, pin_name, mask,
+				      &sjack->jack,
+				      &sjack->pin, 1);
+		for_each_card_components(card, component)
+			snd_soc_component_set_jack(component, &sjack->jack, NULL);
 	}
 
 	return 0;
@@ -758,11 +769,16 @@ int asoc_simple_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(asoc_simple_remove);
 
-int asoc_graph_card_probe(struct snd_soc_card *card)
+int asoc_graph_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
+	struct snd_soc_card *card = rtd->card;
 	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(card);
 	int ret;
 
+	ret = asoc_simple_dai_init(rtd);
+	if (ret < 0)
+		return ret;
+
 	ret = asoc_simple_init_hp(card, &priv->hp_jack, NULL);
 	if (ret < 0)
 		return ret;
@@ -773,7 +789,7 @@ int asoc_graph_card_probe(struct snd_soc_card *card)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(asoc_graph_card_probe);
+EXPORT_SYMBOL_GPL(asoc_graph_dai_init);
 
 int asoc_graph_is_ports0(struct device_node *np)
 {
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index a3a7990b5cb6..0ead77c40a30 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -149,6 +149,27 @@ static int simple_parse_node(struct asoc_simple_priv *priv,
 	return 0;
 }
 
+static int simple_dai_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(card);
+	int ret;
+
+	ret = asoc_simple_dai_init(rtd);
+	if (ret < 0)
+		return ret;
+
+	ret = asoc_simple_init_hp(card, &priv->hp_jack, PREFIX);
+	if (ret < 0)
+		return ret;
+
+	ret = asoc_simple_init_mic(card, &priv->mic_jack, PREFIX);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static int simple_link_init(struct asoc_simple_priv *priv,
 			    struct device_node *node,
 			    struct device_node *codec,
@@ -164,7 +185,7 @@ static int simple_link_init(struct asoc_simple_priv *priv,
 	if (ret < 0)
 		return 0;
 
-	dai_link->init			= asoc_simple_dai_init;
+	dai_link->init			= simple_dai_init;
 	dai_link->ops			= &simple_ops;
 
 	return asoc_simple_set_dailink_name(dev, dai_link, name);
@@ -587,22 +608,6 @@ static int simple_get_dais_count(struct asoc_simple_priv *priv,
 				    simple_count_dpcm);
 }
 
-static int simple_soc_probe(struct snd_soc_card *card)
-{
-	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(card);
-	int ret;
-
-	ret = asoc_simple_init_hp(card, &priv->hp_jack, PREFIX);
-	if (ret < 0)
-		return ret;
-
-	ret = asoc_simple_init_mic(card, &priv->mic_jack, PREFIX);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
 static int asoc_simple_probe(struct platform_device *pdev)
 {
 	struct asoc_simple_priv *priv;
@@ -620,7 +625,6 @@ static int asoc_simple_probe(struct platform_device *pdev)
 	card = simple_priv_to_card(priv);
 	card->owner		= THIS_MODULE;
 	card->dev		= dev;
-	card->probe		= simple_soc_probe;
 	card->driver_name       = "simple-card";
 
 	li = devm_kzalloc(dev, sizeof(*li), GFP_KERNEL);
diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
index 1f2c5018bf5a..404762d40389 100644
--- a/sound/soc/tegra/tegra_audio_graph_card.c
+++ b/sound/soc/tegra/tegra_audio_graph_card.c
@@ -184,7 +184,7 @@ static int tegra_audio_graph_card_probe(struct snd_soc_card *card)
 		return PTR_ERR(priv->clk_plla_out0);
 	}
 
-	return asoc_graph_card_probe(card);
+	return 0;
 }
 
 static int tegra_audio_graph_probe(struct platform_device *pdev)
-- 
2.35.1
