Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD071480C5A
	for <lists+linux-omap@lfdr.de>; Tue, 28 Dec 2021 19:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbhL1SJ4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Dec 2021 13:09:56 -0500
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21106 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbhL1SJ4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Dec 2021 13:09:56 -0500
X-Greylist: delayed 770 seconds by postgrey-1.27 at vger.kernel.org; Tue, 28 Dec 2021 13:09:56 EST
ARC-Seal: i=1; a=rsa-sha256; t=1640714974; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=b+2at6/dS3v78Y4eHWBZ+2wS9KgpDxcfg90OGlhKXFSnZpa1Iy7LrzS41PAghefXVdxUWhrLSlgAajpDxXVhVk3gkwA8uVLGCfG6PjhGbFJD/EBYmvyrbMIduCYJuvbsbWov3l6VjuRUPcDNSFUjT5QGFvY82Ej5fimGi4sHVY8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1640714974; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=oynB9R8k0PLl1IH46elp4NZHwnEBnjiXaZcMGJZ+cRY=; 
        b=EJoBw4b5ePgr40U5SjGlpKS2nEGxPrKIrV9RZRwOx6vYwkXJBvzGcTfOnR/ql9qzKm03QSDuUyDX+q4gBupGbpVEhS+Nr78rE/z+Yi4Lez7GOxkjl7S3jJDLB5eEZ7+1gUJ0IuPgnLcTBqsIzHZONcEkCu4dYY18zcH22VY+f30=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (aftr-37-201-192-113.unity-media.net [37.201.192.113]) by mx.zoho.eu
        with SMTPS id 1640714972300267.32556141033467; Tue, 28 Dec 2021 19:09:32 +0100 (CET)
Date:   Tue, 28 Dec 2021 19:09:31 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     alsa-devel@alsa-project.org
Cc:     merlijn@wizzup.org, tony@atomide.com, sre@kernel.org,
        linux-omap@vger.kernel.org, kuninori.morimoto.gx@renesas.com
Subject: [RFC PATCH 1/3] ASoC: simple-card-utils: add support for componants
 provideing jack events via set_jack
Message-Id: <20211228190931.df5d518220080a734532ebfd@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This allows componants that want a jack to report state on to do so by calling
set_jack on components implementing this function.

Im not entirely sure this is the right way to do this so RFC

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 include/sound/simple_card_utils.h     |  6 ++--
 sound/soc/generic/simple-card-utils.c | 47 +++++++++++++++++++--------
 2 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 51b3b485a92e..547ad537613d 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -57,8 +57,8 @@ struct asoc_simple_priv {
 		struct prop_nums num;
 		unsigned int mclk_fs;
 	} *dai_props;
-	struct asoc_simple_jack hp_jack;
-	struct asoc_simple_jack mic_jack;
+	struct asoc_simple_jack *hp_jack;
+	struct asoc_simple_jack *mic_jack;
 	struct snd_soc_dai_link *dai_link;
 	struct asoc_simple_dai *dais;
 	struct snd_soc_dai_link_component *dlcs;
@@ -173,7 +173,7 @@ int asoc_simple_parse_pin_switches(struct snd_soc_card *card,
 				   char *prefix);
 
 int asoc_simple_init_jack(struct snd_soc_card *card,
-			       struct asoc_simple_jack *sjack,
+			       struct asoc_simple_jack **sjack,
 			       int is_hp, char *prefix, char *pin);
 int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 			       struct link_info *li);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 10c63b73900c..1899feba16cc 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -395,6 +395,7 @@ int asoc_simple_dai_init(struct snd_soc_pcm_runtime *rtd)
 	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->num);
 	struct asoc_simple_dai *dai;
+	struct snd_soc_component *component;
 	int i, ret;
 
 	for_each_prop_dai_codec(props, i, dai) {
@@ -412,6 +413,21 @@ int asoc_simple_dai_init(struct snd_soc_pcm_runtime *rtd)
 	if (ret < 0)
 		return ret;
 
+	for_each_rtd_components(rtd, i, component) {
+		if (component->driver->set_jack) {
+			if (!priv->hp_jack) {
+				priv->hp_jack = devm_kzalloc(priv->snd_card.dev,
+					sizeof(*priv->hp_jack), GFP_KERNEL);
+				snd_soc_card_jack_new(&priv->snd_card,
+					"Headphones",
+					SND_JACK_HEADPHONE,
+					&priv->hp_jack->jack,
+					NULL, 0);
+			}
+			snd_soc_component_set_jack(component, &priv->hp_jack->jack, NULL);
+		}
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(asoc_simple_dai_init);
@@ -554,7 +570,7 @@ int asoc_simple_parse_pin_switches(struct snd_soc_card *card,
 EXPORT_SYMBOL_GPL(asoc_simple_parse_pin_switches);
 
 int asoc_simple_init_jack(struct snd_soc_card *card,
-			  struct asoc_simple_jack *sjack,
+			  struct asoc_simple_jack **sjack,
 			  int is_hp, char *prefix,
 			  char *pin)
 {
@@ -569,8 +585,6 @@ int asoc_simple_init_jack(struct snd_soc_card *card,
 	if (!prefix)
 		prefix = "";
 
-	sjack->gpio.gpio = -ENOENT;
-
 	if (is_hp) {
 		snprintf(prop, sizeof(prop), "%shp-det-gpio", prefix);
 		pin_name	= pin ? pin : "Headphones";
@@ -588,21 +602,26 @@ int asoc_simple_init_jack(struct snd_soc_card *card,
 		return -EPROBE_DEFER;
 
 	if (gpio_is_valid(det)) {
-		sjack->pin.pin		= pin_name;
-		sjack->pin.mask		= mask;
+		struct asoc_simple_jack *sjack_d;
+
+		sjack = devm_kzalloc(dev, sizeof(*(*sjack)), GFP_KERNEL);
+		sjack_d = *sjack;
+
+		sjack_d->pin.pin		= pin_name;
+		sjack_d->pin.mask		= mask;
 
-		sjack->gpio.name	= gpio_name;
-		sjack->gpio.report	= mask;
-		sjack->gpio.gpio	= det;
-		sjack->gpio.invert	= !!(flags & OF_GPIO_ACTIVE_LOW);
-		sjack->gpio.debounce_time = 150;
+		sjack_d->gpio.name	= gpio_name;
+		sjack_d->gpio.report	= mask;
+		sjack_d->gpio.gpio	= det;
+		sjack_d->gpio.invert	= !!(flags & OF_GPIO_ACTIVE_LOW);
+		sjack_d->gpio.debounce_time = 150;
 
 		snd_soc_card_jack_new(card, pin_name, mask,
-				      &sjack->jack,
-				      &sjack->pin, 1);
+				      &sjack_d->jack,
+				      &sjack_d->pin, 1);
 
-		snd_soc_jack_add_gpios(&sjack->jack, 1,
-				       &sjack->gpio);
+		snd_soc_jack_add_gpios(&sjack_d->jack, 1,
+				       &sjack_d->gpio);
 	}
 
 	return 0;
-- 
2.34.1
