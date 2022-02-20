Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C548E4BCB57
	for <lists+linux-omap@lfdr.de>; Sun, 20 Feb 2022 01:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242116AbiBTAbn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 19 Feb 2022 19:31:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232359AbiBTAbm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 19 Feb 2022 19:31:42 -0500
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu [31.186.226.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C17F242A12
        for <linux-omap@vger.kernel.org>; Sat, 19 Feb 2022 16:31:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645316164; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=GQUXnUfVFb+lJI89pARVaTkmxrrHzpirWaNhF186rebZDVPZ2LrA2w4mHv51BQ+h0yh+tNb7sHhKfnx7OLtPQkTG1Yc7zatSqwEBXudtGyKZU/QV9WBvrtyISPOFxB77LcAN5dva6dd2cPpzXWFNmNbLF5fVj5+RTGtWh7rm8Bw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1645316164; h=Cc:Date:From:Message-ID:Subject:To; 
        bh=qW+UNzqp9Isd5ma7U5fPqp+trQ8QY8pCXccwmXwzSpw=; 
        b=PTNr/OzpGZXEnJiIQISJ2hQKVWJ8XVmiRDX3PVVRY3SNGoslimTpLXNl5SPJuQBpd00Xa1898twZXME0vsFexXrCub5s+BQB6VyewoyIO9UhSusjX9fu7uwzzUZY0qedNXxEGBcVVAUycl/yv1237j6J4/Rblh83TPLJJwguiYI=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (ip-037-201-192-120.um10.pools.vodafone-ip.de [37.201.192.120]) by mx.zoho.eu
        with SMTPS id 164531616270238.25836167433181; Sun, 20 Feb 2022 01:16:02 +0100 (CET)
Date:   Sun, 20 Feb 2022 01:16:01 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     "kuninori.morimoto.gx@gmail.com" <kuninori.morimoto.gx@gmail.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "merlijn@wizzup.org" <merlijn@wizzup.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "sre@kernel.org" <sre@kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Message-ID: <17f147c448f.39e900c2-265391827.-7512123469039839057@zoho.eu>
Subject: [PATCH 6/6] Documentation: sound: audio-graph-card: update dts
X-ZohoMailClient: External
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_00,FROM_SUSPICIOUS_NTLD,
        FROM_SUSPICIOUS_NTLD_FP,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

 bindings to add has-hp-jack
Message-Id: <20220220011601.4424ad416d65b836e3165cfa@uvos.xyz>
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

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 Documentation/devicetree/bindings/sound/audio-graph.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph.yaml b/Documentation/devicetree/bindings/sound/audio-graph.yaml
index 4b46794e5153..5844b900789a 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph.yaml
@@ -38,6 +38,8 @@ properties:
     maxItems: 1
   mic-det-gpio:
     maxItems: 1
+  hp-det-gpio:
+    description: Set this properties if the device has a headphone jack to be reported on by a snd_soc_component
 
 required:
   - dais
-- 
2.35.1
