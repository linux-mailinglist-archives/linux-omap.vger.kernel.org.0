Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14B713030D3
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 01:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732014AbhAZAHZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 Jan 2021 19:07:25 -0500
Received: from mail-oi1-f175.google.com ([209.85.167.175]:33898 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732186AbhAZAF0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Jan 2021 19:05:26 -0500
Received: by mail-oi1-f175.google.com with SMTP id h192so16788019oib.1;
        Mon, 25 Jan 2021 16:05:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5FTRQMQR2ih35r3X59niVzE0TzLmbbqDggAUfz/28Wg=;
        b=sp6ZAoTDBNoGmEeC2KtVdItQarMIelaetUTgjQ82b/BUjC5Y2jhlpPcAs96G+6K+hC
         KfVn5ZLSdRix8K1laR/VQCwYvYzdbB1u2alwkjU4hELAV3ln8KRvDiBkqY6X00Lkrcdf
         z5hph3IY9GCrJbJSBQr8soBBUO/5Ifvwhqp5/khum+DA97OLGi5fb2IHQ8kjIb/WpEHB
         O4LFC9heoK39BqapAicBaSe2LnKt1phdNXW/Z6/75yrPOvwN6baKkSOyzSNoSeHsfnWh
         Vp+YZn587xkHL4EtsGCLAXcnGWOuWpbPDLTl7GVKyQjnM/eBGUyESkP9uTzrd4ByyGfe
         LawA==
X-Gm-Message-State: AOAM533Hzqkik3BK01OjxquPkmNhPu7XlfqtYddNNAOuO5vcp+iGvu8I
        hgqWW4HWOQxpx8zPpO8cOg==
X-Google-Smtp-Source: ABdhPJwPgy6Zz8wcdpbFSAg+p6w1ktKW/dTzzjT0M0bJrrHC9Mb1T96ctJ6h2nxHB0K1dup7VArzPQ==
X-Received: by 2002:aca:d5cf:: with SMTP id m198mr1592801oig.99.1611619485613;
        Mon, 25 Jan 2021 16:04:45 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s8sm2359022ood.39.2021.01.25.16.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 16:04:44 -0800 (PST)
Received: (nullmailer pid 1310160 invoked by uid 1000);
        Tue, 26 Jan 2021 00:04:43 -0000
Date:   Mon, 25 Jan 2021 18:04:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nishanth Menon <nm@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Lechner <david@lechnology.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Subject: Re: [PATCH] dt-bindings: irqchip: Add #address-cells to PRUSS INTC
Message-ID: <20210126000443.GA1223706@robh.at.kernel.org>
References: <20210115205819.19426-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115205819.19426-1-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jan 15, 2021 at 02:58:19PM -0600, Suman Anna wrote:
> The '#address-cells' property looks to be a required property for
> interrupt controller nodes as indicated by a warning message seen
> when building dtbs with W=2. Adding the property to the PRUSS INTC
> dts nodes though fails the dtbs_check. Add this property to the
> PRUSS INTC binding to make it compliant with both dtbs_check and
> building dtbs.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> Hi Rob,
> 
> This patch is also part of our effort to get rid of the warnings seen
> around interrupt providers on TI K3 dtbs [1]. I needed this in the PRUSS
> INTC bindings to not get a warning with dtbs_check while also ensuring
> no warnings while building dtbs with W=2.
> 
> I would have expected the '#address-cells' requirement to be inherited
> automatically. And looking through the schema files, I actually do not
> see the interrupt-controller.yaml included automatically anywhere. You
> had asked us to drop the inclusion in this binding in our first version
> with YAML [3]. Am I missing something, and how do we ensure that this
> is enforced automatically for everyone?

interrupt-controller.yaml is applied to any node named 
'interrupt-controller'. More generally, if 'compatible' is not present, 
then we look at $nodename for the default 'select'. In your case, you 
didn't name the node appropriately.
 
We can't check this in interrupt-controller.yaml because #address-cells 
is not always 0. GICv3 is one notable exception.

> 
> regards
> Suman
> 
> [1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210115083003.27387-1-lokeshvutla@ti.com/

I've commented on this thread now in regards to #address-cells.

Rob

> [2] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20210114194805.8231-1-s-anna@ti.com/
> [3] https://patchwork.kernel.org/comment/23484523/
> 
>  .../bindings/interrupt-controller/ti,pruss-intc.yaml        | 6 ++++++
>  1 file changed, 6 insertions(+)
