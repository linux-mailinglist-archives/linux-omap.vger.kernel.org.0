Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44661D3A64
	for <lists+linux-omap@lfdr.de>; Fri, 11 Oct 2019 09:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727202AbfJKHxA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Oct 2019 03:53:00 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34314 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbfJKHxA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Oct 2019 03:53:00 -0400
Received: by mail-wr1-f65.google.com with SMTP id j11so10751250wrp.1;
        Fri, 11 Oct 2019 00:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EwPBmMRYQqmwwMpYc8okL9s1LKq8P2O4QBbeYixrVK4=;
        b=qmkuo+/I5tcKNbqICKPzw0l/7zJCIDaKZaulAYOf9ZEbUzrdks5JkVy6rmiQn2cWLY
         /ocsncebfHiZx50AXFtfNs5VCCSoSC5cZvJJ4uMMwPHVziip0zHPmD4d6AgmlsUV3R3z
         Im3wAue2hHzmrR+j9TlSCppd32ip8lYCtQqnueca3untVi5kw72qgDjPdo5U/XGYV+jK
         8Utxp0KN23BbGWjscMsY/bsE62pDXRpZtiWYir9RBIhEB4NllcL5xWc7ek9HOgtzrX5W
         PlGQ1KcXxa+8/wyOAQYDtSSyOKaogPm7lHFxIkmLPoBNxb8KS4FLZgHE01hz16cA7km5
         aRDA==
X-Gm-Message-State: APjAAAXRi957Q64y22Rz6xuhwY4gOgixODOLlZxHCZrHOinhQztQ02Mt
        dEMeoIMGXtq6XGXvGzfE8sU=
X-Google-Smtp-Source: APXvYqxUy16ah5vufdoPXO9FppUIVRbpWBWt1wAegLgSI9eN5KbSUDFilIoDI6Bb75H+vXTIy2Z4Rg==
X-Received: by 2002:a5d:6949:: with SMTP id r9mr8819898wrw.106.1570780376664;
        Fri, 11 Oct 2019 00:52:56 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id b22sm7040031wmj.36.2019.10.11.00.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 00:52:55 -0700 (PDT)
Date:   Fri, 11 Oct 2019 09:52:53 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 02/10] dt-bindings: sram: Convert Samsung Exynos
 SYSRAM bindings to json-schema
Message-ID: <20191011075253.GA7998@pi3>
References: <20191002164316.14905-1-krzk@kernel.org>
 <20191002164316.14905-2-krzk@kernel.org>
 <20191010193356.GA9975@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191010193356.GA9975@bogus>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Oct 10, 2019 at 02:33:56PM -0500, Rob Herring wrote:
> On Wed, Oct 02, 2019 at 06:43:08PM +0200, Krzysztof Kozlowski wrote:
> > Convert Samsung Exynos SYSRAM bindings to DT schema format using
> > json-schema.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > ---
> > 
> > Changes since v2:
> > 1. Use sram as name of node in example.
> > 
> > Changes since v1:
> > 1. Indent example with four spaces (more readable).
> > ---
> >  .../devicetree/bindings/sram/samsung-sram.txt | 38 ------------
> >  .../bindings/sram/samsung-sram.yaml           | 58 +++++++++++++++++++
> >  MAINTAINERS                                   |  2 +-
> >  3 files changed, 59 insertions(+), 39 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/sram/samsung-sram.txt
> >  create mode 100644 Documentation/devicetree/bindings/sram/samsung-sram.yaml
> 
> 
> > diff --git a/Documentation/devicetree/bindings/sram/samsung-sram.yaml b/Documentation/devicetree/bindings/sram/samsung-sram.yaml
> > new file mode 100644
> > index 000000000000..3e77c434ecca
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sram/samsung-sram.yaml
> > @@ -0,0 +1,58 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sram/samsung-sram.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Samsung Exynos SoC SYSRAM for SMP bringup
> > +
> > +maintainers:
> > +  - Krzysztof Kozlowski <krzk@kernel.org>
> > +
> > +description: |+
> > +  Samsung SMP-capable Exynos SoCs use part of the SYSRAM for the bringup
> > +  of the secondary cores. Once the core gets powered up it executes the
> > +  code that is residing at some specific location of the SYSRAM.
> > +
> > +  Therefore reserved section sub-nodes have to be added to the mmio-sram
> > +  declaration. These nodes are of two types depending upon secure or
> > +  non-secure execution environment.
> > +
> > +allOf:
> > +  - $ref: "sram.yaml#"
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^sysram(@.*)?"
> 
> As you are renaming all the node names, this will no longer work. If you 
> change it to 'sram', that's going to match others, but would still work 
> as long as the child node names are unique to Samsung. If you change 
> them to '*-sram' then, you'd have to come up with something else. That 
> probably means using 'compatible' strings. At that point, it's kind of 
> silly to just be validating what your are using to select the schema. It 
> may be better to just add the compatible strings into sram.yaml if 
> that's the only difference.

You're right. I'll move them to sram.yaml and maybe add also example.


Best regards,
Krzysztof

