Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75E634FDC2B
	for <lists+linux-omap@lfdr.de>; Tue, 12 Apr 2022 13:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234044AbiDLKPN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Apr 2022 06:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354423AbiDLKDY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Apr 2022 06:03:24 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B6F69255A0;
        Tue, 12 Apr 2022 02:10:42 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 688D98061;
        Tue, 12 Apr 2022 09:08:09 +0000 (UTC)
Date:   Tue, 12 Apr 2022 12:10:40 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: timer: Update TI timer to yaml
Message-ID: <YlVCEIPFQjFs+kwM@atomide.com>
References: <20220411111858.16814-1-tony@atomide.com>
 <3f3ec103-a7d8-b56d-afff-94a0379dffec@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f3ec103-a7d8-b56d-afff-94a0379dffec@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [220412 08:58]:
> On 11/04/2022 13:18, Tony Lindgren wrote:
> > Some timers on some SoCs are dual mapped, like the ABE timers on omap4
> > and 5. The reg property maxItems must be updated to 2.

So on omap4/5 there are timers with a single IO register and with
dual mapped IO registers.

> (...)
> 
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 2
> > +    description: Timer IO register range
> > +
> 
> Apart from what Grygorii said, it would be useful if you add "if:then:"
> case constraining it per implementation (as I understood from commit msg
> only some use double mapping).
> 
> This looks like:
> https://elixir.bootlin.com/linux/v5.18-rc2/source/Documentation/devicetree/bindings/clock/samsung,exynos7885-clock.yaml#L53

Yes I tried, but see the above. The compatible property is the same for
single mapped and dual mapped timers on the same SoC for omap4/5.

> Similarly should be done for clocks, unless it's impossible (same
> compatible uses different setups of clocks).

It's the same situation for clocks, the same compatible is used for
timers with one clock and timers with two clocks for example on dra7.

I'll check the description again to clarify this, maybe it's not
clear yet.

> BTW, it's a bit confusing it is not a v2...

Oops sorry looks like I forgot to update the version.

Regards,

Tony
