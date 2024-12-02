Return-Path: <linux-omap+bounces-2750-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A189E05B5
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2024 15:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A66528E669
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2024 14:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4B720B1E9;
	Mon,  2 Dec 2024 14:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OymWRgeA"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75171FDE12;
	Mon,  2 Dec 2024 14:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733151229; cv=none; b=q2kUkEMO9Lnk05uBWkqUIUBvN0jmFAtv4y9kkEg0wHk+YUoSKeyZPXUZj8Naf/pEW/P1ekQ0vY5r4UCcu4HG1D37jaq8dY3MgrI/XF0B4jFqExfY8gnqCgH9zssBd6wlGrGnJuXRI/AfQcu5bMpeKi1R1mJO6/MyZtk/A2nQhKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733151229; c=relaxed/simple;
	bh=hAo+oTaHyXTPvLFhlWpGXS879T4NV38YbPfQ7W0EEWU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/fxztgmVlF97Y78+CZ+EQoUvR8+w6QeMpbgnAZFvzfH43ayORJrTUykU/nAVOzUWMhBhtuczpwneB2QNAA6MxX0QxnU/M9A8VnQ6TzYkDAQETW0jce40owW/g/E5qOwvlmtZNPExNH6z5QFME0QDZXiA66I2WiAde2d5lLxJSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OymWRgeA; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B2ErOi6100552;
	Mon, 2 Dec 2024 08:53:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733151205;
	bh=OmFjZuNAgGTFfhzOSSMRVfAUqblcSCURT6l6+QVX0Vk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OymWRgeAimwNUhkGahYXNsnuwFC70DhGFS6hvIAYEDZwpAyUndhVbP3teAkktpVQ2
	 pphJI30On5xQUsZyJBNDPZTHmdOuiL35U9qjCjbzt6a+/r+rqDqdaktMpgg7/wqf0d
	 GJCLS6KclxI+HCuDImGl0sd1Xx1W/lKrGmGshqTU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2ErOle060138
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Dec 2024 08:53:24 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 08:53:24 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 08:53:24 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2ErNcH070705;
	Mon, 2 Dec 2024 08:53:24 -0600
Date: Mon, 2 Dec 2024 20:23:22 +0530
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
Message-ID: <cndc3fopwhwkotfikul2jtzfczpdpwlrs5uhuqq76ck36ndtfs@gvxavxt5tgd5>
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

Hello Krzysztof,

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

I went through the bindings document again at:
https://www.kernel.org/doc/Documentation/devicetree/bindings/writing-bindings.rst
It mentions:
- DON'T use 'syscon' alone without a specific compatible string. A 'syscon'
  hardware block should have a compatible string unique enough to infer the
  register layout of the entire block (at a minimum).

The ACSCPCIE Block as well as its integration across all of TI's K3 SoCs
is the same i.e. same Hardware/IP. The register bits corresponding to
the feature to be enabled/disabled via the ACSPCIE block are the same as
well i.e. "register layout can be inferred". The same goes for the
compatibles listed below in my previous reply i.e. they aren't bugs.
Same IP and integration across SoCs and hence reused in the sense of
Hardware and not Software. I hope this clarifies the rationale for the
"reuse".

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

[...]

Regards,
Siddharth.

