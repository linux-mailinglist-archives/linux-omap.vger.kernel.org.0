Return-Path: <linux-omap+bounces-3161-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7218CA192CC
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 14:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29DBE188BE4F
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 13:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915812135AC;
	Wed, 22 Jan 2025 13:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="UqxFexpA"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CCB1E4AB;
	Wed, 22 Jan 2025 13:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737553398; cv=none; b=I7u8yOG9i9z2avkHWZt3GO2ztnbSke4mUEtVXrAjvUC/F57G4Wh3/omX/QjmJmD7ye4UI3mdcBbfSsqzkL99ZF8ATKRBtsGzaLE6uXd6jondHTyhnLCPdf+Yi67I1GTQCq2gbvT+wQoMa9oZNYM85LqtQwaMxdVb+9ogBQ5iIbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737553398; c=relaxed/simple;
	bh=oqE2yh0laXa7tjWlYyvxEpt3TBBsDruIc3IggagQSwY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=GPxAMr91hhAyyaCTQuj3czxXuUGu6yx2uAEdlfspvRJX40CqIH6EzYND86DeL2ITcmwi0FrfeV+v4v+TgjF3Vk9NHVTAktNVMxpMEx9+zS2EBCxs/7/yAETECUK8ZC/RJJO5MbgJ0d3Qf7N/mKLzk6b0ColKUgm0yzG6II27fSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=UqxFexpA; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=G8dieqUjowCxPQtfI/Pv+yktKDxeC9oOX1jp3DvkKpg=; b=UqxFexpAsMbC+Uk0oKY1SBuRvJ
	LZthIQ86MZZGRchrGBfskkmym3R5SwldBstZhng/guCAMlzvwhDlJXhLLRlZQP+wPFR0+GKE7Z+Rc
	GiwGBZullVKc1XplReyg9RNFkD6/lmL2wezZj9KPc+jpyxqYBPcHAjDlV0raJm9lKJZTBV3BYMh3g
	BzBGvqYzn2+ZZWVhIHizRYviN2ZghZrNvGWyUb1h870SgSLK8rgdE4VWTIGOiWh6S9uWBl7Re/qqQ
	pCOWGQwHM+GzMiXS9NeC+PSlumAtR4zkHRPNoPNA+U1R3G6c35ZkIGwykmz874Z1g0DunYuddR8X+
	+gczT9DQ==;
Received: from [122.175.9.182] (port=33089 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tab0e-0005Om-1u;
	Wed, 22 Jan 2025 19:13:09 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 426F21783FED;
	Wed, 22 Jan 2025 19:13:02 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 24FD61781C74;
	Wed, 22 Jan 2025 19:13:02 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id f7wG_FC8jI4i; Wed, 22 Jan 2025 19:13:02 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id D60021783FED;
	Wed, 22 Jan 2025 19:13:01 +0530 (IST)
Date: Wed, 22 Jan 2025 19:13:01 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: Rob Herring <robh@kernel.org>
Cc: basharath <basharath@couthit.com>, danishanwar <danishanwar@ti.com>, 
	rogerq <rogerq@kernel.org>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, 
	krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>, 
	nm <nm@ti.com>, ssantosh <ssantosh@kernel.org>, 
	tony <tony@atomide.com>, richardcochran <richardcochran@gmail.com>, 
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
Message-ID: <1262657207.382667.1737553381760.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250110161542.GA2966768-robh@kernel.org>
References: <20250109105600.41297-1-basharath@couthit.com> <20250109105600.41297-2-basharath@couthit.com> <20250110161542.GA2966768-robh@kernel.org>
Subject: Re: [RFC PATCH 01/10] dt-bindings: net: ti: Adds device tree
 binding for DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: dt-bindings: net: ti: Adds device tree binding for DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
Thread-Index: XgU+F7teIkD6VmMMyJo872d99aGObQ==
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

> On Thu, Jan 09, 2025 at 04:25:51PM +0530, Basharath Hussain Khaja wrote:
>> From: Parvathi Pudi <parvathi@couthit.com>
>> 
>> Documentation update for the newly added "pruss2_eth" device tree
>> node and its dependencies along with compatibility for PRU-ICSS
>> Industrial Ethernet Peripheral (IEP), PRU-ICSS Enhanced Capture
>> (eCAP) peripheral and using YAML binding document for AM57xx SoCs.
>> 
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
>> ---
>>  .../devicetree/bindings/net/ti,icss-iep.yaml  |   6 +
>>  .../bindings/net/ti,icssm-prueth.yaml         | 153 ++++++++++++++++++
>>  .../bindings/net/ti,pruss-ecap.yaml           |  32 ++++
>>  .../devicetree/bindings/soc/ti/ti,pruss.yaml  |   9 ++
>>  4 files changed, 200 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
>>  create mode 100644 Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
>> b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
>> index e36e3a622904..afacdb61a84c 100644
>> --- a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
>> +++ b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
>> @@ -8,18 +8,24 @@ title: Texas Instruments ICSS Industrial Ethernet Peripheral
>> (IEP) module
>>  
>>  maintainers:
>>    - Md Danish Anwar <danishanwar@ti.com>
>> +  - Parvathi Pudi <parvathi@couthit.com>
>> +  - Basharath Hussain Khaja <basharath@couthit.com>
>>  
>>  properties:
>>    compatible:
>>      oneOf:
>>        - items:
>>            - enum:
>> +              - ti,am5728-icss-iep
>>                - ti,am642-icss-iep
>>                - ti,j721e-icss-iep
>>            - const: ti,am654-icss-iep
>>  
>>        - const: ti,am654-icss-iep
>>  
>> +      - items:
>> +          - enum:
>> +              - ti,am5728-icss-iep
> 
> You can't have both. It's either compatible with ti,am654-icss-iep or it
> isn't.
> 

We will clean it up in the next version.

>>  
>>    reg:
>>      maxItems: 1
>> diff --git a/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
>> b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
>> new file mode 100644
>> index 000000000000..34d68619c086
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
>> @@ -0,0 +1,153 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/ti,icssm-prueth.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments ICSSM PRUSS Ethernet
>> +
>> +maintainers:
>> +  - Roger Quadros <rogerq@ti.com>
>> +  - Andrew F. Davis <afd@ti.com>
>> +  - Parvathi Pudi <parvathi@couthit.com>
>> +  - Basharath Hussain Khaja <basharath@couthit.com>
>> +
>> +description:
>> +  Ethernet based on the Programmable Real-Time Unit and Industrial
>> +  Communication Subsystem.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ti,am57-prueth     # for AM57x SoC family
>> +
>> +  sram:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      phandle to OCMC SRAM node
>> +
>> +  ti,mii-rt:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      phandle to MII_RT module's syscon regmap
>> +
>> +  ti,iep:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      phandle to IEP (Industrial Ethernet Peripheral) for ICSS
>> +
>> +  ecap:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      phandle to Enhanced Capture (eCAP) event for ICSS
>> +
>> +  interrupts:
>> +    maxItems: 2
>> +    description:
>> +      Interrupt specifiers to IRQ.
> 
> Provide a description for each entry because I can't decipher the names.
> 

We will add require description as suggested in the next version.

>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: rx_lre_hp
>> +      - const: rx_lre_lp
> 
> The same prefix or suffix on every entry is usually redundant.
> 

We will clean it up in the next version.

>> +
>> +  ethernet-ports:
>> +    type: object
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      '#address-cells':
>> +        const: 1
>> +      '#size-cells':
>> +        const: 0
>> +
>> +    patternProperties:
>> +      ^port@[0-1]$:
> 
> ethernet-port
> 

We will address this in the next version.

>> +        type: object
>> +        description: ICSSM PRUETH external ports
>> +        $ref: ethernet-controller.yaml#
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          reg:
>> +            items:
>> +              - enum: [0, 1]
>> +            description: ICSSG PRUETH port number
>> +
>> +          interrupts:
>> +            maxItems: 3
>> +
>> +          interrupt-names:
>> +            items:
>> +              - const: rx
>> +              - const: emac_ptp_tx
>> +              - const: hsr_ptp_tx
>> +
>> +          ti,no-half-duplex:
>> +            type: boolean
>> +            description:
>> +              Disable half duplex operation on ICSSM MII port.
>> +
>> +        required:
>> +          - reg
> 
> blank line
> 

We will add a blank line after "-reg" in next version.

>> +    anyOf:
>> +      - required:
>> +          - port@0
>> +      - required:
>> +          - port@1
>> +
>> +required:
>> +  - compatible
>> +  - sram
>> +  - ti,mii-rt
>> +  - ti,iep
>> +  - ecap
>> +  - ethernet-ports
>> +  - interrupts
>> +  - interrupt-names
>> +
>> +allOf:
>> +  - $ref: /schemas/remoteproc/ti,pru-consumer.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    /* Dual-MAC Ethernet application node on PRU-ICSS2 */
>> +    pruss2_eth: pruss2-eth {
>> +      compatible = "ti,am57-prueth";
>> +      ti,prus = <&pru2_0>, <&pru2_1>;
>> +      sram = <&ocmcram1>;
>> +      ti,mii-rt = <&pruss2_mii_rt>;
>> +      ti,iep = <&pruss2_iep>;
>> +      ecap = <&pruss2_ecap>;
>> +      interrupts = <20 2 2>, <21 3 3>;
>> +      interrupt-names = "rx_lre_hp", "rx_lre_lp";
>> +      interrupt-parent = <&pruss2_intc>;
>> +
>> +      ethernet-ports {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        pruss2_emac0: port@0 {
>> +          reg = <0>;
>> +          phy-handle = <&pruss2_eth0_phy>;
>> +          phy-mode = "mii";
>> +          interrupts = <20 2 2>, <26 6 6>, <23 6 6>;
>> +          interrupt-names = "rx", "emac_ptp_tx", "hsr_ptp_tx";
>> +          ti,no-half-duplex;
>> +          /* Filled in by bootloader */
>> +          local-mac-address = [00 00 00 00 00 00];
>> +        };
>> +
>> +        pruss2_emac1: port@1 {
>> +          reg = <1>;
>> +          phy-handle = <&pruss2_eth1_phy>;
>> +          phy-mode = "mii";
>> +          interrupts = <21 3 3>, <27 9 7>, <24 9 7>;
>> +          interrupt-names = "rx", "emac_ptp_tx", "hsr_ptp_tx";
>> +          ti,no-half-duplex;
>> +          /* Filled in by bootloader */
>> +          local-mac-address = [00 00 00 00 00 00];
>> +        };
>> +      };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
>> b/Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
>> new file mode 100644
>> index 000000000000..d42e636bf516
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
>> @@ -0,0 +1,32 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/ti,pruss-ecap.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments PRU-ICSS Enhanced Capture (eCAP) event module
>> +
>> +maintainers:
>> +  - Murali Karicheri <m-karicheri2@ti.com>
>> +  - Parvathi Pudi <parvathi@couthit.com>
>> +  - Basharath Hussain Khaja <basharath@couthit.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: ti,pruss-ecap
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    pruss0_ecap: ecap@30000 {
> 
> Drop unused labels.
> 

We will address this in the next version.

>> +        compatible = "ti,pruss-ecap";
>> +        reg = <0x30000 0x60>;
>> +    };
>> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>> b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>> index 927b3200e29e..ddd65bd93aa1 100644
>> --- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>> +++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>> @@ -251,6 +251,15 @@ patternProperties:
>>  
>>      type: object
>>  
>> +  ecap@[a-f0-9]+$:
>> +    description: |
> 
> Don't need '|'
> 

We will clean up in next version.

>> +      PRU-ICSS has a Enhanced Capture (eCAP) event module which can generate
>> +      and capture periodic timer based events which will be used for features
>> +      like RX Pacing to rise interrupt when the timer event has occurred.
>> +      Each PRU-ICSS instance has one eCAP modeule irrespective of SOCs.
>> +
>> +    type: object
>> +
>>    mii-rt@[a-f0-9]+$:
>>      description: |
>>        Real-Time Ethernet to support multiple industrial communication protocols.
>> --
>> 2.34.1

