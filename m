Return-Path: <linux-omap+bounces-3083-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 656F2A096EF
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 17:15:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 631A1169B97
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 16:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68351212D82;
	Fri, 10 Jan 2025 16:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="siVy4JB4"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D5D20FA9E;
	Fri, 10 Jan 2025 16:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736525744; cv=none; b=KevGBwUpXJADSsTxx2NTtx2SL2M1Vx1m5vzmiSxAcco8MJKo1ms8OZSBChk36bDkCNjTrhYPm2sTxwCQdJwso4m/sSzLHeGTw/z1k7/kEZwAUePjhTSiOUuF6IMRIIKcqZr3Lxjes5f+0QVn+7WZlDOpP2fM4D7doZXHG6lJSCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736525744; c=relaxed/simple;
	bh=61C4cwG4OyNQVRbldcgIFgCBU3BMWHzrvwdVoNgwlds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVP8Oe3w+VFdIzFJWFwfsSzON1gE/WGQIBHcz6Ln8O5+UkEqaAB76zIroHSHlLok0aNPm6KrETfeV1weR4js1ayVKig0pzcpg5L+XSAdn2qxLvR0FOlFDG8PHRL1/bfacX95Y8wNDRq143clGUSyDBRsY3veEE2mzNd2h6O0BuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=siVy4JB4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EAC8C4CEE0;
	Fri, 10 Jan 2025 16:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736525743;
	bh=61C4cwG4OyNQVRbldcgIFgCBU3BMWHzrvwdVoNgwlds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=siVy4JB4/lGt/BaPf5LcqOxLHpIX3VZfWkpqHAMC6wvz1d5XlT7rPDUSkeyB5fWXC
	 CNUa+9cCQP2WwguRTONR2++rkcfcY9unOLzCbD172HT0Br1Zk2kd5ZdTXmNIhH57jt
	 lMClCVdNbjb+scchWFn3R2IO9ak9oJ03YXosYa/z5rG2C7rbJXYTnvw/tJPKcXHr1a
	 h6LMZlvfbJyONCDtnHtbRFJGkSO/typUK3NmLHHDjjkQ8Zcep/MxU8nc8zIKX15bRq
	 T/dyGwq6yshE6DPZDE6JRSh7SgW/lLuIWEuVxsT1pyyfxuIcFrNCKFA9U9WSqbnha5
	 69K8W03ZAGOjQ==
Date: Fri, 10 Jan 2025 10:15:42 -0600
From: Rob Herring <robh@kernel.org>
To: Basharath Hussain Khaja <basharath@couthit.com>
Cc: danishanwar@ti.com, rogerq@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	nm@ti.com, ssantosh@kernel.org, tony@atomide.com,
	richardcochran@gmail.com, parvathi@couthit.com,
	schnelle@linux.ibm.com, rdunlap@infradead.org,
	diogo.ivo@siemens.com, m-karicheri2@ti.com, horms@kernel.org,
	jacob.e.keller@intel.com, m-malladi@ti.com,
	javier.carrasco.cruz@gmail.com, afd@ti.com, s-anna@ti.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, pratheesh@ti.com, prajith@ti.com,
	vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
	krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
Subject: Re: [RFC PATCH 01/10] dt-bindings: net: ti: Adds device tree binding
 for DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
Message-ID: <20250110161542.GA2966768-robh@kernel.org>
References: <20250109105600.41297-1-basharath@couthit.com>
 <20250109105600.41297-2-basharath@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109105600.41297-2-basharath@couthit.com>

On Thu, Jan 09, 2025 at 04:25:51PM +0530, Basharath Hussain Khaja wrote:
> From: Parvathi Pudi <parvathi@couthit.com>
> 
> Documentation update for the newly added "pruss2_eth" device tree
> node and its dependencies along with compatibility for PRU-ICSS
> Industrial Ethernet Peripheral (IEP), PRU-ICSS Enhanced Capture
> (eCAP) peripheral and using YAML binding document for AM57xx SoCs.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> ---
>  .../devicetree/bindings/net/ti,icss-iep.yaml  |   6 +
>  .../bindings/net/ti,icssm-prueth.yaml         | 153 ++++++++++++++++++
>  .../bindings/net/ti,pruss-ecap.yaml           |  32 ++++
>  .../devicetree/bindings/soc/ti/ti,pruss.yaml  |   9 ++
>  4 files changed, 200 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
>  create mode 100644 Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
> index e36e3a622904..afacdb61a84c 100644
> --- a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
> @@ -8,18 +8,24 @@ title: Texas Instruments ICSS Industrial Ethernet Peripheral (IEP) module
>  
>  maintainers:
>    - Md Danish Anwar <danishanwar@ti.com>
> +  - Parvathi Pudi <parvathi@couthit.com>
> +  - Basharath Hussain Khaja <basharath@couthit.com>
>  
>  properties:
>    compatible:
>      oneOf:
>        - items:
>            - enum:
> +              - ti,am5728-icss-iep
>                - ti,am642-icss-iep
>                - ti,j721e-icss-iep
>            - const: ti,am654-icss-iep
>  
>        - const: ti,am654-icss-iep
>  
> +      - items:
> +          - enum:
> +              - ti,am5728-icss-iep

You can't have both. It's either compatible with ti,am654-icss-iep or it 
isn't.

>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
> new file mode 100644
> index 000000000000..34d68619c086
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
> @@ -0,0 +1,153 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ti,icssm-prueth.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments ICSSM PRUSS Ethernet
> +
> +maintainers:
> +  - Roger Quadros <rogerq@ti.com>
> +  - Andrew F. Davis <afd@ti.com>
> +  - Parvathi Pudi <parvathi@couthit.com>
> +  - Basharath Hussain Khaja <basharath@couthit.com>
> +
> +description:
> +  Ethernet based on the Programmable Real-Time Unit and Industrial
> +  Communication Subsystem.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,am57-prueth     # for AM57x SoC family
> +
> +  sram:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to OCMC SRAM node
> +
> +  ti,mii-rt:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to MII_RT module's syscon regmap
> +
> +  ti,iep:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to IEP (Industrial Ethernet Peripheral) for ICSS
> +
> +  ecap:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to Enhanced Capture (eCAP) event for ICSS
> +
> +  interrupts:
> +    maxItems: 2
> +    description:
> +      Interrupt specifiers to IRQ.

Provide a description for each entry because I can't decipher the names.

> +
> +  interrupt-names:
> +    items:
> +      - const: rx_lre_hp
> +      - const: rx_lre_lp

The same prefix or suffix on every entry is usually redundant.

> +
> +  ethernet-ports:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      ^port@[0-1]$:

ethernet-port

> +        type: object
> +        description: ICSSM PRUETH external ports
> +        $ref: ethernet-controller.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          reg:
> +            items:
> +              - enum: [0, 1]
> +            description: ICSSG PRUETH port number
> +
> +          interrupts:
> +            maxItems: 3
> +
> +          interrupt-names:
> +            items:
> +              - const: rx
> +              - const: emac_ptp_tx
> +              - const: hsr_ptp_tx
> +
> +          ti,no-half-duplex:
> +            type: boolean
> +            description:
> +              Disable half duplex operation on ICSSM MII port.
> +
> +        required:
> +          - reg

blank line

> +    anyOf:
> +      - required:
> +          - port@0
> +      - required:
> +          - port@1
> +
> +required:
> +  - compatible
> +  - sram
> +  - ti,mii-rt
> +  - ti,iep
> +  - ecap
> +  - ethernet-ports
> +  - interrupts
> +  - interrupt-names
> +
> +allOf:
> +  - $ref: /schemas/remoteproc/ti,pru-consumer.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    /* Dual-MAC Ethernet application node on PRU-ICSS2 */
> +    pruss2_eth: pruss2-eth {
> +      compatible = "ti,am57-prueth";
> +      ti,prus = <&pru2_0>, <&pru2_1>;
> +      sram = <&ocmcram1>;
> +      ti,mii-rt = <&pruss2_mii_rt>;
> +      ti,iep = <&pruss2_iep>;
> +      ecap = <&pruss2_ecap>;
> +      interrupts = <20 2 2>, <21 3 3>;
> +      interrupt-names = "rx_lre_hp", "rx_lre_lp";
> +      interrupt-parent = <&pruss2_intc>;
> +
> +      ethernet-ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        pruss2_emac0: port@0 {
> +          reg = <0>;
> +          phy-handle = <&pruss2_eth0_phy>;
> +          phy-mode = "mii";
> +          interrupts = <20 2 2>, <26 6 6>, <23 6 6>;
> +          interrupt-names = "rx", "emac_ptp_tx", "hsr_ptp_tx";
> +          ti,no-half-duplex;
> +          /* Filled in by bootloader */
> +          local-mac-address = [00 00 00 00 00 00];
> +        };
> +
> +        pruss2_emac1: port@1 {
> +          reg = <1>;
> +          phy-handle = <&pruss2_eth1_phy>;
> +          phy-mode = "mii";
> +          interrupts = <21 3 3>, <27 9 7>, <24 9 7>;
> +          interrupt-names = "rx", "emac_ptp_tx", "hsr_ptp_tx";
> +          ti,no-half-duplex;
> +          /* Filled in by bootloader */
> +          local-mac-address = [00 00 00 00 00 00];
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml b/Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
> new file mode 100644
> index 000000000000..d42e636bf516
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ti,pruss-ecap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments PRU-ICSS Enhanced Capture (eCAP) event module
> +
> +maintainers:
> +  - Murali Karicheri <m-karicheri2@ti.com>
> +  - Parvathi Pudi <parvathi@couthit.com>
> +  - Basharath Hussain Khaja <basharath@couthit.com>
> +
> +properties:
> +  compatible:
> +    const: ti,pruss-ecap
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pruss0_ecap: ecap@30000 {

Drop unused labels.

> +        compatible = "ti,pruss-ecap";
> +        reg = <0x30000 0x60>;
> +    };
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> index 927b3200e29e..ddd65bd93aa1 100644
> --- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> @@ -251,6 +251,15 @@ patternProperties:
>  
>      type: object
>  
> +  ecap@[a-f0-9]+$:
> +    description: |

Don't need '|'

> +      PRU-ICSS has a Enhanced Capture (eCAP) event module which can generate
> +      and capture periodic timer based events which will be used for features
> +      like RX Pacing to rise interrupt when the timer event has occurred.
> +      Each PRU-ICSS instance has one eCAP modeule irrespective of SOCs.
> +
> +    type: object
> +
>    mii-rt@[a-f0-9]+$:
>      description: |
>        Real-Time Ethernet to support multiple industrial communication protocols.
> -- 
> 2.34.1
> 

