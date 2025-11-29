Return-Path: <linux-omap+bounces-5068-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E10B6C93F5F
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 15:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 77726347948
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 14:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CA63101D4;
	Sat, 29 Nov 2025 14:22:27 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7146926F299;
	Sat, 29 Nov 2025 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764426147; cv=none; b=naP0oXUCaRBEo3LN76pgTiA84Y5t8T9nxOKLnAkBDU0+QWi+IiQm8ATe5N01IBgAZ9kTR7Q20mt/UqMqs76Tizvc9V+n+5ZFirz5atf/9Q20HyDsZizRyhWSUvnYlPGAZfEh0jJepPMW4nr8MYOKEdTCnM6zazi7HzktNBWn5kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764426147; c=relaxed/simple;
	bh=kNBBCCbsbV5MAiOKqtm1kc2EiFAAGsfegDaw6qWylxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pLK4OzgXI03sK6AnswRyowHRszL/e8PCK/JWpeBLdQQwCoHsdS8HVskP3Ts3neWcWya9uivo9pafqBKVrUkD75HQGjhnJesjG8KMFkWlOws87xY0jUbFek50897wTCTPV1hsCyGUbAfHHKMLdp6UU/nKrQFLbPSjrk1Yf3H3qqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A56022CFC88;
	Sat, 29 Nov 2025 15:22:17 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id siuwA4SpJuyE; Sat, 29 Nov 2025 15:22:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 453952CFC8B;
	Sat, 29 Nov 2025 15:22:17 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id s9fhVjQgZWo8; Sat, 29 Nov 2025 15:22:17 +0100 (CET)
Received: from nailgun.corp.sigma-star.at (85-127-105-34.dsl.dynamic.surfer.at [85.127.105.34])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id 8CA152CFC88;
	Sat, 29 Nov 2025 15:22:16 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: linux-kernel@vger.kernel.org
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	arnd@arndb.de,
	lee@kernel.org,
	dakr@kernel.org,
	rafael@kernel.org,
	gregkh@linuxfoundation.org,
	broonie@kernel.org,
	tony@atomide.com,
	rogerq@kernel.org,
	khilman@baylibre.com,
	andreas@kemnade.info,
	aaro.koskinen@iki.fi,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 4/4] arm: dts: omap: Mark various register maps as dangerous
Date: Sat, 29 Nov 2025 15:20:42 +0100
Message-ID: <20251129142042.344359-5-richard@nod.at>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251129142042.344359-1-richard@nod.at>
References: <20251129142042.344359-1-richard@nod.at>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

These register maps contain registers where reads can cause an
imprecise async data abort.
Mark these register maps with has-inaccessible-regs to make sure
they cannot be accessed via debugfs and only by device drivers that
hopefully know exactly how and when access is allowed.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi | 4 ++++
 arch/arm/boot/dts/ti/omap/dra7.dtsi    | 1 +
 arch/arm/boot/dts/ti/omap/dra74x.dtsi  | 1 +
 3 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi b/arch/arm/boot/dts/t=
i/omap/dra7-l4.dtsi
index c9282f57ffa5e..bd037e199946e 100644
--- a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
@@ -69,6 +69,7 @@ scm_conf: scm_conf@0 {
 					#address-cells =3D <1>;
 					#size-cells =3D <1>;
 					ranges =3D <0 0x0 0x1400>;
+					has-inaccessible-regs;
=20
 					pbias_regulator: pbias_regulator@e00 {
 						compatible =3D "ti,pbias-dra7", "ti,pbias-omap";
@@ -110,11 +111,13 @@ scm_conf1: scm_conf@1c04 {
 					compatible =3D "syscon";
 					reg =3D <0x1c04 0x0020>;
 					#syscon-cells =3D <2>;
+					has-inaccessible-regs;
 				};
=20
 				scm_conf_pcie: scm_conf@1c24 {
 					compatible =3D "syscon";
 					reg =3D <0x1c24 0x0024>;
+					has-inaccessible-regs;
 				};
=20
 				sdma_xbar: dma-router@b78 {
@@ -4306,6 +4309,7 @@ target-module@c000 {			/* 0x4ae0c000, ap 17 50.0 */
 			scm_wkup: scm_conf@0 {
 				compatible =3D "syscon";
 				reg =3D <0 0x1000>;
+				has-inaccessible-regs;
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/ti/omap/dra7.dtsi b/arch/arm/boot/dts/ti/o=
map/dra7.dtsi
index 711ce4c31bb1f..1b1f31608d37e 100644
--- a/arch/arm/boot/dts/ti/omap/dra7.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7.dtsi
@@ -359,6 +359,7 @@ bandgap: bandgap@4a0021e0 {
 		dsp1_system: dsp_system@40d00000 {
 			compatible =3D "syscon";
 			reg =3D <0x40d00000 0x100>;
+			has-inaccessible-regs;
 		};
=20
 		dra7_iodelay_core: padconf@4844a000 {
diff --git a/arch/arm/boot/dts/ti/omap/dra74x.dtsi b/arch/arm/boot/dts/ti=
/omap/dra74x.dtsi
index cfb39dde49300..d814c31576797 100644
--- a/arch/arm/boot/dts/ti/omap/dra74x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra74x.dtsi
@@ -47,6 +47,7 @@ ocp {
 		dsp2_system: dsp_system@41500000 {
 			compatible =3D "syscon";
 			reg =3D <0x41500000 0x100>;
+			has-inaccessible-regs;
 		};
=20
=20
--=20
2.51.0


