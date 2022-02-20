Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C51894BCB55
	for <lists+linux-omap@lfdr.de>; Sun, 20 Feb 2022 01:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240166AbiBTAbh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 19 Feb 2022 19:31:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232359AbiBTAbh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 19 Feb 2022 19:31:37 -0500
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu [31.186.226.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5FF042A12
        for <linux-omap@vger.kernel.org>; Sat, 19 Feb 2022 16:31:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645316158; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=Qm9ch1yHQj3yxDMlDqq2ax1BNDurgJxxHYj+S1SiVfFDkusFH8GwR5lmvZcIEgpQOfh+TIDovivsOWdzYN122UCnqWpjIQG5xlbKUVtZR/jZk9IX/OjTd2zpbGjFFL4yzNGNa5fBpAxeJ/2jRPJzdotECweyPeSY/OF1B0o668o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1645316158; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=x5SfbTzdik9CpSSycXOEm5eGKOZ6Os8AY+52HpwRyfY=; 
        b=fXcA/Uc4VwLr2li9GTmi8R7xvUibQ58oscldwHe4S1q6BrN/ONA9WR2aI7wGx4UFrBKjDWNQd8dBOB2yk8bZu3q/rOqGjpjRjYszInELxNAGXlqkh9iq6dCYvRz/CxotOYx25bvnd0zR0Q5VQrPcapMhqqFm0E9oHbZSysqd4uY=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (ip-037-201-192-120.um10.pools.vodafone-ip.de [37.201.192.120]) by mx.zoho.eu
        with SMTPS id 1645316157038946.724983320766; Sun, 20 Feb 2022 01:15:57 +0100 (CET)
Date:   Sun, 20 Feb 2022 01:15:55 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     "kuninori.morimoto.gx@gmail.com" <kuninori.morimoto.gx@gmail.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "merlijn@wizzup.org" <merlijn@wizzup.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "sre@kernel.org" <sre@kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: [PATCH 4/6] ARM: dts: motorola-mapphone: add interrupt for
 headphone detection
Message-Id: <20220220011555.2d0ab3e23a6e4012b7b3b711@uvos.xyz>
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
 arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
index 0aff0d306d06..e164169bf820 100644
--- a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
@@ -72,6 +72,9 @@ cpcap_audio: audio-codec {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			interrupts-extended = <&cpcap 9 0>;
+			interrupt-names = "hpplugged";
+
 			port@0 {
 				reg = <0>;
 				cpcap_audio_codec0: endpoint {
-- 
2.35.1
