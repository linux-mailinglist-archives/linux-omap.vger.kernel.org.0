Return-Path: <linux-omap+bounces-3031-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD21FA05C62
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 14:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FDD73A116F
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 13:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0EB1FA8C0;
	Wed,  8 Jan 2025 13:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="y5ecljwU"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20E614A82;
	Wed,  8 Jan 2025 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736341916; cv=none; b=gktHKDfp+CRN1MF0nHfG8mw1mxrN4qbI/jv8JJnt9av7EVDCB2TVqncy/xvQE2D1SydBIpWvMeDAfLnOyeN6wZmqzTEZ1gzFGPnuAEfE5H5eAlm6JZ45BApj4eNGrq8ldo7DXaztx6xKvzVG+CpreDslynHYYeN+z9rOmHV7Q1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736341916; c=relaxed/simple;
	bh=OwFveQG5FQZSU90kN28HyK22KApFqq13i4qWFCRksuE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aAIi8aTcvaMYppITgiDevLRW4or7iJn+Bde2AAdy4MAoNsQK4vRdCXr1hO2B6F5SmgZBMiW5fzn1kNFM9T+q8FAlD+HMxIwYeU9R0vvSkbstT8pxmFPTEeBCrk7th5sbxW8fPlk6pyPwSRC7qHimr1A/L8FCyi1DgVKP7Z24dD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=y5ecljwU; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 508DBeR43008794
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 07:11:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736341900;
	bh=s0c2Sr/lCUPp+fZ6By3CztBWN7px0h5vAH48eSCXHxo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=y5ecljwUR4/3FPqDcaEjgLXjYxVW/wnYoMVO4yFJaMRCU9n9R2cIL+aihKmcbS214
	 hnLOriD26zxNGj7ZQcEWStUiOWeDV0Id0ZwJ7QaDwvZ/v4jTRBVCpLqCAhFFBERkzg
	 bdnqcF4AUG/tSsqh7+F5mU0InBlP+f6ashtn8fJc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 508DBe2Z110371
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 07:11:40 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 07:11:39 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 07:11:39 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508DBdjE036677;
	Wed, 8 Jan 2025 07:11:39 -0600
Date: Wed, 8 Jan 2025 07:11:39 -0600
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
Message-ID: <20250108131139.dygei6ejamh5zaij@segment>
References: <20241202143331.126800-1-romain.naour@smile.fr>
 <173344002250.407600.8303166891165540615.b4-ty@baylibre.com>
 <20250103212528.enq4ur5afxhwzh7n@outdoors>
 <7hr05eb5st.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7hr05eb5st.fsf@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 14:46-20250107, Kevin Hilman wrote:
> Nishanth Menon <nm@ti.com> writes:
> 
> > On 15:07-20241205, Kevin Hilman wrote:
> >> 
> >> On Mon, 02 Dec 2024 15:33:30 +0100, Romain Naour wrote:
> >> > The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
> >> > SoC are used to drive the reference clock to the PCIe Endpoint device via
> >> > the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
> >> > obtain the regmap for the ACSPCIE_CTRL register within the System
> >> > Controller device-tree node in order to enable the PAD IO Buffers.
> >> > 
> >> > The Technical Reference Manual for J721e SoC with details of the
> >> > ASCPCIE_CTRL registers is available at:
> >> > https://www.ti.com/lit/zip/spruil1
> >> > 
> >> > [...]
> >> 
> >> Applied, thanks!
> >> 
> >> [1/2] dt-bindings: mfd: syscon: Add ti,j721e-acspcie-proxy-ctrl compatible
> >>       commit: d8efc0b428856137608ffcbb6994da6041c9fe2a
> >> [2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE output for PCIe1
> >>       commit: 1d5e14a20dc60b440c60bec8489acfd45cdf7508
> >> 
> >> Best regards,
> >> -- 
> >> Kevin Hilman <khilman@baylibre.com>
> >> 
> > This will need a bit of fixup - See along the lines of the following.
> > Additionally, we should be a bit careful about the dependency of dts
> > mix up from two trees.
> 
> sorry, these should be going through your tree in the first place.  They
> are now dropped from my tree, please go ahead and take them along with
> Andrews fixup.  Sorry for complicating things.


Romain,

There is additional fixups needed, unfortunately as well: syscon yaml
has two lists based on which dt-schema version you use.. your patch
fixed one list, but missed the other as well. Could you integrate the
fixes and resubmit, please?


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

Something of this form needs to be squashed.

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 348025870b0f7..dda489916bc54 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -216,6 +216,8 @@ properties:
           - ti,am62p-cpsw-mac-efuse
           - ti,am654-dss-oldi-io-ctrl
           - ti,am654-icssg-ctrl
+          - ti,j721e-acspcie-proxy-ctrl
           - ti,j784s4-pcie-ctrl
           - ti,keystone-pllctrl
       - const: syscon 


