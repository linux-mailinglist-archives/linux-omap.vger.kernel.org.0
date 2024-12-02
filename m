Return-Path: <linux-omap+bounces-2743-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 685549DFE7A
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2024 11:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28535280CBD
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2024 10:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0A81FDE19;
	Mon,  2 Dec 2024 10:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="O4JbVMfr"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBD81FC11A
	for <linux-omap@vger.kernel.org>; Mon,  2 Dec 2024 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733134327; cv=none; b=rk7djuPjQ93/i8kyMi3y4ftO7695xe6CO89wnfyAARJH4kIzUuPbabHG8qygMDYTHSTZ9WaW+UnnA4G8mCtopGuGQba6cJHNG4lqpjXaBYIvHAQp/QVET+6iMlwdXZ6QfApNHty945DFKtzEyqgn5lN2ge6QGf+0mkQ/IbluYdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733134327; c=relaxed/simple;
	bh=1Yk2xE+4LvLgWaCrE+PAUJ3/KYCQQt2CuK4BT5+wpoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IJHhRymyM9N0+cXX6rfXQSfPN+L2UquWCDUQ8HEcSnAV5mugAZ98cWHl/tEKbhlprR09iBT4ZSKv1uo2Jm/7bkf4ZEsVIkb5GbdCSH9vMtyFyg/g84GKC4CdOWkvHEjTi601SJWd03SiB4VlWWb3Lc4wDfNSdLqS5aT7gadxAh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=O4JbVMfr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43497839b80so24811755e9.2
        for <linux-omap@vger.kernel.org>; Mon, 02 Dec 2024 02:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1733134323; x=1733739123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YQPjFrGxUzPXgGYDSfzbk9xwSYIQ5wTw0sR1TTLwdZg=;
        b=O4JbVMfrCRYZz2JSdCoI1cpArB8KS5TWynkm2vaFCGkKxfmRnrjyeNy1DV3bCJmxmy
         eMEnh/3TRIiwSihdUQrpCguh82204AdFscimZ97UnbjCRA9Gtkmh7XDvXOUAMZlDgUzb
         1Xor3YKxY4qsNt7Fy6qioH8jnqNqBAWtL1nUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733134323; x=1733739123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQPjFrGxUzPXgGYDSfzbk9xwSYIQ5wTw0sR1TTLwdZg=;
        b=Y4LTFGS+6KjFqPeav8O7dxstVchZe6vfFHTXAK7TOekDfy+eyQouzRWhqxFTEp53cu
         Sw0JlElpBO2qo3aytHmhNbY05BPjb+3EdRa1SJ5bG9CW93Y76XGb++bdynURn1OEQUmI
         5EbAS6MQAn1yT4dFSfqFUeFmko19rbbC8ATBI8DuruBMJO7S9BAz9BgnGWCSQ4BgJJ2A
         EsPyH6SXuN7XFacD7xNePXeB9+T0C909AZ4rfPa249/a2msfB2Km2xB2iaVAhPo83cNT
         O88l5+cAANmJVsfxlIqEWCnkBLa55ZYz5xkp5SpClXG5DBZgdEvC9yiwQ1tohk3i4QBp
         dJzA==
X-Forwarded-Encrypted: i=1; AJvYcCVdEJCg0iqID3wYS8tMeyJp8W+GPpgxzvEFn/BddBomBE/023q+9XRvzcfZlsg5OSNh4jO7Xa1NX6wj@vger.kernel.org
X-Gm-Message-State: AOJu0YxdXEJNtc7D5m99CkOjCFi7mYpgHYBRPKPh2xDxwajBm8eWHtuO
	jqXEdtBhkleBFLEarUMhD70Cs5eCJnL7lyRfwws8+GGrtgTPEJwij+VXk4xfU1+GIHjhDuBwAhb
	z
X-Gm-Gg: ASbGncsP1qcK2PCZ4UwEZf1yfSYpc3bMiwuhbBLtY3C9BVyj+vJtnm1PaH5Lx0PTqX5
	C1SUXNft5HXv9nMMmUOe2dawOtqvzVQem6zPaFwJA6WRSQSMGU0Ht6yW+0ZcFNi4k2/NtkroiTz
	I04+L6+sqk8s7H8PwayS3AGsQp8/iuEBaZq+3PKQKgO5gL5Q8mxycOrVjdJxPZpjGLkG9taY9bc
	SN0/WJqUUTI9LYRq8RJbDU2ZqMzR9G0l1gUlrSrKubIYbGYnKTInNh6f2BBqywRPMNXRrwWICbY
	ukFWHZVBTwNzNOUCGyKKLOEBkVro6Za9xqDsyE5QHsadW2c=
X-Google-Smtp-Source: AGHT+IG4GMzTCNAiDXoQ6IfMdGYliGKIimtD8bjQyryGARkZpxz5JZzdvAJtPu8GPuKep9KHnrEIyw==
X-Received: by 2002:a05:600c:b87:b0:434:a1e7:27b0 with SMTP id 5b1f17b1804b1-434a9dc3d08mr194372895e9.11.1733134323371;
        Mon, 02 Dec 2024 02:12:03 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa763c50sm177341885e9.12.2024.12.02.02.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 02:12:03 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	kristo@kernel.org,
	vigneshr@ti.com,
	nm@ti.com,
	Romain Naour <romain.naour@skf.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: [PATCHv2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE output for PCIe1
Date: Mon,  2 Dec 2024 11:11:40 +0100
Message-ID: <20241202101140.48778-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Romain Naour <romain.naour@skf.com>

Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
(CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
provide refclk through PCIe_REFCLK pins.

Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
module's PAD IO Buffers.

Reuse the compatible "ti,j784s4-acspcie-proxy-ctrl" since the ACSPCIE
buffer and its functionality is the same across all K3 SoCs.

Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Romain Naour <romain.naour@skf.com>
---
With this patch, we can remove "HACK: Sierra: Drive clock out" patch
applied on vendor kernel for BeagleBone AI-64:
https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b

v2:
 - use generic style comments
 - use "syscon" as generic node name for "acspcie0_proxy_ctrl" node
 - Keep the compatible "ti,j784s4-acspcie-proxy-ctrl" since the
   ACSPCIE buffer and its functionality is the same across all K3 SoCs.
   (Siddharth Vadapalli)

   "The compatible "ti,j784s4-acspcie-pcie-ctrl" should be reused for
   J721E and all other K3 SoCs.
   For example, see:
   https://lore.kernel.org/r/20240402105708.4114146-1-s-vadapalli@ti.com/
   which introduced "ti,am62p-cpsw-mac-efuse" compatible.

   The same compatible is reused across all K3 SoCs:
   https://lore.kernel.org/r/20240628151518.40100-1-afd@ti.com/ "
---
 arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts |  5 +++++
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          | 10 ++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
index fb899c99753e..741ad2ba6fdb 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
@@ -859,6 +859,11 @@ &pcie1_rc {
 	num-lanes = <2>;
 	max-link-speed = <3>;
 	reset-gpios = <&main_gpio0 22 GPIO_ACTIVE_HIGH>;
+	/*
+	 * There is no on-board or external reference clock generators,
+	 * use refclk from the ACSPCIE module's PAD IO Buffers.
+	 */
+	ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x3>;
 };
 
 &ufs_wrapper {
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index af3d730154ac..b9bb59ce4ed2 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -5,6 +5,7 @@
  * Copyright (C) 2016-2024 Texas Instruments Incorporated - https://www.ti.com/
  */
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/phy/phy-cadence.h>
 #include <dt-bindings/phy/phy-ti.h>
 #include <dt-bindings/mux/mux.h>
 
@@ -82,6 +83,11 @@ ehrpwm_tbclk: clock-controller@4140 {
 			reg = <0x4140 0x18>;
 			#clock-cells = <1>;
 		};
+
+		acspcie0_proxy_ctrl: syscon@18090 {
+			compatible = "ti,j784s4-acspcie-proxy-ctrl", "syscon";
+			reg = <0x18090 0x4>;
+		};
 	};
 
 	main_ehrpwm0: pwm@3000000 {
@@ -979,8 +985,8 @@ pcie1_rc: pcie@2910000 {
 		max-link-speed = <3>;
 		num-lanes = <2>;
 		power-domains = <&k3_pds 240 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 240 1>;
-		clock-names = "fck";
+		clocks = <&k3_clks 240 1>, <&serdes1 CDNS_SIERRA_DERIVED_REFCLK>;
+		clock-names = "fck", "pcie_refclk";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		bus-range = <0x0 0xff>;
-- 
2.45.0


