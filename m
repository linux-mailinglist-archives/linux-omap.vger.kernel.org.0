Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C21C0402CE8
	for <lists+linux-omap@lfdr.de>; Tue,  7 Sep 2021 18:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343868AbhIGQg4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Tue, 7 Sep 2021 12:36:56 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:44485 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231378AbhIGQg4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Sep 2021 12:36:56 -0400
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 93BC560009;
        Tue,  7 Sep 2021 16:35:46 +0000 (UTC)
Date:   Tue, 7 Sep 2021 18:35:45 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Roger Quadros <rogerq@kernel.org>, <tony@atomide.com>,
        <robh+dt@kernel.org>, <nm@ti.com>, <lokeshvutla@ti.com>,
        <nsekhar@ti.com>, <krzysztof.kozlowski@canonical.com>,
        <devicetree@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/8] dt-bindings: mtd: ti,gpmc-nand: Convert to yaml
Message-ID: <20210907183545.3e281b7d@xps13>
In-Reply-To: <dc3d465f-50d5-31e5-07e6-f83223b90800@ti.com>
References: <20210907113226.31876-1-rogerq@kernel.org>
        <20210907113226.31876-6-rogerq@kernel.org>
        <20210907160317.2ec5304a@xps13>
        <dc3d465f-50d5-31e5-07e6-f83223b90800@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Grygorii,

> >   
> >> +
> >> +  nand-bus-width:
> >> +    description:
> >> +      Bus width to the NAND chip
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >> +    enum: [8, 16]
> >> +    default: 8  
> > 
> > This is part of nand-controller.yaml binding and should not be there.
> >   
> >> +
> >> +allOf:
> >> +  - $ref: "../memory-controllers/ti,gpmc-child.yaml"  
> > 
> > Maybe you need to reference the nand controller bindings as well
> >   
> 
> This will not work out of the box :( as nand-controller.yaml defines both
>   nand controller and nand memory. It potentially might work if it will be possible to split
> nand memory definition (or nand memory properties) out of and-controller.yaml, similarly to
> ti,gpmc-child.yaml from this series.

What you think would be the issue?

I am not opposed to split nand-controller.yaml into
nand-controller.yaml and nand-chip.yaml if it simplifies the
description of controllers but I don't get why it would be needed. In
particular since we expect all drivers to support the

nand-controller {
	controller-props;
	nand-chip {
		chip-props;
	}
}

organization which has been enforced since at least 2018. Having a
controller vs. chip representation is fundamentally right. But here I
see how "legacy" are these bindings with so much unneeded specific "ti,"
properties... On one side it would be good to verify that the driver
supports this representation (which I believe is true) and on the other
side maybe it's time to advertise "better" bindings as well.


Thanks,
Miquèl
