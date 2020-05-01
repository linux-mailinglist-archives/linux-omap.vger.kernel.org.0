Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77CAC1C1F78
	for <lists+linux-omap@lfdr.de>; Fri,  1 May 2020 23:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgEAVT1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 May 2020 17:19:27 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38837 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbgEAVT0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 May 2020 17:19:26 -0400
Received: by mail-oi1-f194.google.com with SMTP id r66so913344oie.5;
        Fri, 01 May 2020 14:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Jj4D32rdAES+cgO6FKoAP2CT6fMwIDdMNHoTKo0+8Lk=;
        b=Z90d664sGc83VZKz8HjAZv1HJWkK0dJjAeVZMHN6N3DEqmSRNXBt9E5IlC3RMImv7g
         Ps8OapDudqwt8sa5W/CEj9oZ/8HSx9p/757NxVlaYqNNZnjmyW3bWPDQA/ESlly3LZfz
         DBgqojLciMdibiONvNVW6NmlYGxdaqTftQtszdQU3rZ/Sxk5ckmEx78be0/NXy5NZbH9
         /7vZIl5O0f6moYTuaJs5/ix0ealX/0skyOXt9/+nL/GH0GdXCwMeeE1AnOOWAdgZPHcN
         dLL80PcfAzxKB4Y7Kzb+Epa1PAeuZZn61wEwyRtQvnkHr245iip4Ta03eou8rxkBMvqx
         knew==
X-Gm-Message-State: AGi0PuZ55nPvVN5kDd/arMzhh25KZ0Wn9xxuXhsadickXr0YwOLkj+Cx
        dAXbDuGs2m/oz0ByonYHDw==
X-Google-Smtp-Source: APiQypIXivSBT2nsxuhVNY46WEmi1eojgcxHInHjaqkl2sBu8RqSX6qkRxz94QmIS/CqfLVJIXnqUg==
X-Received: by 2002:aca:c50f:: with SMTP id v15mr1230004oif.115.1588367965592;
        Fri, 01 May 2020 14:19:25 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a93sm1128819otc.12.2020.05.01.14.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 14:19:25 -0700 (PDT)
Received: (nullmailer pid 14891 invoked by uid 1000);
        Fri, 01 May 2020 21:19:24 -0000
Date:   Fri, 1 May 2020 16:19:24 -0500
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
Subject: Re: [PATCH 4/6] dt-bindings: gnss: Add binding for Motorola Mapphone
 MDM6600 GNSS
Message-ID: <20200501211924.GB6222@bogus>
References: <20200430174615.41185-1-tony@atomide.com>
 <20200430174615.41185-5-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430174615.41185-5-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Apr 30, 2020 at 10:46:13AM -0700, Tony Lindgren wrote:
> Add a binding document for Motorola Mapphone MDM6600 GNSS driver that
> can be used with phones such as droid4.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  .../devicetree/bindings/gnss/motmdm.yaml      | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gnss/motmdm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gnss/motmdm.yaml b/Documentation/devicetree/bindings/gnss/motmdm.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gnss/motmdm.yaml
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gnss/motmdm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Motorola Mapphone MDM6600 GNSS binding
> +
> +maintainers:
> +  - Tony Lindgren <tony@atomide.com>
> +
> +properties:
> +  compatible:
> +    const: motorola,mapphone-mdm6600-gnss
> +
> +  reg:
> +    items:
> +      description: TS 27.010 channel the GNSS device is using
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    gnss@4 {

This is a child of what's in patch 2? I think I'd just combine this 
schema into it.

Or you can leave it, but better to have complete examples (which will 
help fix what my bot reports). Examples have a default 
#address/size-cells of 1.

> +      compatible = "motorola,mapphone-mdm6600-gnss";
> +      reg = <4>;
> +    };
> -- 
> 2.26.2
