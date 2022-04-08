Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49A6E4F90EA
	for <lists+linux-omap@lfdr.de>; Fri,  8 Apr 2022 10:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231963AbiDHIft (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Apr 2022 04:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232036AbiDHIfp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Apr 2022 04:35:45 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 20CA12FF537;
        Fri,  8 Apr 2022 01:33:43 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 010AD807E;
        Fri,  8 Apr 2022 08:31:18 +0000 (UTC)
Date:   Fri, 8 Apr 2022 11:33:41 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Nishanth Menon <nm@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] dt-bindings: timer: Update TI timer to yaml and add
 compatible for am6
Message-ID: <Yk/zZW+HKkEEc75C@atomide.com>
References: <20220408081258.57213-1-tony@atomide.com>
 <20220408082757.3cnhvekpty4o4j2k@ladder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220408082757.3cnhvekpty4o4j2k@ladder>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Nishanth Menon <nm@ti.com> [220408 08:25]:
> On 11:12-20220408, Tony Lindgren wrote:
> [...]
> 
> > +  ti,hwmods:
> > +    description:
> > +      Name of the HWMOD associated with timer. This is for legacy
> > +      omap2/3 platforms only.
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    deprecated: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> 
> Should we strengthen the check like in 8250_omap.yaml - something to the
> effect of:
> 
> if:
>   properties:
>     compatible:
>       contains:
>         enum:
>           - ti,omap2420-timer
>           - ti,omap3430-timer
>           - ti,omap4430-timer
> 
> then:
>   properties:
>     ti,hwmods:
>       items:
>         - pattern: "^timer([1-9]+)$"
> 
> else:
>   properties:
>     ti,hwmods: false

Sure, sounds good to me. I need to check again what all SoCs are already
using ti-sysc for all the timers. I believe system timers only got updated
for some SoCs.

Regards,

Tony
