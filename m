Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F36942DEBC6
	for <lists+linux-omap@lfdr.de>; Fri, 18 Dec 2020 23:53:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgLRWvw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Dec 2020 17:51:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:51490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725813AbgLRWvw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 18 Dec 2020 17:51:52 -0500
X-Gm-Message-State: AOAM531JHImXIwhRvS09h2Bn0S5t3870qku8Eqo7Hf5nj36ZyjPqv/SW
        5SiLfx24H+AlKPBIl8ICUNxOk/grfuvL+5AtfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608331871;
        bh=ZtuDx1g50X2Qj4JjjYFGFSI9wY4HuxKzUzlaD0sdeXc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vEOb/5mlu+GHcROfnlhzYbcIyFc3LRN/ip77eMCj1AYhWCqAmE95QZarZE9mpHqOw
         jGsZOpvx34sIpz3dxeoDm7KXP1LAjRVCfXU84et96ZrT/IoENkLcCFEGm4EdA8uUEx
         Z2csh5JehlGunr1yXsV6lt2bFV+pCo6UmlBAAd3uiNPwxgDwodemHLgRCepf7KZYO3
         7b8xRx8XNQO99l18SrBBMRhVuZNvX9yBJXYW10Atct9HTlQiw4BciSpl5FWcheM/2L
         VpakrWB4wWnvHX4OHcIwOdIBgGuXWY6JaryZJ0f4QV/WugpXmVnPlMtg998zW2wm99
         pMJmFIr0lzLbw==
X-Google-Smtp-Source: ABdhPJxNw/q/XvK7O7ILckQoP3A6uzGGD5xqlFlKtSvsxtUERlGMDiuIoFMxqKvxn6xCWNFl/+pKuZyD1KZkDAc+IKc=
X-Received: by 2002:a05:6402:ca2:: with SMTP id cn2mr6571892edb.137.1608331869822;
 Fri, 18 Dec 2020 14:51:09 -0800 (PST)
MIME-Version: 1.0
References: <20201211142933.25784-1-grzegorz.jaszczyk@linaro.org>
 <20201211142933.25784-2-grzegorz.jaszczyk@linaro.org> <20201214225842.GA2537432@robh.at.kernel.org>
 <CAMxfBF65ve2Pk5Uz5V1V_LfOLFUFKebVE8bzSjLT0nonuH8TDg@mail.gmail.com>
In-Reply-To: <CAMxfBF65ve2Pk5Uz5V1V_LfOLFUFKebVE8bzSjLT0nonuH8TDg@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 18 Dec 2020 16:50:58 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKpzZvdWJodzbqQBLZ-v98n3KaoTaYM-0iQ-_71hCbW8Q@mail.gmail.com>
Message-ID: <CAL_JsqKpzZvdWJodzbqQBLZ-v98n3KaoTaYM-0iQ-_71hCbW8Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: remoteproc: Add PRU consumer bindings
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     Ohad Ben Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Anna, Suman" <s-anna@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Dec 16, 2020 at 9:55 AM Grzegorz Jaszczyk
<grzegorz.jaszczyk@linaro.org> wrote:
>
> Hi Rob,
>
> On Mon, 14 Dec 2020 at 23:58, Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Dec 11, 2020 at 03:29:29PM +0100, Grzegorz Jaszczyk wrote:
> > > From: Suman Anna <s-anna@ti.com>
> > >
> > > Add a YAML binding document for PRU consumers. The binding includes
> > > all the common properties that can be used by different PRU consumer
> > > or application nodes and supported by the PRU remoteproc driver.
> > > These are used to configure the PRU hardware for specific user
> > > applications.
> > >
> > > The application nodes themselves should define their own bindings.
> > >
> > > Co-developed-by: Tero Kristo <t-kristo@ti.com>
> > > Signed-off-by: Tero Kristo <t-kristo@ti.com>
> > > Signed-off-by: Suman Anna <s-anna@ti.com>
> > > Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > > Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > > ---
> > >  .../bindings/remoteproc/ti,pru-consumer.yaml  | 64 +++++++++++++++++++
> > >  1 file changed, 64 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> > > new file mode 100644
> > > index 000000000000..2c5c5e2b6159
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> > > @@ -0,0 +1,64 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/remoteproc/ti,pru-consumer.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Common TI PRU Consumer Binding
> > > +
> > > +maintainers:
> > > +  - Suman Anna <s-anna@ti.com>
> > > +
> > > +description: |
> > > +  A PRU application/consumer/user node typically uses one or more PRU device
> > > +  nodes to implement a PRU application/functionality. Each application/client
> > > +  node would need a reference to at least a PRU node, and optionally define
> > > +  some properties needed for hardware/firmware configuration. The below
> > > +  properties are a list of common properties supported by the PRU remoteproc
> > > +  infrastructure.
> > > +
> > > +  The application nodes shall define their own bindings like regular platform
> > > +  devices, so below are in addition to each node's bindings.
> > > +
> > > +properties:
> > > +  prus:
> >
> > ti,prus
>
> Thank you - I will change and post v2 but with this I will run into
> issues when this binding will be referenced by some consumer YAML
> binding. Running dtbs_check in such case throws:
> ... k3-am654-base-board.dt.yaml: serial@28000: 'ti,prus' does not
> match any of the regexes: 'pinctrl-[0-9]+'
> In the same time if I will remove this property from that node I am getting:
> ... k3-am654-base-board.dt.yaml: serial@28000: 'ti,prus' is a required property
> as expected.

Sounds like you didn't update 'ti,prus' in whatever schema you include
this one from.

>
> Getting rid of the comma from this property name workarounds mentioned
> problem (which is not proper but allows me to correctly test this
> binding): e.g. s/ti,prus/ti-pruss/ or using the previous name without
> a comma.
> It seems to be an issue with dtbs_check itself which we will encounter
> in the future.

If not, can you point me to a branch having this problem.

Rob
