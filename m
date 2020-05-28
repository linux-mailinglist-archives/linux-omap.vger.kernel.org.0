Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 810331E5C35
	for <lists+linux-omap@lfdr.de>; Thu, 28 May 2020 11:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728393AbgE1JiS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 May 2020 05:38:18 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40082 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728349AbgE1JiS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 May 2020 05:38:18 -0400
Received: by mail-lf1-f65.google.com with SMTP id h188so16218177lfd.7;
        Thu, 28 May 2020 02:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3DZzfbx7fomO5n8zhObmTL7qmjslNz2KG47zPiBbgV8=;
        b=docWpHKgAm5TX/YkNfOWQw/S5LIxWLXQom1gvoqUV/mondJ8Z0phgCPeAcA2tHdd38
         hdFIfOgYmi8tnVZ29JyHnPWYSyWUhCan2OTE5xMptRCxX206Rdf6hVcNXqzUXrL1VIYG
         2vsEBG11sZvCXFhFGAhkMqkvY5lkXjNeyMmpAcARQPwC9kMDhkn31EQL77RywmTN8ciR
         mV93PmmULSyIRG5sFc4i/rlrPRs3jPpa+oztZ8lA2f47AVGAqT0qls83aOOToeZWS0SE
         BAziwDUchlf/QYYmnfCWvR9qNpWIxXwxze/TRbmwON8U4TUTQBX3Y3iLm+vCuTMOrZoz
         PTrQ==
X-Gm-Message-State: AOAM53046xRBvf4dItWai+kl7dHg4tofd+zWTXUJbhQeXDckYWitIbAY
        gQD+ZTvI6jIFZsQdZsnWXHvZzVFa
X-Google-Smtp-Source: ABdhPJxZk2rNhXXCPFrujOuLeGbigFmyCfaY63bdPW73r0WB9iWuIDwUzky0O0i8EdtK4ZZxr7e73Q==
X-Received: by 2002:a19:550e:: with SMTP id n14mr1261909lfe.81.1590658695053;
        Thu, 28 May 2020 02:38:15 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id 18sm1324769ljv.107.2020.05.28.02.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 02:38:14 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jeEzH-0003NG-Cz; Thu, 28 May 2020 11:38:07 +0200
Date:   Thu, 28 May 2020 11:38:07 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: serdev: ngsm: Add binding for
 serdev-ngsm
Message-ID: <20200528093807.GD10358@localhost>
References: <20200512214713.40501-1-tony@atomide.com>
 <20200512214713.40501-3-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512214713.40501-3-tony@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 12, 2020 at 02:47:09PM -0700, Tony Lindgren wrote:
> Add a binding document for a generic serdev-ngsm driver that can be
> used to bring up TS 27.010 line discipline with Linux n_gsm support
> on a serial port.
> 
> As the Motorola Mapphone modems require some custom handling, they
> are handled with a separate compatible.
> 
> Let's also add vendor string for ETSI as we're using a ETSI 3GPP
> TS 27.010 standard.
> 
> Reviewed-by: Pavel Machek <pavel@ucw.cz>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  .../bindings/serdev/serdev-ngsm.yaml          | 64 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml b/Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/serdev/serdev-ngsm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic serdev-ngsm TS 27.010 driver
> +
> +maintainers:
> +  - Tony Lindgren <tony@atomide.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - etsi,3gpp-ts27010-adaption1
> +      - motorola,mapphone-mdm6600-serial
> +
> +  ttymask:
> +    $ref: /schemas/types.yaml#/definitions/uint64
> +    description: Mask of the TS 27.010 channel TTY interfaces to start (64 bit)
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: motorola,mapphone-mdm6600-serial
> +    then:
> +      properties:
> +        phys:
> +          $ref: /schemas/types.yaml#/definitions/phandle-array
> +          description: USB PHY needed for shared GPIO PM wake-up pins
> +          maxItems: 1
> +
> +        phy-names:
> +          description: Name of the USB PHY
> +          const: usb

As I've mentioned before, I think this whole USB phy dependency is
misleading and doesn't accurately describe the hardware as devicetree
should.

It's the modem that needs to be woken up regardless of whether you use
its USB or serial interface.

> +
> +      required:
> +        - phys
> +        - phy-names
> +
> +required:
> +  - compatible
> +  - ttymask

This is a new property which it seems you forgot define. Currently it
looks like a linuxism ("tty") which doesn't belong in the devicetree.

Perhaps a rename is all that's needed (e.g. portmask or similar).

> +  - "#address-cells"
> +  - "#size-cells"
> +
> +examples:
> +  - |
> +    modem {
> +      compatible = "motorola,mapphone-mdm6600-serial";
> +      ttymask = <0 0x00001fee>;
> +      phys = <&fsusb1_phy>;
> +      phy-names = "usb";
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +    };
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -323,6 +323,8 @@ patternProperties:
>      description: Espressif Systems Co. Ltd.
>    "^est,.*":
>      description: ESTeem Wireless Modems
> +  "^etsi,.*":
> +    description: ETSI

Spell out the acronym?

>    "^ettus,.*":
>      description: NI Ettus Research
>    "^eukrea,.*":

Johan
