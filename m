Return-Path: <linux-omap+bounces-2747-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB089E004E
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2024 12:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD0A9281087
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2024 11:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380C41FE46B;
	Mon,  2 Dec 2024 11:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gmR0PWWs"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D354B1FC0E9;
	Mon,  2 Dec 2024 11:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733138278; cv=none; b=afuiANUe9j8/ucMalDRr0dkSMMcUaQuXS+fs3ImyNCxB795JQ5UvIFNUroiFzYCFp8XZ4EhQvSnJfLKhLLd78j5obogeW1GS5LewYtouyLa0UGA0CQBDeiQaHiTrING8GXAohazOAe4bVBiFOWWYb+/Ncm0NE9MUkawyz7fTlIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733138278; c=relaxed/simple;
	bh=2w+CaggHOcYkWA5hNrUdq+Dcgytv+IAU8aOdHO2Ab5Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxnt2INPbjEkkjBNUpGFzhGz55iDxrBnXhL/ohCrKWykbkbPCu7GNAOauJW5cUCFDBFZcmYSSlIrFY4L3xpK3f7CZcNOMNQuGmHea36lPvMSlZ3EGpr6hL43DdTRejXBCf8eIIpeDhYLg1sguZE4MUR33pGXN/j+F2tVTdpl1hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gmR0PWWs; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2BHXKb1479125
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 2 Dec 2024 05:17:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733138253;
	bh=n6v1NQgX530+jNvA9bwnqUEGfUIRV1z8XmcnJuxieYg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gmR0PWWsJvUYC8G8kedd7O3VoKK4DqHXyKbQunBanyeW3HamVCvz5r7a24u1rZZwJ
	 w5+0dNdtGdka7Q/8auZUoRvBJSg92YEP5lehuGrzxQla9NUwZaV7+xgMo9M1qvyukK
	 oiQpGtU49/5zl5i4dofb69J9neZJuwkQnQX6FKGA=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2BHX57044893;
	Mon, 2 Dec 2024 05:17:33 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 05:17:33 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 05:17:33 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2BHVdw035318;
	Mon, 2 Dec 2024 05:17:32 -0600
Date: Mon, 2 Dec 2024 16:47:31 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>,
        Romain Naour
	<romain.naour@smile.fr>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
        <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <kristo@kernel.org>, <vigneshr@ti.com>, <nm@ti.com>,
        Romain Naour
	<romain.naour@skf.com>
Subject: Re: [PATCHv2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable
 ACSPCIE output for PCIe1
Message-ID: <7yyz4gnb7jjunbfin4sph7ntvcytjxdh23b3m2lsv24csqccbr@xitdhoq2x7iq>
References: <20241202101140.48778-1-romain.naour@smile.fr>
 <dabbad2b-f8a6-4ed7-86da-ec696cf67461@kernel.org>
 <k7udgqugqseweckb7hjniz3aops4kn35ttju2ju7f2pcbmndrg@dau5nr4leish>
 <abeb632b-9efc-48e5-a28a-a9d7c02e0a6e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <abeb632b-9efc-48e5-a28a-a9d7c02e0a6e@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Mon, Dec 02, 2024 at 12:07:17PM +0100, Krzysztof Kozlowski wrote:
> On 02/12/2024 11:58, Siddharth Vadapalli wrote:
> > On Mon, Dec 02, 2024 at 11:14:46AM +0100, Krzysztof Kozlowski wrote:
> > 
> > Hello Krzysztof,
> > 
> >> On 02/12/2024 11:11, Romain Naour wrote:
> >>> From: Romain Naour <romain.naour@skf.com>
> >>>
> >>> Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
> >>> (CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
> >>> provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
> >>> provide refclk through PCIe_REFCLK pins.
> >>>
> >>> Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
> >>> module's PAD IO Buffers.
> >>>
> >>> Reuse the compatible "ti,j784s4-acspcie-proxy-ctrl" since the ACSPCIE
> >>> buffer and its functionality is the same across all K3 SoCs.
> >>>
> >>> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> >>> Signed-off-by: Romain Naour <romain.naour@skf.com>
> >>> ---
> >>> With this patch, we can remove "HACK: Sierra: Drive clock out" patch
> >>> applied on vendor kernel for BeagleBone AI-64:
> >>> https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b
> >>>
> >>> v2:
> >>>  - use generic style comments
> >>>  - use "syscon" as generic node name for "acspcie0_proxy_ctrl" node
> >>>  - Keep the compatible "ti,j784s4-acspcie-proxy-ctrl" since the
> >>>    ACSPCIE buffer and its functionality is the same across all K3 SoCs.
> >>>    (Siddharth Vadapalli)
> >>>
> >>>    "The compatible "ti,j784s4-acspcie-pcie-ctrl" should be reused for
> >>>    J721E and all other K3 SoCs.
> >>
> >> No, it shouldn't and you got comment on this. You always need specific
> >> compatible, see writing bindings doc.
> > 
> > Could you please clarify in which cases reusing the compatible is
> > permissible? The list of compatibles at:
> 
> Never? You always need specific compatible. Did you read the writing
> bindings document?
> 
> > https://github.com/torvalds/linux/blob/v6.12/Documentation/devicetree/bindings/mfd/syscon.yaml#L112
> > namely,
> >           - ti,am62-opp-efuse-table
> >           - ti,am62-usb-phy-ctrl
> >           - ti,am625-dss-oldi-io-ctrl
> >           - ti,am62p-cpsw-mac-efuse
> >           - ti,am654-dss-oldi-io-ctrl
> >           - ti,j784s4-pcie-ctrl
> > have all been reused for different TI SoCs since they all correspond to the
> > device functionality enabled via the CTRL_MMR System Controller registers.
> 
> If you find a bug, does it mean you can send new patch introducing the
> same bug?

Thank you for clarifying. Since the above compatibles have been reused,
they served as an example and appeared as the norm. But as you said, the
reference should be the bindings document and not the patches that got
through and ended up in the bindings. I will make sure that I add new
compatibles for each SoC going forward, despite what the existing
implementation suggests.

Regards,
Siddharth.

