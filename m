Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 785C32DC390
	for <lists+linux-omap@lfdr.de>; Wed, 16 Dec 2020 16:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgLPP4T (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Dec 2020 10:56:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbgLPP4T (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Dec 2020 10:56:19 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC40CC0617A6
        for <linux-omap@vger.kernel.org>; Wed, 16 Dec 2020 07:55:38 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id b64so18904788qkc.12
        for <linux-omap@vger.kernel.org>; Wed, 16 Dec 2020 07:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7Lrr0F4DYTiqu5q7pa2WeMJbEO+sTjt6K5vXhRq26Lw=;
        b=ssigaWNbMLRE6xPkXPODGln3bD/p0Ti2op/Z+RZ8zwhLxxQcY1yRTnZljKZqHAjEkm
         QOmCRdEa0jq6enFzV+KSakNFQ+1VnSoPJT77gjhWOJzYRyKpY8yJR0Cepk2awciumUye
         lLL3NRZPQTTiGJxNaV2dyvgXPStX0xFYvSmrqkbOwRP26cAIhqeG0OQ79ryX//b2F0Ar
         i4hdIKBoIrXGW6znwbGLMQ2BywBQfsft/uFntTs+i/5/Sm6kF9HibOtzOS13QSShBcIG
         YuOOUdoBGXK8VP7DhrKJIK6vg9jWDxh5vzzT7VVXxDz6oxF7yQR/9h7BEkVHitJs46dq
         uuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Lrr0F4DYTiqu5q7pa2WeMJbEO+sTjt6K5vXhRq26Lw=;
        b=p8wtldEv+cpdWt7NdZplcqBbasMNSrnXTxAoCvbFtKJiWsaB/KrWEPg62IwKg1Sglm
         fWL1qU2vNa0KzWD9tCzJU8bTxjvP1P1GMtHIWo/n4TL06BXPkHXLxySzj13CwDel5tj8
         K25tYBVu+gVv4i/jqGDCicbpD0k4sTtIoDq5mTzvg7Jb6HvUHarD3RYSKGPJAwRQM/Dq
         5ia3sDLQTh2k9r7/m5vZVG1UvTGNQdzY6dy8LpXWHwKmWf0Si2ZEJHxiwTTTzI2eHPWs
         G/EsbJRyzaQE2y4ySvLfsJsyytfb4ZVLKVxJ89E20TALqfpayrJKeoibhdORlqahHK87
         ABkA==
X-Gm-Message-State: AOAM532FRvOcRpj/bUGgYtGBLR0iSAYYKgYM8/tgQveKtD9ImFzm0LwO
        0JCKh4GEKVWPccQIjCy4DnLzDGRMKBbJnkT2Fq4SzQ==
X-Google-Smtp-Source: ABdhPJz8IdFwoMCUGVhbIBauOoQfDl7hiHRrTFY6xSHTSAEoIDWiwK5tREXU/yHC+b+0r0lBo/fmh4QuarzKRUZLY7A=
X-Received: by 2002:a37:7487:: with SMTP id p129mr43538264qkc.306.1608134137648;
 Wed, 16 Dec 2020 07:55:37 -0800 (PST)
MIME-Version: 1.0
References: <20201211142933.25784-1-grzegorz.jaszczyk@linaro.org>
 <20201211142933.25784-2-grzegorz.jaszczyk@linaro.org> <20201214225842.GA2537432@robh.at.kernel.org>
In-Reply-To: <20201214225842.GA2537432@robh.at.kernel.org>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Wed, 16 Dec 2020 16:55:26 +0100
Message-ID: <CAMxfBF65ve2Pk5Uz5V1V_LfOLFUFKebVE8bzSjLT0nonuH8TDg@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: remoteproc: Add PRU consumer bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Ohad Ben Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Anna, Suman" <s-anna@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-remoteproc@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Rob,

On Mon, 14 Dec 2020 at 23:58, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Dec 11, 2020 at 03:29:29PM +0100, Grzegorz Jaszczyk wrote:
> > From: Suman Anna <s-anna@ti.com>
> >
> > Add a YAML binding document for PRU consumers. The binding includes
> > all the common properties that can be used by different PRU consumer
> > or application nodes and supported by the PRU remoteproc driver.
> > These are used to configure the PRU hardware for specific user
> > applications.
> >
> > The application nodes themselves should define their own bindings.
> >
> > Co-developed-by: Tero Kristo <t-kristo@ti.com>
> > Signed-off-by: Tero Kristo <t-kristo@ti.com>
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > ---
> >  .../bindings/remoteproc/ti,pru-consumer.yaml  | 64 +++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> > new file mode 100644
> > index 000000000000..2c5c5e2b6159
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> > @@ -0,0 +1,64 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/remoteproc/ti,pru-consumer.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Common TI PRU Consumer Binding
> > +
> > +maintainers:
> > +  - Suman Anna <s-anna@ti.com>
> > +
> > +description: |
> > +  A PRU application/consumer/user node typically uses one or more PRU device
> > +  nodes to implement a PRU application/functionality. Each application/client
> > +  node would need a reference to at least a PRU node, and optionally define
> > +  some properties needed for hardware/firmware configuration. The below
> > +  properties are a list of common properties supported by the PRU remoteproc
> > +  infrastructure.
> > +
> > +  The application nodes shall define their own bindings like regular platform
> > +  devices, so below are in addition to each node's bindings.
> > +
> > +properties:
> > +  prus:
>
> ti,prus

Thank you - I will change and post v2 but with this I will run into
issues when this binding will be referenced by some consumer YAML
binding. Running dtbs_check in such case throws:
... k3-am654-base-board.dt.yaml: serial@28000: 'ti,prus' does not
match any of the regexes: 'pinctrl-[0-9]+'
In the same time if I will remove this property from that node I am getting:
... k3-am654-base-board.dt.yaml: serial@28000: 'ti,prus' is a required property
as expected.

Getting rid of the comma from this property name workarounds mentioned
problem (which is not proper but allows me to correctly test this
binding): e.g. s/ti,prus/ti-pruss/ or using the previous name without
a comma.
It seems to be an issue with dtbs_check itself which we will encounter
in the future.

Best regards,
Grzegorz

>
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description: phandles to the PRU, RTU or Tx_PRU nodes used
> > +
> > +  firmware-name:
> > +    $ref: /schemas/types.yaml#/definitions/string-array
> > +    description: |
> > +      firmwares for the PRU cores, the default firmware for the core from
> > +      the PRU node will be used if not provided. The firmware names should
> > +      correspond to the PRU cores listed in the 'prus' property
> > +
> > +  ti,pruss-gp-mux-sel:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    enum: [0, 1, 2, 3, 4]
> > +    description: |
> > +      array of values for the GP_MUX_SEL under PRUSS_GPCFG register for a PRU.
> > +      This selects the internal muxing scheme for the PRU instance. Values
> > +      should correspond to the PRU cores listed in the 'prus' property. The
> > +      GP_MUX_SEL setting is a per-slice setting (one setting for PRU0, RTU0,
> > +      and Tx_PRU0 on K3 SoCs). Use the same value for all cores within the
> > +      same slice in the associative array. If the array size is smaller than
> > +      the size of 'prus' property, the default out-of-reset value (0) for the
> > +      PRU core is used.
> > +
> > +required:
> > +  - prus
> > +
> > +dependencies:
> > +  firmware-name: [ prus ]
> > +  ti,pruss-gp-mux-sel: [ prus ]
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    /* PRU application node example */
> > +    pru-app {
> > +        prus = <&pru0>, <&pru1>;
> > +        firmware-name = "pruss-app-fw0", "pruss-app-fw1";
> > +        ti,pruss-gp-mux-sel = <2>, <1>;
> > +    };
> > --
> > 2.29.0
> >
