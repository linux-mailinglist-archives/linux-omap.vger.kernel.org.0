Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13F85480C5B
	for <lists+linux-omap@lfdr.de>; Tue, 28 Dec 2021 19:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbhL1SLX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Dec 2021 13:11:23 -0500
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21115 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbhL1SLX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Dec 2021 13:11:23 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1640715068; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=Wt4GPHKEWTIIBDsTgNxtbBUanAmIzXlQAGfi67OhlnkxyM8ynFgb5G8lZ0HueEDgS6a4AO6Sms/y6KQ7sp/ctATMR0Ashng04Fte1gmd6DTZti+q4eOFJkSd0eweR6i7IJyZIs66YqqfKXDJpE9YYejmrbpHO2jiRyjgUHyznOo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1640715068; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=/fwc56FAKMG1LNYNd43a5rhbPAtQvSgiuBH2beg1ceg=; 
        b=IZI7NDm96uvJ5rxdpdXuN3SFghnG7I68C4EH3OahWfsj27uH0+r2rsawHpGrVRhATvTORyTdxwxyWu7WImOquG/RhKJkD7c+VPcKAGbsldCmOudM6N2p+oOgWSGO1FSVy2AX+4HUbWCatzG3Ua2QE3qTB0ILTDVSuqsQt1GRkTc=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (aftr-37-201-192-113.unity-media.net [37.201.192.113]) by mx.zoho.eu
        with SMTPS id 1640715065616408.4636139419308; Tue, 28 Dec 2021 19:11:05 +0100 (CET)
Date:   Tue, 28 Dec 2021 19:11:04 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     alsa-devel@alsa-project.org
Cc:     merlijn@wizzup.org, tony@atomide.com, sre@kernel.org,
        linux-omap@vger.kernel.org, kuninori.morimoto.gx@renesas.com
Subject: [RFC PATCH 2/3] ARM: dts: motorola-mapphone: add interrupt for
 headphone detection
Message-Id: <20211228191104.631d126f13ac0bb09e91ca13@uvos.xyz>
In-Reply-To: <20211228190931.df5d518220080a734532ebfd@uvos.xyz>
References: <20211228190931.df5d518220080a734532ebfd@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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
2.34.1
