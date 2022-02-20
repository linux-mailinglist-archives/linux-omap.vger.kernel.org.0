Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD38A4BCB45
	for <lists+linux-omap@lfdr.de>; Sun, 20 Feb 2022 01:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241468AbiBTATk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 19 Feb 2022 19:19:40 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232461AbiBTATj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 19 Feb 2022 19:19:39 -0500
X-Greylist: delayed 229 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 19 Feb 2022 16:19:19 PST
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu [31.186.226.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C54053B46
        for <linux-omap@vger.kernel.org>; Sat, 19 Feb 2022 16:19:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645316342; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=ANJbQkDemwckzFSq+2xpdp8T2cyPG9vn8p476qj5LWOs51BQPu3EzGnJ92NVZTu21KcC/vByCKjifnFIglMzop/se9/LdkUBuLBnnaPEPB/5GGzhN/9jrXsZY/NTLtIetHi1SsLVPvvRwLyv2d0tCxDbBOk2pI/MkRNFTDDr7Ms=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1645316342; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=3HCff0o6L0WKF7HPzVEAjwajRGUlkG9L5kSxZwlqVrk=; 
        b=fUbKkdkQ+biq2Ebzk9Cm94OeWoaFS3WVf0B1Ezkke+8HdDxD72n+uv/SV6qvAhfc71P23TgvMBKQWxhYmwWwZuQAgIb0E/xI749twmEWMxrUL4G8/LtVAZkK/jTsa4vr5s4U0YHcqkDIn8pgi0bVL3cjYnHDnb8EFZjpcmsxhCY=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (ip-037-201-192-120.um10.pools.vodafone-ip.de [37.201.192.120]) by mx.zoho.eu
        with SMTPS id 1645316339280515.4397359881773; Sun, 20 Feb 2022 01:18:59 +0100 (CET)
Date:   Sun, 20 Feb 2022 01:18:58 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     "kuninori.morimoto.gx@gmail.com" <kuninori.morimoto.gx@gmail.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "merlijn@wizzup.org" <merlijn@wizzup.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "sre@kernel.org" <sre@kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: [PATCH 6/6] Documentation: sound: audio-graph-card: update dts
 bindings to add has-hp-jack
Message-Id: <20220220011858.d07e957747d22299a1c37df8@uvos.xyz>
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

