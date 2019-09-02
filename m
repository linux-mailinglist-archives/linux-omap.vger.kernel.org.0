Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 965FEA581B
	for <lists+linux-omap@lfdr.de>; Mon,  2 Sep 2019 15:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731325AbfIBNjT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Sep 2019 09:39:19 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38027 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731301AbfIBNjT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Sep 2019 09:39:19 -0400
Received: by mail-wr1-f66.google.com with SMTP id l11so5251311wrx.5;
        Mon, 02 Sep 2019 06:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mBpjwnSsFCTVBcmHZlpMrYye8G+2awgzTgrbzOvv4w4=;
        b=eqnKd+PA5OOWM5zv4c8rX48i+DSgbxxpb6FgKOfR9ZSpY0F+tEI7Ql5nvTedKHcUba
         1G9GNEn6TW3HNiO3hbnmbniuqgEjMbuARomEs9+P8cirSXSbpHnEIURsoQrBeaLJ8Sno
         j8t8voSEB0qKY+v6J08QIPXSnS/JHv7c5VEgCCWLDWl4pXWR0dhfnAXi+/CJbog4UMGE
         D53UqR92Sf55SQ6EC15VEtzTDwkWlDs+oJlA5jip4ndqKXbmRz+iNXbLdl7i/Zoau3Lk
         riSm7RFsFAKbWW++vg4LzCti3aSJijJdVPJXGvC2fqAkS7nYBTnU1OCGJ7o8yDJnDhX3
         E9lA==
X-Gm-Message-State: APjAAAUfSGma7yd8B7SmY4e2p4NKtBn2KdDvDWSXdbwl9e9K9UfRnzVS
        35cQgfEExo7SrgrIxYs9UQ==
X-Google-Smtp-Source: APXvYqw80tZ831GwJOJkT8zNmc12IMcFltPAd+Zpk7tUl46ueJLKOI89QyXozExV5CZuhbIYuxu0cw==
X-Received: by 2002:a5d:6647:: with SMTP id f7mr5887085wrw.170.1567431557093;
        Mon, 02 Sep 2019 06:39:17 -0700 (PDT)
Received: from localhost ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id g3sm14924272wrh.28.2019.09.02.06.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 06:39:16 -0700 (PDT)
Date:   Mon, 02 Sep 2019 14:39:16 +0100
From:   Rob Herring <robh@kernel.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     ssantosh@kernel.org, linux-omap@vger.kernel.org, tony@atomide.com,
        s-anna@ti.com, p.zabel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCHv3 01/10] dt-bindings: omap: add new binding for PRM
 instances
Message-ID: <20190902042631.GA22055@bogus>
References: <20190830121816.30034-1-t-kristo@ti.com>
 <20190830121816.30034-2-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830121816.30034-2-t-kristo@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Aug 30, 2019 at 03:18:07PM +0300, Tero Kristo wrote:
> Add new binding for OMAP PRM (Power and Reset Manager) instances. Each
> of these will act as a power domain controller and potentially as a reset
> provider.
> 

Converting this to schema would be nice.

> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  .../devicetree/bindings/arm/omap/prm-inst.txt | 31 +++++++++++++++++++

bindings/reset/

>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/omap/prm-inst.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/omap/prm-inst.txt b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
> new file mode 100644
> index 000000000000..7c7527c37734
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
> @@ -0,0 +1,31 @@
> +OMAP PRM instance bindings
> +
> +Power and Reset Manager is an IP block on OMAP family of devices which
> +handle the power domains and their current state, and provide reset
> +handling for the domains and/or separate IP blocks under the power domain
> +hierarchy.
> +
> +Required properties:
> +- compatible:	Must be one of:
> +		"ti,am3-prm-inst"
> +		"ti,am4-prm-inst"
> +		"ti,omap4-prm-inst"
> +		"ti,omap5-prm-inst"
> +		"ti,dra7-prm-inst"

'-inst' seems a bit redundant.

> +- reg:		Contains PRM instance register address range
> +		(base address and length)
> +
> +Optional properties:
> +- #reset-cells:	Should be 1 if the PRM instance in question supports resets.
> +- clocks:	Associated clocks for the reset signals if any. Certain reset
> +		signals can't be toggled properly without functional clock
> +		being active for them.
> +
> +Example:
> +
> +prm_dsp2: prm@1b00 {

reset-controller@...

> +	compatible = "ti,dra7-prm-inst";
> +	reg = <0x1b00 0x40>;
> +	#reset-cells = <1>;
> +	clocks = <&dsp2_clkctrl DRA7_DSP2_MMU0_DSP2_CLKCTRL 0>;
> +};
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

