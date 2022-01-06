Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6861485E39
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jan 2022 02:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344441AbiAFBrs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Jan 2022 20:47:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344427AbiAFBrs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Jan 2022 20:47:48 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D945C061245
        for <linux-omap@vger.kernel.org>; Wed,  5 Jan 2022 17:47:48 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id v25so1246413pge.2
        for <linux-omap@vger.kernel.org>; Wed, 05 Jan 2022 17:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:message-id:from:to:cc:subject:in-reply-to:references
         :user-agent:mime-version;
        bh=kGTtXLmDukQtz222Ljig5iopGJyU8skFVNAfTmE/IFc=;
        b=aa8jgNFx4BVipQsCHmiyRRtsqvv5AgfSQrR12g3sIcx3TmiuIQlv8fMNY8Q1BNQKdf
         SvDAvM+y+CRos2qCUlKy8ZLOp5b2sjwSTEmCeaKrxvsfKHdyEF/TThsexBuEsnWhipDF
         Y2eH4rjr/IBAfMeAZV3Oa+RqJa6vpmHx6kB5zJOXk2joHTvLGgq/5MnItPcpZnpQPQcp
         Hv0WYIIGEzDF42Dq9bzkiCPo5fMGry7JgyArr+SQyk80DLydQM2oeCV1KjjZ/tRLK4Xd
         Faoz1u0N2xYBL6ImCqFIddciAIWZUVBK6aJWcfWB96Eco3LbGBA9Zr00lIqhXljtuzjh
         k7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:from:to:cc:subject:in-reply-to
         :references:user-agent:mime-version;
        bh=kGTtXLmDukQtz222Ljig5iopGJyU8skFVNAfTmE/IFc=;
        b=nSKktV+6fBg6714NLH9IWF9zvUIAWhHThQjisFFVJ/OAKp8CF/n2BZN4+TtioKGQln
         DXaaZPTg83w5PnNRrOrKk1iy6vyBXLCkDhbWrmaOuP0s9kRci5C6+0D0XlJQyOcJHb5b
         IFDDyJMzBOHuiHIm0Vn5pDwTb1yojB0N/9Z0Zkkxq0wAq5jjh42n3+ZSsxvD/2UcTpSY
         JaCjYvEu0nCo6ILFx/WDGS2Bl3rA1D1JMVvAxjCzqruW2c2HMVmt3K0TbR5hO/Nyn+G7
         9UNiiVMJ/tjLpjbzll9O4ArpxCa1qtouGs1yFUmqPF9QEyU8dd23yNUQUc0IvTUCM/bg
         CCFw==
X-Gm-Message-State: AOAM532lulCRtVS3SbzhE5O9mBc3x8z6X/Kb7R+56lp+o247Qc8isdB+
        8YRShaXAvyGqWjVhJ94s0vP82Vgwjd9vOg==
X-Google-Smtp-Source: ABdhPJxC8tsPyX/ozOiRrrWLhtVCxmwrmHdlw1DmEoI3KVvy1EUNAqYl8R7ZJ1vFDnsYK6Bz+WD/DA==
X-Received: by 2002:a63:2c06:: with SMTP id s6mr49334340pgs.55.1641433667631;
        Wed, 05 Jan 2022 17:47:47 -0800 (PST)
Received: from venus.gmail.com ([150.249.232.163])
        by smtp.gmail.com with ESMTPSA id t10sm325002pfg.105.2022.01.05.17.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 17:47:47 -0800 (PST)
Date:   Wed, 05 Jan 2022 17:47:47 -0800 (PST)
Message-ID: <87r19ld48v.wl-kuninori.morimoto.gx@gmail.com>
From:   kuninori.morimoto.gx@gmail.com
To:     Carl Philipp Klemm <philipp@uvos.xyz>
Cc:     alsa-devel@alsa-project.org, merlijn@wizzup.org, tony@atomide.com,
        sre@kernel.org, linux-omap@vger.kernel.org,
        kuninori.morimoto.gx@renesas.com
Subject: Re: [RFC PATCH 1/3] ASoC: simple-card-utils: add support for componants provideing jack events via set_jack
In-Reply-To: <20220105101028.620b7f2cb7727eedfccd933e@uvos.xyz>
References: <20211228190931.df5d518220080a734532ebfd@uvos.xyz>
        <87a6gawxpe.wl-kuninori.morimoto.gx@gmail.com>
        <20220105101028.620b7f2cb7727eedfccd933e@uvos.xyz>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


Hi Carl

> Yes, so asoc-audio-graph-card currently only supports headphone jack plug
> detection on devices that provide a simple gpio to sense plug state. The
> intent of this patch is to allow the componant driver to implement jack
> detection in cases where something else has to be done to sense state,
> sutch as comunicating with device firmware or using a shared irq. See
> the other patches in this series for an example. This is performed by
> sharing the jack with the component via set_jack().

OK, I see.
It seems other drivers are using dai_link->init for detecting and set_jack().

I guess we can call set_jack() at asoc_simple_init_jack() and
call asoc_simple_init_hp() at dai_link->init ?

It is not tested, but I added sample code below.
I hope my understanding was correct and it solves your issue.

> sutch as comunicating with device firmware or using a shared irq. See
> the other patches in this series for an example. This is performed by

I now noticed that I had mailing list issue...

Thank you for your help !!

-----------
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: simple_card_utils: call snd_soc_component_set_jack() at
 asoc_simple_init_jack()

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

This patch do
(a) call set_jack() (= Y) at asoc_simple_init_jack() (= X) which is
    used to detect HP/MIC.
(b) call it from dai_link->init timing (= B) instead of card->probe
    timing (= A).
(c) remove card->init (= A) timing function from
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

Reported-by: Carl Philipp Klemm <philipp@uvos.xyz>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h             |  2 +-
 sound/soc/generic/audio-graph-card.c          |  3 +-
 .../generic/audio-graph-card2-custom-sample.c |  3 +-
 sound/soc/generic/audio-graph-card2.c         |  3 +-
 sound/soc/generic/simple-card-utils.c         | 14 ++++++-
 sound/soc/generic/simple-card.c               | 40 ++++++++++---------
 sound/soc/tegra/tegra_audio_graph_card.c      |  2 +-
 7 files changed, 39 insertions(+), 28 deletions(-)

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
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 2b598af8feef..456db1f894af 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -259,7 +259,7 @@ static int graph_link_init(struct asoc_simple_priv *priv,
 	if (ret < 0)
 		return ret;
 
-	dai_link->init		= asoc_simple_dai_init;
+	dai_link->init		= asoc_graph_dai_init;
 	dai_link->ops		= &graph_ops;
 	if (priv->ops)
 		dai_link->ops	= priv->ops;
@@ -716,7 +716,6 @@ static int graph_probe(struct platform_device *pdev)
 	card = simple_priv_to_card(priv);
 	card->dapm_widgets	= graph_dapm_widgets;
 	card->num_dapm_widgets	= ARRAY_SIZE(graph_dapm_widgets);
-	card->probe		= asoc_graph_card_probe;
 
 	if (of_device_get_match_data(dev))
 		priv->dpcm_selectable = 1;
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
index c3947347dda3..75a1aeb75d2c 100644
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
index 850e968677f1..398fc4cb1d07 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -588,6 +588,8 @@ int asoc_simple_init_jack(struct snd_soc_card *card,
 		return -EPROBE_DEFER;
 
 	if (gpio_is_valid(det)) {
+		struct snd_soc_component *component;
+
 		sjack->pin.pin		= pin_name;
 		sjack->pin.mask		= mask;
 
@@ -603,6 +605,9 @@ int asoc_simple_init_jack(struct snd_soc_card *card,
 
 		snd_soc_jack_add_gpios(&sjack->jack, 1,
 				       &sjack->gpio);
+
+		for_each_card_components(card, component)
+			snd_soc_component_set_jack(component, &sjack->jack, NULL);
 	}
 
 	return 0;
@@ -758,11 +763,16 @@ int asoc_simple_remove(struct platform_device *pdev)
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
@@ -773,7 +783,7 @@ int asoc_graph_card_probe(struct snd_soc_card *card)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(asoc_graph_card_probe);
+EXPORT_SYMBOL_GPL(asoc_graph_dai_init);
 
 int asoc_graph_is_ports0(struct device_node *np)
 {
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index a89d1cfdda32..e76bfae6ced4 100644
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
2.25.1


Best regards
---
Kuninori Morimoto
