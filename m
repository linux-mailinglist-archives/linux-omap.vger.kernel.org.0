Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4D22E81C1
	for <lists+linux-omap@lfdr.de>; Thu, 31 Dec 2020 20:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgLaTPn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Dec 2020 14:15:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:38266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726210AbgLaTPn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 31 Dec 2020 14:15:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6212F2078D;
        Thu, 31 Dec 2020 19:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609442101;
        bh=9zoM/7G7js3JqYInb1BS1ScayBgVQxVJWIjM4J6DmSY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TGxZU6X2YVV9phxSKoDhqVgV3tv5+qOEsz2nZ9qC3zexMqGLPYpd/f2zQV3wH8Om1
         6exJL9Qqb+UWerLTEhI1jJNo5e6P/D27sjyFcUeU7Vi6B1NTBFYkikNqp0kWbziYv3
         V7QYD3pWltIFJRkrcbdrTQWfu9jhplZRnpMXDcw8s4WMB5YBuok943wV6lxLebqXef
         0w8aO7xcFwi0DG643ijYdmhUDmZSIsnz1bnIUK92ivX0p1+idjRVqY6QsNtORNjl7X
         oaEw9GA11i34/CiTSrdAB2wh0utMMB0sfXbB6nWxLJvYkcF8Ihzr+hbqoCdTGdXTDv
         taUDsO8v+pk+g==
Received: by mail-ej1-f44.google.com with SMTP id n26so26279347eju.6;
        Thu, 31 Dec 2020 11:15:01 -0800 (PST)
X-Gm-Message-State: AOAM530vyWTVSrUZUEV34UOAsrmdJ1nkdTPP+VdIdjKZVunbaMRXI5bO
        dNwbZGClj9xVYzFdtqWpOfQhT2BD9smNBUEbAA==
X-Google-Smtp-Source: ABdhPJyQ7WBlxre6XJVdjyLF/2wFIDim27bM3bkbje9oeTHcsPkTbkMzDGQfDN+T5fVAZVB+GL+3CAskssn7ou4WjLM=
X-Received: by 2002:a17:906:d784:: with SMTP id pj4mr52904735ejb.360.1609442099991;
 Thu, 31 Dec 2020 11:14:59 -0800 (PST)
MIME-Version: 1.0
References: <20201211142933.25784-1-grzegorz.jaszczyk@linaro.org>
 <20201211142933.25784-2-grzegorz.jaszczyk@linaro.org> <20201214225842.GA2537432@robh.at.kernel.org>
 <CAMxfBF65ve2Pk5Uz5V1V_LfOLFUFKebVE8bzSjLT0nonuH8TDg@mail.gmail.com>
 <CAL_JsqKpzZvdWJodzbqQBLZ-v98n3KaoTaYM-0iQ-_71hCbW8Q@mail.gmail.com> <CAMxfBF5q2hjiYANZNtxz-PD=pR73EpXBpnWuB4dqXD1a=f2=gg@mail.gmail.com>
In-Reply-To: <CAMxfBF5q2hjiYANZNtxz-PD=pR73EpXBpnWuB4dqXD1a=f2=gg@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 31 Dec 2020 12:14:48 -0700
X-Gmail-Original-Message-ID: <CAL_Jsq+W8GuqKdqSxt7bKcfpK3Wg35V9R-3+UzNi_+3uRqA=AQ@mail.gmail.com>
Message-ID: <CAL_Jsq+W8GuqKdqSxt7bKcfpK3Wg35V9R-3+UzNi_+3uRqA=AQ@mail.gmail.com>
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

On Tue, Dec 22, 2020 at 8:57 AM Grzegorz Jaszczyk
<grzegorz.jaszczyk@linaro.org> wrote:
>
> Hi Rob,
>
> On Fri, 18 Dec 2020 at 23:51, Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Dec 16, 2020 at 9:55 AM Grzegorz Jaszczyk
> > <grzegorz.jaszczyk@linaro.org> wrote:
> > >
> > > Hi Rob,
> > >
> > > On Mon, 14 Dec 2020 at 23:58, Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Fri, Dec 11, 2020 at 03:29:29PM +0100, Grzegorz Jaszczyk wrote:
> > > > > From: Suman Anna <s-anna@ti.com>
> > > > >
> > > > > Add a YAML binding document for PRU consumers. The binding includes
> > > > > all the common properties that can be used by different PRU consumer
> > > > > or application nodes and supported by the PRU remoteproc driver.
> > > > > These are used to configure the PRU hardware for specific user
> > > > > applications.
> > > > >
> > > > > The application nodes themselves should define their own bindings.
> > > > >
> > > > > Co-developed-by: Tero Kristo <t-kristo@ti.com>
> > > > > Signed-off-by: Tero Kristo <t-kristo@ti.com>
> > > > > Signed-off-by: Suman Anna <s-anna@ti.com>
> > > > > Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > > > > Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > > > > ---
> > > > >  .../bindings/remoteproc/ti,pru-consumer.yaml  | 64 +++++++++++++++++++
> > > > >  1 file changed, 64 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..2c5c5e2b6159
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> > > > > @@ -0,0 +1,64 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/remoteproc/ti,pru-consumer.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Common TI PRU Consumer Binding
> > > > > +
> > > > > +maintainers:
> > > > > +  - Suman Anna <s-anna@ti.com>
> > > > > +
> > > > > +description: |
> > > > > +  A PRU application/consumer/user node typically uses one or more PRU device
> > > > > +  nodes to implement a PRU application/functionality. Each application/client
> > > > > +  node would need a reference to at least a PRU node, and optionally define
> > > > > +  some properties needed for hardware/firmware configuration. The below
> > > > > +  properties are a list of common properties supported by the PRU remoteproc
> > > > > +  infrastructure.
> > > > > +
> > > > > +  The application nodes shall define their own bindings like regular platform
> > > > > +  devices, so below are in addition to each node's bindings.
> > > > > +
> > > > > +properties:
> > > > > +  prus:
> > > >
> > > > ti,prus
> > >
> > > Thank you - I will change and post v2 but with this I will run into
> > > issues when this binding will be referenced by some consumer YAML
> > > binding. Running dtbs_check in such case throws:
> > > ... k3-am654-base-board.dt.yaml: serial@28000: 'ti,prus' does not
> > > match any of the regexes: 'pinctrl-[0-9]+'
> > > In the same time if I will remove this property from that node I am getting:
> > > ... k3-am654-base-board.dt.yaml: serial@28000: 'ti,prus' is a required property
> > > as expected.
> >
> > Sounds like you didn't update 'ti,prus' in whatever schema you include
> > this one from.
> >
> > >
> > > Getting rid of the comma from this property name workarounds mentioned
> > > problem (which is not proper but allows me to correctly test this
> > > binding): e.g. s/ti,prus/ti-pruss/ or using the previous name without
> > > a comma.
> > > It seems to be an issue with dtbs_check itself which we will encounter
> > > in the future.
> >
> > If not, can you point me to a branch having this problem.
>
> Sure, here is temporary branch with 4 last commits demonstrating
> mentioned issues (when property name contains comma):
> https://git.linaro.org/people/grzegorz.jaszczyk/linux.git/log/?h=ti-pruss-binding-issue
>
> The last commit gets rid of the comma from properties names which
> successfully w/a the problem.
>
> Please note that those are only TEMP commits which demonstrates the
> mentioned issue. I've put error logs with some notes in commit log to
> ease understanding what issues are seen when.

The problem is any property with a vendor prefix has to define a type.
There's not a way to define a 'common vendor property' and distinguish
both cases in the meta-schemas. I'd like to come up with a more robust
mechanism where we just detect if a property has a defined type or
not. It should be possible to extract that. (Related, I also want to
check for conflicting types.)

How many cases of 'ti,prus' do you expect to have and what's the range
of number of phandles? Either you should just not have the common
schema and just define the properties in each consumer or don't put
additional constraints into the consumer schemas (i.e omit the
properties in 'properties' and use 'unevaluatedProperties').

Also, I think you can get rid of 'ti,pruss-gp-mux-sel'. Can't it just
be an arg cell in 'ti,prus' entries?

Rob
