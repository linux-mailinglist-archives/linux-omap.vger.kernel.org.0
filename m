Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98EAA4F90C5
	for <lists+linux-omap@lfdr.de>; Fri,  8 Apr 2022 10:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbiDHIbg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Apr 2022 04:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231731AbiDHIbf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Apr 2022 04:31:35 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1C2FE2FDC80;
        Fri,  8 Apr 2022 01:29:32 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 045AD807E;
        Fri,  8 Apr 2022 08:27:07 +0000 (UTC)
Date:   Fri, 8 Apr 2022 11:29:30 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] ARM: dts: Drop unused ti,am4372-timer compatible
Message-ID: <Yk/yaqWHSpaO2eRe@atomide.com>
References: <20220408081216.57146-1-tony@atomide.com>
 <3a4b5e26-e770-d778-5ae5-f46ba00066ce@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a4b5e26-e770-d778-5ae5-f46ba00066ce@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [220408 08:22]:
> On 08/04/2022 10:12, Tony Lindgren wrote:
> > Drop unused (and undocumented) ti,am4372-timer related compatible
> > properties to avoid dtb warnings when updating the binding to yaml.
> > 
> > The dual-mode timer instances on am43 are compatible with the am3
> > timers.
> 
> Are you sure this is correct approach? Maybe some other user of DTS
> references the am43 compatible, so instead it should be documented in
> the bindings?

No users. The driver does not parse these. The am4 SoCs boot using
the am3 related compatible properties.

> See also recommendation "DO use fallback compatibles...":
> Documentation/devicetree/bindings/writing-bindings.rst
> which maybe applies here?

Yes I'd agree if there were users for this, or if this was already
documented :) But I don't see a need to keep these am4 specific
properties.

Regards,

Tony
