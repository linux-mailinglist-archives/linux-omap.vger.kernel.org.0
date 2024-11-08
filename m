Return-Path: <linux-omap+bounces-2622-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 458869C1F9D
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 15:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 727C31C20E27
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 14:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AE51F4274;
	Fri,  8 Nov 2024 14:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JCKxbPX4"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FCE1803A;
	Fri,  8 Nov 2024 14:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731077299; cv=none; b=dDGM4K527iBd4QDi9MuQ7351MIYi9S7zlyEPqITtwIpFmm1gZrSii9B9LKgOo5qjZFjw41mfO4s5xpXXAGMEhp/ztvqjcNFlXEtiWM+ty8eGN8J+Ppn7Fh+N5r1VwtqUE7lZBPPE9RwzCVUMPUfF+uAzUP2HbOuQyl8sYm7wRb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731077299; c=relaxed/simple;
	bh=7Vh423k2v5rDiz9e5aaLWERcHQiPBA3gPcPJh9+KSjE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MpIBHCzX/fEPHBpBWScG9EVTbf+MIDrXQ/P77wr1jJbBy0flrEQnxdX/XurTUaDF+/FhBe0wfY2CQ06VweVz70vMlKYhpN0X5/HrnG9PRg5oo/ZXhpwdQg45x+jvO7ZR4QatYo+AF2KXONpQMksfr1OByWNGoingUeK5EsXnjxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JCKxbPX4; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A8Em0fs090318;
	Fri, 8 Nov 2024 08:48:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731077280;
	bh=Qb5W5ggwcyRExagNeS8k1z2C/XU9B9OpyZND0Okpr+k=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JCKxbPX4DVN8tneV7P3AMBuhJNPuYU0QfitzY4gmH83N9yBfhPKrr+qoKhslW5c38
	 d6vNtQX1F2y/O58SBJbogUS9lKLOlSE3nAkvo07bBobpJJlMHgRukB/tjZXHMwnjUg
	 OD9b/jR4ZBrwUmcbtx1bNFE2n8eEdhU7CnNXul/s=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A8Em0GJ083470;
	Fri, 8 Nov 2024 08:48:00 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Nov 2024 08:48:00 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Nov 2024 08:48:00 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A8Em0LU031896;
	Fri, 8 Nov 2024 08:48:00 -0600
Date: Fri, 8 Nov 2024 08:48:00 -0600
From: Nishanth Menon <nm@ti.com>
To: Roger Quadros <rogerq@kernel.org>
CC: Andreas Kemnade <andreas@kemnade.info>, Rob Herring <robh@kernel.org>,
        Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, Tony Lindgren
	<tony@atomide.com>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: ti: Convert mux.txt to json-schema
Message-ID: <20241108144800.ks7owznyt4fpcdap@thrive>
References: <20241104135549.38486-1-andreas@kemnade.info>
 <20241105135234.GA3100411-robh@kernel.org>
 <20241107075803.2cf33ab4@akair>
 <36b61684-fede-4422-bd54-0421e6a0fc23@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <36b61684-fede-4422-bd54-0421e6a0fc23@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 15:03-20241108, Roger Quadros wrote:
> >>> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
> >>> new file mode 100644
> >>> index 000000000000..b271ab86dde1
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
> >>> @@ -0,0 +1,123 @@
> >>> +# SPDX-License-Identifier: GPL-2.0-only  
> >>
> >> Surely TI as the only author of the original binding would agree to
> >> dual-license this?
> >>
> > So there is a question mark. So you are waiting for some confirmation
> > form TI?
> 
> TI code uses below license clause. So better to stick to that.
> 
> # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

Just my 2 cents:

Just to be clear, as a corporate, as TI contributor we have approval for the
following two:

For new stuff:  GPL-2.0-only OR MIT
for legacy stuff, we had GPL-2.0-only.

There are indeed instances of community contributions with
GPL-2.0-only OR BSD-2-Clause, but that is definitely something community
is free to do. Looking at history of
Documentation/devicetree/bindings/clock/ti/mux.txt, I believe, at least
from TI perspective, we are fine with GPL-2.0-only OR MIT and I think it
will let other s/w ecosystems consume the same as well.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

