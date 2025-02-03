Return-Path: <linux-omap+bounces-3259-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 882AEA25975
	for <lists+linux-omap@lfdr.de>; Mon,  3 Feb 2025 13:30:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1949B1880A35
	for <lists+linux-omap@lfdr.de>; Mon,  3 Feb 2025 12:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B4B204694;
	Mon,  3 Feb 2025 12:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="x1QahRXf"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E586C1F9AAB;
	Mon,  3 Feb 2025 12:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585819; cv=none; b=OsrLWfLu0e2wM9ZpBqTEjp1VYvmlFkuuFdxRNJ1Ms4yunxyYhsxhluclvq3E3G6QdpGfAYtE9zJbcjiP355ctjXyFoJIF55cBvZtpZCRy6A/xHDYYQX+bYZh626m5BRGuf5cZwfw3Q983kUDdoR+vb34mRcyxDTCZpeNUclOrAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585819; c=relaxed/simple;
	bh=nYSlNKVA1bthIiqKWpz85r31vCnuWIkuBQA0LV4g6gc=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=aZOq2b2izmSyRPIcbSX9RdHhI1Vv5uf0Jeyj/FRttWv0UZoJLepJY6ec0zBHk44vzYeV0szaifcnpnNmbLh9F1di7RREKQ6TGQO/FzNbBUEKaLLrw1Nvkvvorq96K9XFvFNeF4H7g1IrEOgP82k3AM3PJo2VxHDIfRauu7/rTso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=x1QahRXf; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=x+psI+IHMZO4a5giAIwOdjWCzOBSQQjNlSZWF7AYUsA=; b=x1QahRXfNTHIdv+5k1eJUAMSDl
	CGPKrYKuw1e2l3deJJ7/IOnxmZDZLHdWNC+W58E7/PDSE8+LtVJMfIVQ2NdSPZyZt8nnaTf2PENZS
	1TItxgWJn2zpm6ia5hzNBadek5Lg1F2MmAPVKp96mFfYduIW9R37WPU6ckUhJ8WxCBQrLqoDDJ+bY
	XQL4JstFw+k1GFvYD7wUvtFWOaaoT38wAFzG4LGfExA7YmFWbU/82L+iyEIcH59C6iWf4CbjwCw4R
	pdiqnPZxXZu8klMB+G8F6/is+kGK9tiCu9Rtvq5rc5Aj/s2EmFPb5iHhYUXPGcWq1kKnt5+DzT9n3
	scjanV+w==;
Received: from [122.175.9.182] (port=49419 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tevaW-0001PL-0K;
	Mon, 03 Feb 2025 18:00:04 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 32D351781C74;
	Mon,  3 Feb 2025 17:59:56 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 0FFC317825C6;
	Mon,  3 Feb 2025 17:59:56 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vhwrpQyMK3Hr; Mon,  3 Feb 2025 17:59:55 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id B8D561781C74;
	Mon,  3 Feb 2025 17:59:55 +0530 (IST)
Date: Mon, 3 Feb 2025 17:59:55 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: Conor Dooley <conor@kernel.org>
Cc: basharath <basharath@couthit.com>, danishanwar <danishanwar@ti.com>, 
	rogerq <rogerq@kernel.org>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, krzk+dt <krzk+dt@kernel.org>, 
	conor+dt <conor+dt@kernel.org>, nm <nm@ti.com>, 
	ssantosh <ssantosh@kernel.org>, tony <tony@atomide.com>, 
	richardcochran <richardcochran@gmail.com>, 
	parvathi <parvathi@couthit.com>, schnelle <schnelle@linux.ibm.com>, 
	rdunlap <rdunlap@infradead.org>, diogo ivo <diogo.ivo@siemens.com>, 
	m-karicheri2 <m-karicheri2@ti.com>, horms <horms@kernel.org>, 
	jacob e keller <jacob.e.keller@intel.com>, 
	m-malladi <m-malladi@ti.com>, 
	javier carrasco cruz <javier.carrasco.cruz@gmail.com>, 
	afd <afd@ti.com>, s-anna <s-anna@ti.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	netdev <netdev@vger.kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-omap <linux-omap@vger.kernel.org>, 
	pratheesh <pratheesh@ti.com>, prajith <prajith@ti.com>, 
	vigneshr <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, 
	mohan <mohan@couthit.com>
Message-ID: <2028988664.494856.1738585795471.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250129-vowed-dingbat-cfb5c5b8ede4@spud>
References: <20250124122353.1457174-1-basharath@couthit.com> <20250124122353.1457174-2-basharath@couthit.com> <20250124-reoccupy-music-3803c753f8af@spud> <504387436.449923.1738127812232.JavaMail.zimbra@couthit.local> <20250129-vowed-dingbat-cfb5c5b8ede4@spud>
Subject: Re: [RFC v2 PATCH 01/10] dt-bindings: net: ti: Adds DUAL-EMAC mode
 support on PRU-ICSS2 for AM57xx SOCs
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: dt-bindings: net: ti: Adds DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
Thread-Index: lRRxm0ozpQw9qRtHe5bfB/PHbMomUA==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

> On Wed, Jan 29, 2025 at 10:46:52AM +0530, Basharath Hussain Khaja wrote:
>> > On Fri, Jan 24, 2025 at 05:53:44PM +0530, Basharath Hussain Khaja wrote:
>> >> From: Parvathi Pudi <parvathi@couthit.com>
>> >> 
>> >> Documentation update for the newly added "pruss2_eth" device tree
>> >> node and its dependencies along with compatibility for PRU-ICSS
>> >> Industrial Ethernet Peripheral (IEP), PRU-ICSS Enhanced Capture
>> >> (eCAP) peripheral and using YAML binding document for AM57xx SoCs.
>> >> 
>> >> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> >> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> >> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>> >> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>> >> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
>> > 
>> > I find this hard to believe. If all these people handled the patch, the
>> > signoff from Parvathi would be first, no? Should some of these people be
>> > co-developers?
>> > 
>> 
>> Changes are about multiple modules. We have added our sign-off followed by
>> original module authors.
> 
> I think what you're trying to say is that these people are
> co-developers? Anyone that contributed to the content of this patch
> needs to get a co-developed-by. If they're not co-developers, and you
> just want to put them in the maintainers section, they don't get
> sign-offs.
> 

Yes you may be right. We thought it would be good to include module
owners in signed-off-by, though it is a documentation file which was
not available earlier we have newly added. Due to that the ownership 
is with us. 

As you suggested we will clean this in the next version as below.

Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>

>> >> ---
>> >>  .../devicetree/bindings/net/ti,icss-iep.yaml  |   5 +
>> >>  .../bindings/net/ti,icssm-prueth.yaml         | 147 ++++++++++++++++++
>> >>  .../bindings/net/ti,pruss-ecap.yaml           |  32 ++++
>> >>  .../devicetree/bindings/soc/ti/ti,pruss.yaml  |   9 ++
>> >>  4 files changed, 193 insertions(+)
>> >>  create mode 100644 Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
>> >>  create mode 100644 Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
>> >> 
>> >> diff --git a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
>> >> b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
>> >> index e36e3a622904..aad7d37fb47e 100644
>> >> --- a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
>> >> +++ b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
>> >> @@ -8,6 +8,8 @@ title: Texas Instruments ICSS Industrial Ethernet Peripheral
>> >> (IEP) module
>> >>  
>> >>  maintainers:
>> >>    - Md Danish Anwar <danishanwar@ti.com>
>> >> +  - Parvathi Pudi <parvathi@couthit.com>
>> >> +  - Basharath Hussain Khaja <basharath@couthit.com>
>> >>  
>> >>  properties:
>> >>    compatible:
>> >> @@ -20,6 +22,9 @@ properties:
>> >>  
>> >>        - const: ti,am654-icss-iep
>> >>  
>> >> +      - items:
>> >> +          - enum:
>> >> +              - ti,am5728-icss-iep
>> > 
>> > "items: - enum: <one item>" is the same as const.
>> > 
>> 
>> Sure, we will modify as below.
>> 
>>       - const: ti,am5728-icss-iep
>> 
>> >>  
>> >>    reg:
>> >>      maxItems: 1
>> >> diff --git a/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
>> >> b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
>> >> new file mode 100644
>> >> index 000000000000..51e99beb5f5f
>> >> --- /dev/null
>> >> +++ b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
>> >> @@ -0,0 +1,147 @@
>> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> >> +%YAML 1.2
>> >> +---
>> >> +$id: http://devicetree.org/schemas/net/ti,icssm-prueth.yaml#
>> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> >> +
>> >> +title: Texas Instruments ICSSM PRUSS Ethernet
>> >> +
>> >> +maintainers:
>> >> +  - Roger Quadros <rogerq@ti.com>
>> >> +  - Andrew F. Davis <afd@ti.com>
>> >> +  - Parvathi Pudi <parvathi@couthit.com>
>> >> +  - Basharath Hussain Khaja <basharath@couthit.com>
>> >> +
>> >> +description:
>> >> +  Ethernet based on the Programmable Real-Time Unit and Industrial
>> >> +  Communication Subsystem.
>> >> +
>> >> +properties:
>> >> +  compatible:
>> >> +    enum:
>> >> +      - ti,am57-prueth     # for AM57x SoC family
>> >> +
>> >> +  sram:
>> >> +    $ref: /schemas/types.yaml#/definitions/phandle
>> >> +    description:
>> >> +      phandle to OCMC SRAM node
>> >> +
>> >> +  ti,mii-rt:
>> >> +    $ref: /schemas/types.yaml#/definitions/phandle
>> >> +    description:
>> >> +      phandle to MII_RT module's syscon regmap
>> >> +
>> >> +  ti,iep:
>> >> +    $ref: /schemas/types.yaml#/definitions/phandle
>> >> +    description:
>> >> +      phandle to IEP (Industrial Ethernet Peripheral) for ICSS
>> >> +
>> >> +  ecap:
>> > 
>> > Why's this one not got a ti prefix?
>> > 
>> 
>> We will add "ti" prefix to ecap as "ti,ecap" in the next version.
>> 
>> >> +    $ref: /schemas/types.yaml#/definitions/phandle
>> >> +    description:
>> >> +      phandle to Enhanced Capture (eCAP) event for ICSS
>> > 
>> > Why do you need phandles for these things, can they not be looked up by
>> > compatible? (e.g. multiple devices on one SoC).
>> > 
>> 
>> ecap is another peripheral similar to IEP in ICSSM/ICSSG. We have created a
>> separate driver for possible reuse with ICSSG in future.
> 
> That's not an answer to my question.
> 

We can use compatible if we have only one instance of a peripheral in the SOC. 
On the AM57x SOC we have two identical ICSS instances(ICSS1 and ICSS2). So we 
use phandles to differentiate between the two instances. Currently this patch 
series adds support for ICSS2 instance on the AM57x SOC. Support for ICSS1 instance 
will be added in subsequent patches.

>> 
>> >> +
>> >> +  interrupts:
>> >> +    items:
>> >> +      - description: High priority Rx Interrupt specifier.
>> > > +      - description: Low priority Rx Interrupt specifier.
>> 
>> 

Thanks & Best Regards,
Basharath

