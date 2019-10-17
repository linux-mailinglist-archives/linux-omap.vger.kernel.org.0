Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09E29DB02F
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 16:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403796AbfJQOhl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 10:37:41 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40278 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbfJQOhk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Oct 2019 10:37:40 -0400
Received: by mail-ot1-f67.google.com with SMTP id y39so2078450ota.7;
        Thu, 17 Oct 2019 07:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EVefoS1uox1PXbNp8a2dEzENp3d5CAL7i63ZLMJgDfE=;
        b=ouZRnhvp200sk7eGPGvKGLsf8vspduaNXWgvCMORq3OgQ4m/FOEwzbr1xuOr+AT/uL
         wkfRLAobQO7LI6VSUl/Rg9Hk15/nrJTL4uOKgwOKsRabEkJ80spTN8ROnNHVADRFD3eF
         pS3CaX2Ruidk6IGWFxSQD8oOvo9d7xZOI+bu/K4UGgxhmYVRpPaSdmoDO9JFtLheCLaB
         d+2xwyYtWsBhBx/E1G4Io7NYbBA6bFNoSS/XONOWn2kthiioU9QR+fSDKquvdkc+0n5c
         oho8r/G3UEJ8+A+LSy2+ag4tuUtCHVU+cm9sZSrsCMvzrNE43KRgoSh2q9U5yU22XjOp
         Wxtw==
X-Gm-Message-State: APjAAAUMxsELcUg2sMAy6ng2iojN4sEyYgpGvpYePEB+T1FDySkTXycb
        H6d5tkOaRQt4YPVh+unoQrzdy04=
X-Google-Smtp-Source: APXvYqwMb70hm3fWXirGCzrqwCzu4GcP6vYWFZa5Tyv1x+cngwflxxpcOVSGp1wCM55OXRAM1LbZUg==
X-Received: by 2002:a05:6830:17db:: with SMTP id p27mr3446871ota.258.1571323059553;
        Thu, 17 Oct 2019 07:37:39 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x140sm560586oix.42.2019.10.17.07.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 07:37:38 -0700 (PDT)
Date:   Thu, 17 Oct 2019 09:37:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Adam Ford <aford173@gmail.com>
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
Subject: Re: [PATCH V5 2/3] dt-bindings: Add Logic PD Type 28 display panel
Message-ID: <20191017143738.GA10960@bogus>
References: <20191016135147.7743-1-aford173@gmail.com>
 <20191016135147.7743-2-aford173@gmail.com>
 <20191016144018.GG5175@pendragon.ideasonboard.com>
 <CAHCN7xJhHHoia_o4rb0VgvCP71X94Pvem684F2quMijNNpNxVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xJhHHoia_o4rb0VgvCP71X94Pvem684F2quMijNNpNxVA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 16, 2019 at 09:55:11AM -0500, Adam Ford wrote:
> On Wed, Oct 16, 2019 at 9:40 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Adam,
> >
> > Thank you for the patch.
> >
> > On Wed, Oct 16, 2019 at 08:51:46AM -0500, Adam Ford wrote:
> > > This patch adds documentation of device tree bindings for the WVGA panel
> > > Logic PD Type 28 display.
> > >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > ---
> > > V5:  Replace GPIO_ACTIVE_HIGH with 0 to fix make dt_binding_check -k
> > > V4:  Update per Rob H's suggestions and copy other panel yaml example from 5.4-rc1
> > > V3:  Correct build errors from 'make dt_binding_check'
> > > V2:  Use YAML instead of TXT for binding
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml b/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml
> > > new file mode 100644
> > > index 000000000000..2834287b8d88
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml
> > > @@ -0,0 +1,42 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/panel/logicpd,type28.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Logic PD Type 28 4.3" WQVGA TFT LCD panel
> > > +
> > > +maintainers:
> > > +  - Adam Ford <aford173@gmail.com>
> > > +
> > > +allOf:
> > > +  - $ref: panel-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: logicpd,type28
> > > +
> > > +  power-supply: true
> > > +  enable-gpios: true
> > > +  backlight: true
> > > +  port: true
> > > +
> > > +required:
> > > +  - compatible
> >
> > Should the port be required too ? Apart from that,
> 
> I supposed that's true, but I used ampire,am-480272h3tmqw-t01h.yaml as
> the example, and it doesn't list it as a required item.
> Is there anything else I need to address?  I feel like I'm trying to
> hit a moving target.

'port' can be omitted because the panel can be a child node of 
the display controller instead. That's decided by the display controller 
binding, not the panel binding.

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
