Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00FC54BCB53
	for <lists+linux-omap@lfdr.de>; Sun, 20 Feb 2022 01:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240503AbiBTAa4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 19 Feb 2022 19:30:56 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232470AbiBTAaz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 19 Feb 2022 19:30:55 -0500
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu [31.186.226.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC72042A12
        for <linux-omap@vger.kernel.org>; Sat, 19 Feb 2022 16:30:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645316110; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=bigFUDdZ2wMnQ2d/5wIhFdqxm3e8RFNL8UU+YYJizwNThxZm2DV8IQKCTnEoydNVnYatyeug07+MC93WV0Cq/s9FHTcVvyWsA0YO//W6wQzsr61yFSr4K62tVuBOom7duvYVg9kIin+zWA4Npo/GwoksTbXnqHY7lw1APVC7jlI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1645316110; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=TxrtmrJJ22codCwapsCweA2PwXwm9IdvB4gM7D6ogMw=; 
        b=PZjAw1owXJ0EQauvT7b9RidiwdVqelT8/XA9GjOJizyZx7o8556Vmvw4VT9QEKXHd+2RA6e+8NeZ3g7oenDhDka+bP+cAhhQcDKrNFbKj/n5VZKeeGUHOi1kGKNqNjiEem1rcYLcvzUtouaPJmr6uaFN0ILZb0Z+G50R8qk0KsY=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (ip-037-201-192-120.um10.pools.vodafone-ip.de [37.201.192.120]) by mx.zoho.eu
        with SMTPS id 1645316109044132.10370953547556; Sun, 20 Feb 2022 01:15:09 +0100 (CET)
Date:   Sun, 20 Feb 2022 01:15:08 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     "kuninori.morimoto.gx@gmail.com" <kuninori.morimoto.gx@gmail.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "merlijn@wizzup.org" <merlijn@wizzup.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "sre@kernel.org" <sre@kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: [PATCH 2/6] ASoC: audio-graph-card: use new functionality in
 simple_card_utils to implement has-hp-jack of property
Message-Id: <20220220011508.b60109377252d188ed3ccb02@uvos.xyz>
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

Setting this will cause audio-graph-card to register a headphone jack
and provide it to its componants via set_jack.

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 sound/soc/generic/audio-graph-card.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 7eb027238327..32a81bf10f18 100644
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
@@ -568,6 +568,8 @@ int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 	if (ret < 0)
 		return ret;
 
+	asoc_simple_init_jack(card, &priv->hp_jack, TRUE, "has-hp-jack", NULL);
+
 	memset(li, 0, sizeof(*li));
 	ret = graph_for_each_link(priv, li,
 				  graph_dai_link_of,
@@ -719,7 +721,6 @@ static int graph_probe(struct platform_device *pdev)
 	card = simple_priv_to_card(priv);
 	card->dapm_widgets	= graph_dapm_widgets;
 	card->num_dapm_widgets	= ARRAY_SIZE(graph_dapm_widgets);
-	card->probe		= asoc_graph_card_probe;
 
 	if (of_device_get_match_data(dev))
 		priv->dpcm_selectable = 1;
-- 
2.35.1

