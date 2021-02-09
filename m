Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16FA031548D
	for <lists+linux-omap@lfdr.de>; Tue,  9 Feb 2021 18:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232992AbhBIRBM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Feb 2021 12:01:12 -0500
Received: from mail-ot1-f48.google.com ([209.85.210.48]:41070 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232953AbhBIRBJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Feb 2021 12:01:09 -0500
Received: by mail-ot1-f48.google.com with SMTP id s107so18064294otb.8;
        Tue, 09 Feb 2021 09:00:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y8TeBLOmzfFfpZzlPtDxoUFP64ezbCJGhYftb61vGiQ=;
        b=EqWueqR1MHghokf9kvZzU5b02cQ825ApiDuSWonpj2xqTlN14OTbeMA7J252oTwWdg
         taUaSRaaMIhYLgFL6lV8bZJoKgunVEH96TtGSS4F8w2fVL+TIhmtPq39CNB4vquTuljB
         Alz/RJuJ1rXBp0zzVZkpR+ifWdZxPvug7a2ydE2NKLCIsWoNDzEQtLeHZtNzJmvqeYVx
         XdcQ8dl+FWCeYbZFCtSfOj1uSqUoEiYVOKucxyepYHbYI+s7vpNIG/HLfdoWwCPAG8mh
         TOvBLGqznybhABNYnqRU5qPzWma2ImIzqr1jqEhSl5vX4RvNDEYB+OLNKbKkfQ7WYgDV
         B0Iw==
X-Gm-Message-State: AOAM532e1nzwmsgJwz50OyEs3cOc8YOsFlxzVS2+s1FEOryzwEoXfvsc
        ufZp3HPiix13zATN9Si0Ew==
X-Google-Smtp-Source: ABdhPJwt1iqcyfLSNCa+WJl49vNU1QSnGo6FL49KCVk7vj1wWiZg4P85gMbMvxQ21AZMB3FNVw2lTA==
X-Received: by 2002:a9d:5f05:: with SMTP id f5mr12390332oti.234.1612890027602;
        Tue, 09 Feb 2021 09:00:27 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x7sm4329323oot.15.2021.02.09.09.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 09:00:26 -0800 (PST)
Received: (nullmailer pid 3932832 invoked by uid 1000);
        Tue, 09 Feb 2021 17:00:25 -0000
Date:   Tue, 9 Feb 2021 11:00:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwlock: Update OMAP HwSpinlock binding
 for AM64x SoCs
Message-ID: <20210209170025.GA3927023@robh.at.kernel.org>
References: <20210125235653.24385-1-s-anna@ti.com>
 <20210125235653.24385-2-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125235653.24385-2-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jan 25, 2021 at 05:56:52PM -0600, Suman Anna wrote:
> Update the existing OMAP HwSpinlock binding to include the info for
> AM64x SoCs. There are some minor IP integration differences between
> the AM64x SoCs and the previous AM65x and J721E SoC families. A new
> example is also added showcasing the difference in the IP's presence
> on the interconnect.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  .../bindings/hwlock/ti,omap-hwspinlock.yaml   | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
> index ac35491a6f65..ac146c0d628f 100644
> --- a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
> +++ b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
> @@ -14,6 +14,7 @@ properties:
>      enum:
>        - ti,omap4-hwspinlock  # for OMAP44xx, OMAP54xx, AM33xx, AM43xx, DRA7xx SoCs
>        - ti,am654-hwspinlock  # for K3 AM65x, J721E and J7200 SoCs
> +      - ti,am64-hwspinlock   # for K3 AM64x SoCs
>  
>    reg:
>      maxItems: 1
> @@ -74,3 +75,28 @@ examples:
>              };
>          };
>      };
> +
> +  - |
> +    / {
> +        /* K3 AM64x SoCs */
> +        model = "Texas Instruments K3 AM642 SoC";
> +        compatible = "ti,am642-evm", "ti,am642";
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        bus@f4000 {
> +            compatible = "simple-bus";
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges = <0x00 0x000f4000 0x00 0x000f4000 0x00 0x000002d0>, /* PINCTRL */
> +                     <0x00 0x01000000 0x00 0x01000000 0x00 0x02330400>, /* First peripheral window */
> +                     <0x00 0x0f000000 0x00 0x0f000000 0x00 0x00c44200>, /* Second peripheral window */
> +                     <0x00 0x20000000 0x00 0x20000000 0x00 0x0a008000>; /* Third peripheral window */
> +
> +            spinlock@2a000000 {

Why are you doing the whole hierarchy here? Don't do that.

In any case, a new compatible doesn't warrant a whole new example, so 
drop the example.

> +                compatible = "ti,am64-hwspinlock";
> +                reg = <0x00 0x2a000000 0x00 0x1000>;
> +                #hwlock-cells = <1>;
> +            };
> +        };
> +    };
> -- 
> 2.29.2
> 
