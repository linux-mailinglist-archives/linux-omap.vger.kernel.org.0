Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 546E8D8434
	for <lists+linux-omap@lfdr.de>; Wed, 16 Oct 2019 01:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbfJOXEg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Oct 2019 19:04:36 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:39610 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbfJOXEg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Oct 2019 19:04:36 -0400
Received: by mail-io1-f68.google.com with SMTP id a1so50588081ioc.6;
        Tue, 15 Oct 2019 16:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OMEog+wPJDcpfHAz1VlWbAAsJEgb+2P3a4y6+6INojk=;
        b=GBy7Tojzyuh3LBnx3XMAb8N6tVMOpYI3ENvomU1LDqz4tw5pB4anuTXNH95ihqU9tO
         8EbpEbxrj1/zP989X6Xmw+0rjv+B1Smrw+u1B+mm1MTe3espVYjx3pDz7kQ9/BFRlA7K
         IBNGnKVqhHwj2NTytrFxF/xCUyPgmfJ8yI1KU1O0iuowbOc/v12drXde6Fy4TQ4O1pKB
         zm9fqzXYetxvtaGrNbGceSq6ghpGZWt6U7r/aKjDEHDmAyx8ZNhyWfLb5cal+mU5+8cm
         vPZlJcN17b3FQAWkmlizaW+injhx64njtwFbW7IjLPofaQoIon3jtlzE3n1PQniMuJ65
         GKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OMEog+wPJDcpfHAz1VlWbAAsJEgb+2P3a4y6+6INojk=;
        b=gB1c8aY4YGROge38CM2QwQUx4+EYHN4gT+Q9wlJ1bHqOnu3KvYZOyx3wv6G7cwR68C
         c0IFZwcTk6Pm9RRTlfah+ZWmzbP9MY9asr3utyes/bYcC6VfXi1AZ4haXiNE9tIyt4sc
         S1gNwKZ7AJU+IteaK/ekKztqrJhpz87Sa0REFdXO7ovFvtSjpgzDp9duslXNn3Wc7DBf
         LeCNnFRpr/chPfV2mM5OHRwN5s1rhQNFPIarT22lUtQqNZv5jXwe+sbgd/cDGz3cnGw6
         uf5QbhfdOoPfAN0ncwlEWJLhhViWRrD6SG7wAMnSBomSm1T7SqfEo5CyO6TKJ+awCMXd
         pyTQ==
X-Gm-Message-State: APjAAAVvbij0x/6PgPcYpNHxcr0OJBliaztF7QqOaqdK3shTPf6Dc83Q
        dm4mMvcCblFUtTbYhTwAQ6Xtr+FA3r1GI5K9x1k=
X-Google-Smtp-Source: APXvYqyAkKfWw91fNt9acZ0ggGpKVfsdElaKZqDrMgeJhsX3kIbaPP6Oz/3n0UI7fRmVIdKLKMyr1yzMfCv4UK97Hrg=
X-Received: by 2002:a02:7741:: with SMTP id g62mr5970832jac.3.1571180673056;
 Tue, 15 Oct 2019 16:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191001233923.16514-1-aford173@gmail.com> <20191001233923.16514-5-aford173@gmail.com>
 <20191009233130.GA1002@bogus>
In-Reply-To: <20191009233130.GA1002@bogus>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 15 Oct 2019 18:04:21 -0500
Message-ID: <CAHCN7xLCvN1v00H10KUX625awz+nea6rhA_LYnftspjaZ+od-g@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] dt-bindings: Add Logic PD Type 28 display panel
To:     Rob Herring <robh@kernel.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 9, 2019 at 6:31 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Oct 01, 2019 at 06:39:22PM -0500, Adam Ford wrote:
> > This patch adds documentation of device tree bindings for the WVGA panel
> > Logic PD Type 28 display.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > ---
> > V4:  Update per Rob H's suggestions and copy other panel yaml example from 5.4-rc1
> > V3:  Correct build errors from 'make dt_binding_check'
>
> The example still fails to build here.

I cannot replicate the build error on 5.4-RC3 at least for this
binding on V4 of the patch.  I get build error on other bindings.

$ make dt_binding_check ARCH=arm
scripts/kconfig/conf  --syncconfig Kconfig
  SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
/home/aford/src/linux/Documentation/devicetree/bindings/net/adi,adin.yaml:
ignoring, error in schema 'adi,rx-internal-delay-ps'
warning: no schema found in file:
Documentation/devicetree/bindings/net/adi,adin.yaml
/home/aford/src/linux/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml:
ignoring, error in schema '0'
warning: no schema found in file:
Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
  CHKDT   Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
  ....
  CHKDT   Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml
  CHKDT   Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
  CHKDT   Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml
  CHKDT   Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
 ...
 CHKDT   Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
  CHKDT   Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml:
$id: path/filename 'arm/allwinner,sun4i-a10-csi.yaml' doesn't match
actual filename
Documentation/devicetree/bindings/Makefile:12: recipe for target
'Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts'
failed
make[1]: *** [Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts]
Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2


I took out some of the logs to make it less chatty.  I don't know
anything about yaml or what the expectations are, so if there is a
test beyond 'make dt_binding_check' please let me know.

Thank you,

adam

>
> > V2:  Use YAML instead of TXT for binding
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml b/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml
> > new file mode 100644
> > index 000000000000..e2c62e8f1db4
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
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    lcd0: display {
> > +      compatible = "logicpd,type28";
> > +      enable-gpios = <&gpio5 27 GPIO_ACTIVE_HIGH>;
> > +      backlight = <&backlight>;
> > +      port {
> > +        lcd_in: endpoint {
> > +          remote-endpoint = <&dpi_out>;
> > +        };
> > +      };
> > +    };
> > +
> > +...
> > --
> > 2.17.1
> >
