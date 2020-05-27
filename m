Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6A51E4E20
	for <lists+linux-omap@lfdr.de>; Wed, 27 May 2020 21:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgE0T2V (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 May 2020 15:28:21 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35901 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgE0T2V (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 May 2020 15:28:21 -0400
Received: by mail-io1-f65.google.com with SMTP id y18so6951703iow.3;
        Wed, 27 May 2020 12:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bgk9XpqXSxucV5OMC4BoaIOWVkM3DvrsJIDo7nwW2GA=;
        b=h6pSbWeXmTcoLy6Xah1Q2OBlmdmbgTl+hzps5MCINZD31132xk9WObg9EV5taIhJzA
         /gnX5nVe7VGhxdz7+olrPf9xvAjp+pAZyqqIJ/GxbOLZ0C/ZGZxepVb0mNwYLx/mRHOz
         btbjmwu18I3Au91kJpXVF177BUtfHV68otsZocHFXN8U0KQAPOjq1dhLY9rbIL75UEul
         mMFzg9EDZLLNGsfIEvojwuTLAOWIbES+0ZAVYw3kf5eU7TLFiOcyYX8yzfSNQVFv3md8
         iVytEb05A2BkvKPMy8n+4YWFXGIFLt8dZ+oJQo8ZdROEscJdVY+fPc4bKgBOq/dxYEYW
         +yiA==
X-Gm-Message-State: AOAM532ufOqeccsVwPmD1bUyXjfV9cWvNW3p7BQFNnglhtjK3vUagl5d
        hF6WueRu8xg6umv/vQpPiA==
X-Google-Smtp-Source: ABdhPJz2AR1rkipQGqnDMAjyexmb3CQOj9FvL6X/yiuBHdY+4XWSLol+S+ivS3k+KdxI0/RLJhY2Ww==
X-Received: by 2002:a05:6602:2001:: with SMTP id y1mr12134767iod.94.1590607700123;
        Wed, 27 May 2020 12:28:20 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id j15sm1989870ilk.0.2020.05.27.12.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 12:28:19 -0700 (PDT)
Received: (nullmailer pid 2597176 invoked by uid 1000);
        Wed, 27 May 2020 19:28:17 -0000
Date:   Wed, 27 May 2020 13:28:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: serdev: ngsm: Add binding for GNSS
 child node
Message-ID: <20200527192817.GA2587830@bogus>
References: <20200512214713.40501-1-tony@atomide.com>
 <20200512214713.40501-4-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512214713.40501-4-tony@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 12, 2020 at 02:47:10PM -0700, Tony Lindgren wrote:
> For motorola modem case, we may have a GNSS device on channel 4.
> Let's add that to the binding and example.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  .../devicetree/bindings/serdev/serdev-ngsm.yaml          | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml b/Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml
> --- a/Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml
> +++ b/Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml
> @@ -42,6 +42,10 @@ allOf:
>            description: Name of the USB PHY
>            const: usb
>  
> +        compatible:
> +          description: GNSS receiver
> +          const: motorola,mapphone-mdm6600-gnss

I'm not sure how this isn't failing on the example because it is wrong.

You're saying this compatible belongs at the same level as 
phys/phy-names, but that would be the parent which already has a 
compatible. You have to define a child node property (gnss@4) and have 
'compatible' under it. At that point, this schema becomes very much 
Motorola specific.

> +
>        required:
>          - phys
>          - phy-names
> @@ -61,4 +65,9 @@ examples:
>        phy-names = "usb";
>        #address-cells = <1>;
>        #size-cells = <0>;
> +
> +      gnss@4 {
> +         compatible = "motorola,mapphone-mdm6600-gnss";
> +         reg = <4>;
> +      };
>      };
> -- 
> 2.26.2
