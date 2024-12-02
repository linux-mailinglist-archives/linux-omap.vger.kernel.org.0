Return-Path: <linux-omap+bounces-2745-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D58FE9DFF7C
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2024 11:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A129A162437
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2024 10:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902831FCF78;
	Mon,  2 Dec 2024 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GcpKU428"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B461FCCF9;
	Mon,  2 Dec 2024 10:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733137155; cv=none; b=YBmavWEvQRYiFobLo/vv8MCsQjHnJGXRIdLmYT4SfG+1BSzk7nIH5bvHr88JjkLWIVuwB4rmzWYY9tY3g1ehKALhLt6PT/Lx0lpsg4yWgJivzbaE2Z8Zx+V33IQusbfMV9DdUWsZMSxMPiCnZXKXaoc78XEDb6oUbtsGX2KKxTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733137155; c=relaxed/simple;
	bh=h6LHm0GL1agp3F0vMLqQLA4/Wx6MXOOeOZnMnA64k50=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNu7iAVtcBZtp7ya4bhhMEecD3O7PI/RV6nOSu5lL6gz11Iuj8aA7o6pmIur6soXmfOlCrCQf+0S3J+ioFlvakByzwEBxL7heTz6UFiRGQDuojihu1sTIGS8TP1NX/k8KVXRr4oS5h0cpWeIpCZCCx6Bzp8Zw48OOW77FOcBZsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GcpKU428; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2Awmcr1282120
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Dec 2024 04:58:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733137129;
	bh=2vgqNbahwuMClWcsdgda7zc19e2mmsJjqzzMtuFFmBA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GcpKU428HI9NKHd6UF5q3+UydrZzmd0zo425FzF1FNWxIlm6pigK5pVyDovlyODWW
	 CjOoQgUR99EjuuQIU3V3TVhimuN/0h+KcWemvYgtm5a1estvfUw5aHIB+IYyAajeiH
	 uJKoisHjyZ5I7YZxtW/7mUN+9bD1u33050VWyHR0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2Awmhs055903
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Dec 2024 04:58:48 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 04:58:48 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 04:58:48 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2Awkdp100025;
	Mon, 2 Dec 2024 04:58:47 -0600
Date: Mon, 2 Dec 2024 16:28:46 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Romain Naour <romain.naour@smile.fr>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
        <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <kristo@kernel.org>, <vigneshr@ti.com>, <nm@ti.com>,
        Romain Naour
	<romain.naour@skf.com>,
        Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: Re: [PATCHv2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable
 ACSPCIE output for PCIe1
Message-ID: <k7udgqugqseweckb7hjniz3aops4kn35ttju2ju7f2pcbmndrg@dau5nr4leish>
References: <20241202101140.48778-1-romain.naour@smile.fr>
 <dabbad2b-f8a6-4ed7-86da-ec696cf67461@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dabbad2b-f8a6-4ed7-86da-ec696cf67461@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Mon, Dec 02, 2024 at 11:14:46AM +0100, Krzysztof Kozlowski wrote:

Hello Krzysztof,

> On 02/12/2024 11:11, Romain Naour wrote:
> > From: Romain Naour <romain.naour@skf.com>
> > 
> > Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
> > (CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
> > provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
> > provide refclk through PCIe_REFCLK pins.
> > 
> > Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
> > module's PAD IO Buffers.
> > 
> > Reuse the compatible "ti,j784s4-acspcie-proxy-ctrl" since the ACSPCIE
> > buffer and its functionality is the same across all K3 SoCs.
> > 
> > Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> > Signed-off-by: Romain Naour <romain.naour@skf.com>
> > ---
> > With this patch, we can remove "HACK: Sierra: Drive clock out" patch
> > applied on vendor kernel for BeagleBone AI-64:
> > https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b
> > 
> > v2:
> >  - use generic style comments
> >  - use "syscon" as generic node name for "acspcie0_proxy_ctrl" node
> >  - Keep the compatible "ti,j784s4-acspcie-proxy-ctrl" since the
> >    ACSPCIE buffer and its functionality is the same across all K3 SoCs.
> >    (Siddharth Vadapalli)
> > 
> >    "The compatible "ti,j784s4-acspcie-pcie-ctrl" should be reused for
> >    J721E and all other K3 SoCs.
> 
> No, it shouldn't and you got comment on this. You always need specific
> compatible, see writing bindings doc.

Could you please clarify in which cases reusing the compatible is
permissible? The list of compatibles at:
https://github.com/torvalds/linux/blob/v6.12/Documentation/devicetree/bindings/mfd/syscon.yaml#L112
namely,
          - ti,am62-opp-efuse-table
          - ti,am62-usb-phy-ctrl
          - ti,am625-dss-oldi-io-ctrl
          - ti,am62p-cpsw-mac-efuse
          - ti,am654-dss-oldi-io-ctrl
          - ti,j784s4-pcie-ctrl
have all been reused for different TI SoCs since they all correspond to the
device functionality enabled via the CTRL_MMR System Controller registers.
The compatible "ti,j784s4-acspcie-pcie-ctrl" has also been added to the
list:
https://github.com/torvalds/linux/blob/v6.12/Documentation/devicetree/bindings/mfd/syscon.yaml#L117
with the intent of reusing it the same way that other compatibles have
been reused.

Regards,
Siddharth.

