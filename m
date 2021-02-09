Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6D13156FF
	for <lists+linux-omap@lfdr.de>; Tue,  9 Feb 2021 20:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233434AbhBITkK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Feb 2021 14:40:10 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:46087 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233678AbhBIT0F (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Feb 2021 14:26:05 -0500
Received: by mail-ot1-f54.google.com with SMTP id r21so10032786otk.13;
        Tue, 09 Feb 2021 11:25:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RB4gkqk5AYTbNT/R8winPDN2DYkri5HM/6w5VZS/1Pk=;
        b=YMTwOcU5sv5I3cd/W/2EedHbvaPDNbt2NN//Qy3xgL5gjbEmbsNGOvR8a90JfFKR0V
         6cXURSBaTL2nsr3PWJfqPLdZwbYqseGrS49Imjmkh8R1i1u94LgWdRMtwZ0ISUIvkt7a
         fVFB4ByoXinmsOcUtu5z5dG23dFS4ZWu3whYkpW/KC2EyFSNu03TnDSSoxcTbuFP0Fg+
         VdKCWoW1Brxxsm+RGOAXrqTaxwuLl5ONsadx8Y5ci957FeA2FX/4fztKebXQCRFKd7qp
         u+qshwrFEU4lIXudnuNJKiGG/D1w7+jtqFy/b2Y5ad6sCtrecwjUHPEQOZ48uyOL1bhb
         z7Cw==
X-Gm-Message-State: AOAM533XAZ0Drd91lrbifqn5vQ+SYKpsc2dPCEoc2MAKwT4+Ddgd1kh6
        2WoCXbDIg6ea2DajBfOjnA==
X-Google-Smtp-Source: ABdhPJxxvPhM+OSfew3karFAzcYa0P9ij1U8TKfB94l0ChQ1/miK/474/lYC8+KwAEutNmXE8OfWCw==
X-Received: by 2002:a9d:42b:: with SMTP id 40mr17437092otc.248.1612898685319;
        Tue, 09 Feb 2021 11:24:45 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n7sm668778otk.48.2021.02.09.11.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 11:24:44 -0800 (PST)
Received: (nullmailer pid 3216 invoked by uid 1000);
        Tue, 09 Feb 2021 19:24:43 -0000
Date:   Tue, 9 Feb 2021 13:24:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Jassi Brar <jassisinghbrar@gmail.com>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: omap: Update binding for AM64x
 SoCs
Message-ID: <20210209192443.GA4192418@robh.at.kernel.org>
References: <20210127195600.23501-1-s-anna@ti.com>
 <20210127195600.23501-2-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127195600.23501-2-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Jan 27, 2021 at 01:55:59PM -0600, Suman Anna wrote:
> Update the existing OMAP Mailbox binding to include the info for
> AM64x SoCs. There are some minor IP integration differences between
> the AM64x SoCs and the previous AM65x and J721E SoC families.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  .../bindings/mailbox/omap-mailbox.txt         | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt b/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
> index 5fe80c1c19fc..c993d1a5c14a 100644
> --- a/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
> +++ b/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
> @@ -28,6 +28,9 @@ SoCs has each of these instances form a cluster and combine multiple clusters
>  into a single IP block present within the Main NavSS. The interrupt lines from
>  all these clusters are multiplexed and routed to different processor subsystems
>  over a limited number of common interrupt output lines of an Interrupt Router.
> +The AM64x SoCS also uses a single IP block comprising of multiple clusters,
> +but the number of clusters are smaller, and the interrupt output lines are
> +connected directly to various processors.
>  
>  Mailbox Device Node:
>  ====================
> @@ -42,6 +45,7 @@ Required properties:
>  			    "ti,omap4-mailbox" for OMAP44xx, OMAP54xx, AM33xx,
>  						   AM43xx and DRA7xx SoCs
>  			    "ti,am654-mailbox" for K3 AM65x and J721E SoCs
> +			    "ti,am64-mailbox" for K3 AM64x SoCs
>  - reg:			Contains the mailbox register address range (base
>  			address and length)
>  - interrupts:		Contains the interrupt information for the mailbox
> @@ -178,3 +182,21 @@ mailbox: mailbox@480c8000 {
>  		};
>  	};
>  };
> +
> +4. /* AM64x */
> +&cbass_main {

Please don't add examples for just a new compatible.

> +	mailbox0_cluster2: mailbox@29020000 {
> +		compatible = "ti,am64-mailbox";
> +		reg = <0x00 0x29020000 0x00 0x200>;
> +		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
> +		             <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> +		#mbox-cells = <1>;
> +		ti,mbox-num-users = <4>;
> +		ti,mbox-num-fifos = <16>;
> +
> +		mbox_main_r5fss0_core0: mbox-main-r5fss0-core0 {
> +			ti,mbox-rx = <0 0 2>;
> +			ti,mbox-tx = <1 0 2>;
> +		};
> +	};
> +};
> -- 
> 2.29.2
> 
