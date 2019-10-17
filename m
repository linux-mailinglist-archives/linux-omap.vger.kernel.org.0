Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9819DB04C
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 16:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437983AbfJQOmj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 10:42:39 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:34103 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437444AbfJQOmj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Oct 2019 10:42:39 -0400
Received: by mail-io1-f67.google.com with SMTP id q1so3342426ion.1;
        Thu, 17 Oct 2019 07:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yZfbOZSDn+GBucwbwmrlt57XdpVLll7ReX3tKoRiDII=;
        b=TJ7k3wmZkSmZRGwxzXl8ni5apLcRVgyHgXlVZmTN853xTgCywU/jS0DRpyulXktKFA
         Wp5w0u7G+QgTFBqleHVpdPHvgKQw8R/XFCh+6Aaryw5X//uTOMzLki38ytR1UJuFoq+C
         3g0hW5wewWMw4tgNkkLZTLKUqgtUXoi66j6vHQn1vIu6wOChW22lKO84gWBbDo/wWpe2
         1mdY3E1meYerma5fd4CpxB9XcYkjqRuqVXmcn7SoTH+6V5tFUbn095naw9fDWlnv3y49
         nS/tHvzPsGSsWryqvHENpkEL2d0Doru2/Z10qEJnaJN2n7qglLiQ1KcLwGkPhcs0YyMd
         /sqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yZfbOZSDn+GBucwbwmrlt57XdpVLll7ReX3tKoRiDII=;
        b=FGoYEhAPJfi1CRKp+yQSirErGNcpNX3mcAzH+wm7aU8Lu78y2tZwvG0qwBaGCD171d
         6UmWq8/pkpfuw09y6ISSWVO3ipxGndSAnMSPXsCuYbpU3mPKlFgLiKopJ5scqJlii6zP
         02wswYSDtNYmCjW85IW3RpH62aIZ/wFcJ+3LgzDkfPCtAR6q771r7mNflG7THbzWqEko
         aOkL3y5a5W01CE9EJAp04f8vFuDcLqMzLy8PgNX9ih12wx/ebED05OwXExKwBsIqp8Ji
         3da1Y9c4gISQZh1yEYS8GSsfIZQjS0iR7J00RE8WmR0PmMwzlofXdX0sM1+JhyPzDizZ
         9Edw==
X-Gm-Message-State: APjAAAVRiOVTS8hAzTFLcHq79AbitSZzCAac347Tzq1V0UjQhg6nbUhO
        IYTratwtiTbToaJW3F5vdmUsScTOW5eP3gTAz/g=
X-Google-Smtp-Source: APXvYqxLMVhS21hkfBuFNR8qm6HuMhexXhE0GwnhHg2kroaMYxz+FIVQK8husib62kCR6sWcwBK85nJh3Drpu3O6VnU=
X-Received: by 2002:a5d:83c1:: with SMTP id u1mr3466467ior.78.1571323357719;
 Thu, 17 Oct 2019 07:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20191016135147.7743-1-aford173@gmail.com> <20191016135147.7743-2-aford173@gmail.com>
 <20191016144018.GG5175@pendragon.ideasonboard.com> <CAHCN7xJhHHoia_o4rb0VgvCP71X94Pvem684F2quMijNNpNxVA@mail.gmail.com>
 <20191017143738.GA10960@bogus>
In-Reply-To: <20191017143738.GA10960@bogus>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 17 Oct 2019 09:42:25 -0500
Message-ID: <CAHCN7xJidCBmKL+BTWi_ZmiFyq-bjzzaJBYkQPyUBT+uKJVdaA@mail.gmail.com>
Subject: Re: [PATCH V5 2/3] dt-bindings: Add Logic PD Type 28 display panel
To:     Rob Herring <robh@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
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

On Thu, Oct 17, 2019 at 9:37 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Oct 16, 2019 at 09:55:11AM -0500, Adam Ford wrote:
> > On Wed, Oct 16, 2019 at 9:40 AM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Adam,
> > >
> > > Thank you for the patch.
> > >
> > > On Wed, Oct 16, 2019 at 08:51:46AM -0500, Adam Ford wrote:
> > > > This patch adds documentation of device tree bindings for the WVGA panel
> > > > Logic PD Type 28 display.
> > > >
> > > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > > ---
> > > > V5:  Replace GPIO_ACTIVE_HIGH with 0 to fix make dt_binding_check -k
> > > > V4:  Update per Rob H's suggestions and copy other panel yaml example from 5.4-rc1
> > > > V3:  Correct build errors from 'make dt_binding_check'
> > > > V2:  Use YAML instead of TXT for binding
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml b/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml
> > > > new file mode 100644
> > > > index 000000000000..2834287b8d88
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml
> > > > @@ -0,0 +1,42 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/panel/logicpd,type28.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Logic PD Type 28 4.3" WQVGA TFT LCD panel
> > > > +
> > > > +maintainers:
> > > > +  - Adam Ford <aford173@gmail.com>
> > > > +
> > > > +allOf:
> > > > +  - $ref: panel-common.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: logicpd,type28
> > > > +
> > > > +  power-supply: true
> > > > +  enable-gpios: true
> > > > +  backlight: true
> > > > +  port: true
> > > > +
> > > > +required:
> > > > +  - compatible
> > >
> > > Should the port be required too ? Apart from that,
> >
> > I supposed that's true, but I used ampire,am-480272h3tmqw-t01h.yaml as
> > the example, and it doesn't list it as a required item.
> > Is there anything else I need to address?  I feel like I'm trying to
> > hit a moving target.
>
> 'port' can be omitted because the panel can be a child node of
> the display controller instead. That's decided by the display controller
> binding, not the panel binding.
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thank you.  Sorry it took a while to get there.

adam
>
> Rob
