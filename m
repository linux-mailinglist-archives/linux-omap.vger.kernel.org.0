Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 432C54BCB4E
	for <lists+linux-omap@lfdr.de>; Sun, 20 Feb 2022 01:38:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241151AbiBTAbd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 19 Feb 2022 19:31:33 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240166AbiBTAbc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 19 Feb 2022 19:31:32 -0500
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu [31.186.226.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 013CB42A12
        for <linux-omap@vger.kernel.org>; Sat, 19 Feb 2022 16:31:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645316154; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=MCHuuHDjdn9vTCTaInxeBtnVm6klEwwndrwNrc0hSC+ObLlaVkCB7iZdY2LazrJGZigzsns6mNeK4B8RrcVZ4mhxLEEEdt9nu6aBWXHjFY+l70SHXrkjQjqv+WuevWp0hOZZqA4PGHq5ULuF03Inqkcg4g/0xsyprI83NalK9Ww=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1645316154; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=rVajd+WbGj4V8f+yOgZscqhIxYchcnZitCfUwjk8AGw=; 
        b=grQCF+ObNbDPNjF8ZGujA7nsOIFXkWzNqlg5cWPrgPPsgKXlkdFB/BnUilyc/eae7urXEgzGQSvKOiZjflOVnai2jYNyXxYV8VOe/j24/hfbToPfnuedtm6DWwxYjQGLDqKnOt1l4BfuzHW7vU/QGXVHpJehu7XKipbGQaFgDM8=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (ip-037-201-192-120.um10.pools.vodafone-ip.de [37.201.192.120]) by mx.zoho.eu
        with SMTPS id 1645316152037962.4617882343289; Sun, 20 Feb 2022 01:15:52 +0100 (CET)
Date:   Sun, 20 Feb 2022 01:15:51 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     "kuninori.morimoto.gx@gmail.com" <kuninori.morimoto.gx@gmail.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "merlijn@wizzup.org" <merlijn@wizzup.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "sre@kernel.org" <sre@kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: [PATCH 3/6] ASoC: cpcap: add headphone jack plug detection support
Message-Id: <20220220011551.a132b8f7d033d3e1eb731013@uvos.xyz>
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

Implements an interrupt handler that fires when a headphone
is inserted. A jack must be provided to the codec via
snd_soc_component_driver .set_jack

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 sound/soc/codecs/cpcap.c | 104 +++++++++++++++++++++++++++++++++++----
 1 file changed, 94 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index 598e09024e23..8114d78726ff 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -15,6 +15,7 @@
 #include <sound/core.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
+#include <sound/jack.h>
 
 /* Register 512 CPCAP_REG_VAUDIOC --- Audio Regulator and Bias Voltage */
 #define CPCAP_BIT_AUDIO_LOW_PWR           6
@@ -252,8 +253,14 @@ enum cpcap_dai {
 };
 
 struct cpcap_audio {
+	struct device *dev;
 	struct snd_soc_component *component;
 	struct regmap *regmap;
+	struct snd_soc_jack *hp_jack;
+
+	struct delayed_work jack_detect_work;
+
+	int hp_irq;
 
 	u16 vendor;
 
@@ -603,6 +610,21 @@ static int cpcap_input_left_mux_put_enum(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static struct snd_soc_jack_pin headset_jack_pins[] = {
+	{
+		.pin = "Headset Right Playback Route",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headset Left Playback Route",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headphones",
+		.mask = SND_JACK_HEADPHONE,
+	}
+};
+
 static const struct snd_kcontrol_new cpcap_input_left_mux =
 	SOC_DAPM_ENUM_EXT("Input Left", cpcap_input_left_mux_enum,
 			  cpcap_input_left_mux_get_enum,
@@ -1561,8 +1583,6 @@ static int cpcap_dai_mux(struct cpcap_audio *cpcap, bool swap_dai_configuration)
 	u16 voice_mask = BIT(CPCAP_BIT_DIG_AUD_IN);
 	int err;
 
-
-
 	if (!swap_dai_configuration) {
 		/* Codec on DAI0, HiFi on DAI1 */
 		voice_val = 0;
@@ -1586,6 +1606,44 @@ static int cpcap_dai_mux(struct cpcap_audio *cpcap, bool swap_dai_configuration)
 	return 0;
 }
 
+static irqreturn_t cpcap_hp_irq_thread(int irq, void *arg)
+{
+	struct cpcap_audio *cpcap = arg;
+	int val = -1;
+	bool plugged;
+
+	regmap_read(cpcap->regmap, CPCAP_REG_INTS1, &val);
+	plugged = val & (1<<9);
+
+	if (!cpcap->component) {
+		dev_warn(cpcap->dev, "%s called before component is ready.", __func__);
+		return IRQ_HANDLED;
+	}
+
+	if (!cpcap->hp_jack) {
+		dev_warn(cpcap->dev, "%s called before jack is ready.", __func__);
+		return IRQ_HANDLED;
+	}
+
+	snd_soc_jack_report(cpcap->hp_jack, plugged ? 0 : SND_JACK_HEADPHONE, SND_JACK_HEADPHONE);
+
+	return IRQ_HANDLED;
+}
+
+static int cpcap_set_jack_detect(struct snd_soc_component *component,
+	struct snd_soc_jack *hp_jack, void *data)
+{
+	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
+
+	if (!cpcap->hp_jack) {
+		dev_info(cpcap->dev, "registering jack");
+		cpcap->hp_jack = hp_jack;
+		snd_soc_jack_add_pins(hp_jack, ARRAY_SIZE(headset_jack_pins), headset_jack_pins);
+	}
+
+	return 0;
+}
+
 static int cpcap_audio_reset(struct snd_soc_component *component,
 			     bool swap_dai_configuration)
 {
@@ -1628,13 +1686,9 @@ static int cpcap_audio_reset(struct snd_soc_component *component,
 
 static int cpcap_soc_probe(struct snd_soc_component *component)
 {
-	struct cpcap_audio *cpcap;
+	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
 	int err;
 
-	cpcap = devm_kzalloc(component->dev, sizeof(*cpcap), GFP_KERNEL);
-	if (!cpcap)
-		return -ENOMEM;
-	snd_soc_component_set_drvdata(component, cpcap);
 	cpcap->component = component;
 
 	cpcap->regmap = dev_get_regmap(component->dev->parent, NULL);
@@ -1657,6 +1711,7 @@ static struct snd_soc_component_driver soc_codec_dev_cpcap = {
 	.num_dapm_widgets	= ARRAY_SIZE(cpcap_dapm_widgets),
 	.dapm_routes		= intercon,
 	.num_dapm_routes	= ARRAY_SIZE(intercon),
+	.set_jack = cpcap_set_jack_detect,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
@@ -1665,13 +1720,42 @@ static struct snd_soc_component_driver soc_codec_dev_cpcap = {
 
 static int cpcap_codec_probe(struct platform_device *pdev)
 {
-	struct device_node *codec_node =
-		of_get_child_by_name(pdev->dev.parent->of_node, "audio-codec");
+	struct cpcap_audio *cpcap;
+	struct device_node *codec_node;
+	int ret;
 
+	codec_node = of_get_child_by_name(pdev->dev.parent->of_node, "audio-codec");
 	pdev->dev.of_node = codec_node;
 
-	return devm_snd_soc_register_component(&pdev->dev, &soc_codec_dev_cpcap,
+	cpcap = devm_kzalloc(&pdev->dev, sizeof(*cpcap), GFP_KERNEL);
+	if (!cpcap)
+		return -ENOMEM;
+	dev_set_drvdata(&pdev->dev, cpcap);
+
+	ret = devm_snd_soc_register_component(&pdev->dev, &soc_codec_dev_cpcap,
 				      cpcap_dai, ARRAY_SIZE(cpcap_dai));
+	if (ret < 0)
+		return ret;
+
+	cpcap->hp_irq = platform_get_irq_byname(pdev, "hpplugged");
+	if (cpcap->hp_irq < 0)
+		return -ENODEV;
+
+	cpcap->dev = &pdev->dev;
+
+	ret = devm_request_threaded_irq(&pdev->dev, cpcap->hp_irq, NULL,
+					  cpcap_hp_irq_thread,
+					  IRQF_TRIGGER_RISING |
+					  IRQF_TRIGGER_FALLING |
+					  IRQF_ONESHOT,
+					  "cpcap-codec-headphone", cpcap);
+	if (ret) {
+		dev_err(&pdev->dev, "could not get irq: %i\n",
+			ret);
+		return ret;
+	}
+
+	return 0;
 }
 
 static struct platform_driver cpcap_codec_driver = {
-- 
2.35.1

-- 
Carl Philipp Klemm <philipp@uvos.xyz> <carl@uvos.xyz>

On Mon, 10 Jan 2022 23:27:52 +0000
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> 
> Hi Carl
> 
> >> (X)	int asoc_simple_init_jack(...)
> >> 	{
> >> 		...
> >> 		if (gpio_is_valid(det)) {
> >> 			...
> >> 
> >> 			snd_soc_card_jack_new(...);
> >> 			snd_soc_jack_add_gpios(...);
> >> 			for_each_card_components(card, component)
> >> (Y)				snd_soc_component_set_jack(component, ...);
> >> 		}
> >> 		...
> >> 	}
> >
> > So for the case of cpcap codec on motorola mapphones this dosent help,
> > because we dont have a gpio to sense plug state, thus no gpio in dts
> > and thus gpio_is_valid will return false, therefore, no jack.
> >
> > Moving 
> >
> > sjack->pin.pin		= pin_name;
> > sjack->pin.mask		= mask;
> >
> > snd_soc_card_jack_new(card, pin_name, mask,
> > 		      &sjack->jack,
> > 		      &sjack->pin, 1);
> >
> > and
> >
> > for_each_card_components(card, component)
> > 			snd_soc_component_set_jack(component, &sjack->jack, NULL);
> >
> > outside of the if block should make this work, at least cpcap gets the jack then.
> 
> I see.
> 
> simple-card is checking hp-det-gpio on DT now.
> I guess it can help you if simple-card also check "hp-det" (no gpio)
> (and customize previous patch) ?
> Is "enable-hp" better naming... ?
> 
> Best regards
> ---
> Kuninori Morimoto
