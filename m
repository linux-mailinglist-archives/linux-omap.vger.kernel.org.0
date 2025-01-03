Return-Path: <linux-omap+bounces-2952-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41493A00FD5
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2025 22:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27623160EC1
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2025 21:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329AA1C07C5;
	Fri,  3 Jan 2025 21:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bP2nhUXm"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AA31BEF89;
	Fri,  3 Jan 2025 21:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735939543; cv=none; b=UROPtVUQAJhdOPT8DW3KOdwyHx/dc2ajbaGabt976vi+JKBmzv3eW9+bm/R/afXXVHdgR5tEAlJKPW/Df3SWBt2J+YntQSl2R0IO29robDX1Wup0W5v1HsATjC1X+0kpVWp25TzfyCa0ocALrh7R/8X35TRBXwsAxAfgnHGuoH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735939543; c=relaxed/simple;
	bh=4hL4JPIwOkhizFkkaEYRUjkV5LVZTiLgkT63bP1bSwE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9k3/asoSHFdgsa6gHkX7Vl1SeRGOtDUgFl2qz8Wuhi802wBUh/vqVr8lVvchweEHqs0OAd36QqmfjS6LiMeZ5/yKCVozeAp8RHBmGC4yGaOEosIczo205phzCOMizVs8CuIDGLkHpD3/oQWtZ8aCWewpoKoz51k/+qG4AsA01s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bP2nhUXm; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503LPSbt2448245
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 3 Jan 2025 15:25:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735939528;
	bh=YZznWuB1FraRGFyZglxWAosBnpPgLA03XkIoE8efXcA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=bP2nhUXm4ZvP5A/Ogp+ULktqfTiKWvl5cIOouWNWOdTs31HFtamfdMWnbW5xvzxKc
	 JYSygimS1kNkpVKx5+NFFi6nnDE9eDe8B0PSkBDrlVe5+pYSWltlCa3riTkqLwHENP
	 3+Pq+YReZJ8KOxQzALnVPJtmMwxW6L51rWNaejDo=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503LPSL4011213;
	Fri, 3 Jan 2025 15:25:28 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 15:25:27 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 15:25:28 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503LPStc016571;
	Fri, 3 Jan 2025 15:25:28 -0600
Date: Fri, 3 Jan 2025 15:25:28 -0600
From: Nishanth Menon <nm@ti.com>
To: Kevin Hilman <khilman@baylibre.com>
CC: <devicetree@vger.kernel.org>, Romain Naour <romain.naour@smile.fr>,
        <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
        <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <kristo@kernel.org>, <vigneshr@ti.com>,
        Romain Naour <romain.naour@skf.com>, <afd@ti.com>,
        <s-vadapalli@ti.com>
Subject: Re: [PATCHv3 1/2] dt-bindings: mfd: syscon: Add
 ti,j721e-acspcie-proxy-ctrl compatible
Message-ID: <20250103212528.enq4ur5afxhwzh7n@outdoors>
References: <20241202143331.126800-1-romain.naour@smile.fr>
 <173344002250.407600.8303166891165540615.b4-ty@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <173344002250.407600.8303166891165540615.b4-ty@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 15:07-20241205, Kevin Hilman wrote:
> 
> On Mon, 02 Dec 2024 15:33:30 +0100, Romain Naour wrote:
> > The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
> > SoC are used to drive the reference clock to the PCIe Endpoint device via
> > the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
> > obtain the regmap for the ACSPCIE_CTRL register within the System
> > Controller device-tree node in order to enable the PAD IO Buffers.
> > 
> > The Technical Reference Manual for J721e SoC with details of the
> > ASCPCIE_CTRL registers is available at:
> > https://www.ti.com/lit/zip/spruil1
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/2] dt-bindings: mfd: syscon: Add ti,j721e-acspcie-proxy-ctrl compatible
>       commit: d8efc0b428856137608ffcbb6994da6041c9fe2a
> [2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE output for PCIe1
>       commit: 1d5e14a20dc60b440c60bec8489acfd45cdf7508
> 
> Best regards,
> -- 
> Kevin Hilman <khilman@baylibre.com>
> 
This will need a bit of fixup - See along the lines of the following.
Additionally, we should be a bit careful about the dependency of dts
mix up from two trees.

https://lore.kernel.org/all/20250103174524.28768-1-afd@ti.com/T/#m15dcfa786fc430d54cf96475afc10648372f8589

From Andrew Davis:

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index 378e9cc5fac2a..3323f3bc976e0 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -68,6 +68,12 @@ patternProperties:
     description:
       The node corresponding to SoC chip identification.
 
+  "^aspcie-ctrl@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/mfd/syscon.yaml#
+    description:
+      This is the ASPCIe control region.
+
 required:
   - compatible
   - reg
@@ -110,5 +116,10 @@ examples:
             compatible = "ti,am654-chipid";
             reg = <0x14 0x4>;
         };
+
+        acspcie0_proxy_ctrl: aspcie-ctrl@18090 {
+            compatible = "ti,j721e-acspcie-proxy-ctrl", "syscon";
+            reg = <0x18090 0x4>;
+        };
     };
 ...
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 32a232a90100e..4b2101e90fb51 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -84,7 +84,7 @@ ehrpwm_tbclk: clock-controller@4140 {
                        #clock-cells = <1>;
                };
 
-               acspcie0_proxy_ctrl: syscon@18090 {
+               acspcie0_proxy_ctrl: aspcie-ctrl@18090 {
                        compatible = "ti,j721e-acspcie-proxy-ctrl", "syscon";
                        reg = <0x18090 0x4>;
                };

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

