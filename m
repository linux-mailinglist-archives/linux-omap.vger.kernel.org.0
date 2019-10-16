Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C551D946F
	for <lists+linux-omap@lfdr.de>; Wed, 16 Oct 2019 16:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405818AbfJPOz0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Oct 2019 10:55:26 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:43988 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405817AbfJPOzZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Oct 2019 10:55:25 -0400
Received: by mail-io1-f68.google.com with SMTP id v2so54162900iob.10;
        Wed, 16 Oct 2019 07:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WsRXU2seKLqonJyjXRBsnNj1M9VdSNz6TzMXTF2DqOE=;
        b=gpLeVx0lT1xzsOOJKDlnAf0oUpt5+fFrIs1kgXhcsJyXK8Lksxss8daWaaxFU/1ke6
         EI3CYVCI/gjBVHYHF5Aqe61wIn5OYFHamutZQnz7rnBU6yrDgLWJpHfTdE3r0GdpEJed
         6Iu8Dt9jevfXRR9SGydsQM0s8BIj/IaPIm8bhqxix9sJwzOE4nC6C7PnNx1kzY/E69Ln
         PLQOHZpkruD8jEjM4YM4ABlrSj4NRVJ7IjMgXSQrryrFirAfne6PiDp4oB5iMCgo3nbO
         vX5/gIdT9dHIXlUI0IuyhOxa8vLH5tdR+Od2MGlpBCtAtVu9rnVow0bnZSgmwX5do2As
         orKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WsRXU2seKLqonJyjXRBsnNj1M9VdSNz6TzMXTF2DqOE=;
        b=p3Gwh01c86/q0msxX2w/YRAvG7mE7nkiJmDAx5S4m71GtpNnDX4ZzSrSdnOg60jG/x
         GuKIFfAvP56gMmYtXUB8k0EcQDDRfkVaVBUh7syDZltHZykAfa9j0dWkSmc6H1sgDHV/
         1UXJXBkTFg21iCqu1HkzFnZtHXL+sj6AYoxusv+z/nFBhaTD7s0cz3mbqhUO76F/fGYR
         GmwsiVn3mBu+ybJXbclnIySU9ynXIDvKphRDkZZLm2Gt8+vJM9TAFBud5WyzXcSZ0qDx
         u9C5ljY95ScAW+GoGcZtjThxWNrs49fNcMqM9lhhv9R4w3rMPXr9th5duSasbEW5oFN0
         6Now==
X-Gm-Message-State: APjAAAXL36Exb1u8bSrpLsYpaKm+wy/75wAsUrDhEMEHO+Tg+0sLtdgO
        FQgmyVK5pSbOXu7lj+FjyiOVu596w5/pBDwuD4w=
X-Google-Smtp-Source: APXvYqwZrFFGnXE2/LlaSltNPG5F0vYPaaUxMhoyXQyYWQpz1kDoiel4AdpJBMLakJV8NtyF44Gkecosan9olvXX4BQ=
X-Received: by 2002:a5d:9952:: with SMTP id v18mr26088875ios.58.1571237723091;
 Wed, 16 Oct 2019 07:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191016135147.7743-1-aford173@gmail.com> <20191016135147.7743-2-aford173@gmail.com>
 <20191016144018.GG5175@pendragon.ideasonboard.com>
In-Reply-To: <20191016144018.GG5175@pendragon.ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 16 Oct 2019 09:55:11 -0500
Message-ID: <CAHCN7xJhHHoia_o4rb0VgvCP71X94Pvem684F2quMijNNpNxVA@mail.gmail.com>
Subject: Re: [PATCH V5 2/3] dt-bindings: Add Logic PD Type 28 display panel
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 16, 2019 at 9:40 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Adam,
>
> Thank you for the patch.
>
> On Wed, Oct 16, 2019 at 08:51:46AM -0500, Adam Ford wrote:
> > This patch adds documentation of device tree bindings for the WVGA panel
> > Logic PD Type 28 display.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > ---
> > V5:  Replace GPIO_ACTIVE_HIGH with 0 to fix make dt_binding_check -k
> > V4:  Update per Rob H's suggestions and copy other panel yaml example from 5.4-rc1
> > V3:  Correct build errors from 'make dt_binding_check'
> > V2:  Use YAML instead of TXT for binding
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml b/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml
> > new file mode 100644
> > index 000000000000..2834287b8d88
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml
> > @@ -0,0 +1,42 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/logicpd,type28.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Logic PD Type 28 4.3" WQVGA TFT LCD panel
> > +
> > +maintainers:
> > +  - Adam Ford <aford173@gmail.com>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: logicpd,type28
> > +
> > +  power-supply: true
> > +  enable-gpios: true
> > +  backlight: true
> > +  port: true
> > +
> > +required:
> > +  - compatible
>
> Should the port be required too ? Apart from that,

I supposed that's true, but I used ampire,am-480272h3tmqw-t01h.yaml as
the example, and it doesn't list it as a required item.
Is there anything else I need to address?  I feel like I'm trying to
hit a moving target.

adam
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    lcd0: display {
> > +      compatible = "logicpd,type28";
> > +      enable-gpios = <&gpio5 27 0>;
> > +      backlight = <&backlight>;
> > +      port {
> > +        lcd_in: endpoint {
> > +          remote-endpoint = <&dpi_out>;
> > +        };
> > +      };
> > +    };
> > +
> > +...
>
> --
> Regards,
>
> Laurent Pinchart
