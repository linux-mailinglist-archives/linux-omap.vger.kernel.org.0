Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D06A16523C
	for <lists+linux-omap@lfdr.de>; Wed, 19 Feb 2020 23:13:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727662AbgBSWNN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Feb 2020 17:13:13 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41685 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727232AbgBSWNN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 19 Feb 2020 17:13:13 -0500
Received: by mail-oi1-f196.google.com with SMTP id i1so25433925oie.8;
        Wed, 19 Feb 2020 14:13:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QCDRXvFi+gR1oNSsjcXCHacRJtQD8q7DV4e37/61Byk=;
        b=smef+T69eC9WkkzH2P5wIDQyYMnCrd3sj13Bweli4qiH0kH0xJEvbFt2kY7g6YFfcF
         e6ffo4ZltG871JHoSK64NHJR2YhAqmCKiQK3yJVkYmhSRIlM3XJZYcATerpeZQ1Ea08k
         8N5eSLFXDLeP2xbxllwPU5kujZCiW95MdLCJKJjLTivatwtPyP/43YuJv/3Xb++9+5a6
         AWZps9F+1Z0kMgxQ5gBk4jJZNFcK6iAt8qYxWTlj87F5Ad82D57L/YFSw2m0yHoRRzKX
         CfXFoZgbNWfIt5ro6XTTX0UTr5oWR3ifPv4r6CBY5OJ35wkVeAdD/HeMTVjsjODWPPil
         SeiQ==
X-Gm-Message-State: APjAAAUxDvzQ6b4kd9o/5QTIJJCkNAJnbR1O6wZ3xlJpGfZU5oZk0kL5
        64k3PAVgLRA+hMfPoNS6wg==
X-Google-Smtp-Source: APXvYqwLFvsnaggZIZ/FphpHVECAI3EPZlrYh7AiYB66zYzCl73IpPqpn2LPQw1Q8GLsGZZvQeYS7w==
X-Received: by 2002:aca:4306:: with SMTP id q6mr6190796oia.54.1582150392520;
        Wed, 19 Feb 2020 14:13:12 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n25sm418938oic.6.2020.02.19.14.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 14:13:11 -0800 (PST)
Received: (nullmailer pid 30690 invoked by uid 1000);
        Wed, 19 Feb 2020 22:13:10 -0000
Date:   Wed, 19 Feb 2020 16:13:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Jiri Slaby <jslaby@suse.cz>, Johan Hovold <johan@kernel.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: mfd: motmdm: Add binding for
 motorola-mdm
Message-ID: <20200219221310.GA26624@bogus>
References: <20200210040107.10306-1-tony@atomide.com>
 <20200210040107.10306-4-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200210040107.10306-4-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Feb 09, 2020 at 08:01:05PM -0800, Tony Lindgren wrote:
> Add a binding document for Motorola modems controllable by
> TS 27.010 UART line discipline using serdev drivers.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  .../mfd/motorola,mapphone-mdm6600.yaml        | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/motorola,mapphone-mdm6600.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/motorola,mapphone-mdm6600.yaml b/Documentation/devicetree/bindings/mfd/motorola,mapphone-mdm6600.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/motorola,mapphone-mdm6600.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings please:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/motorola,mapphone-mdm6600.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Motorola Mapphone MDM6600 Modem
> +
> +maintainers:
> +  - Tony Lindgren <tony@atomide.com>
> +
> +allOf:
> +  - $ref: "motorola,mapphone-mdm6600.yaml#"

Huh? A recursive include? I'm not sure how that didn't blow up.

> +
> +properties:
> +  compatible:
> +    items:
> +      - const: motorola,mapphone-mdm6600-serial
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: usb
> +
> +required:
> +  - compatible
> +  - phys
> +  - phy-names
> +
> +examples:
> +  - |
> +    modem {
> +        compatible = "motorola,mapphone-mdm6600-serial";
> +        phys = <&fsusb1_phy>;
> +        phy-names = "usb";
> +    };
> -- 
> 2.25.0
