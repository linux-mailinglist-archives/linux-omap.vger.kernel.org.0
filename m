Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B21E4FDC2A
	for <lists+linux-omap@lfdr.de>; Tue, 12 Apr 2022 13:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233550AbiDLKPI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Apr 2022 06:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352300AbiDLJmd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Apr 2022 05:42:33 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B29AE13DFD;
        Tue, 12 Apr 2022 01:51:40 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 00B628061;
        Tue, 12 Apr 2022 08:49:06 +0000 (UTC)
Date:   Tue, 12 Apr 2022 11:51:38 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: timer: Update TI timer to yaml
Message-ID: <YlU9mtM23bllohK3@atomide.com>
References: <20220411111858.16814-1-tony@atomide.com>
 <173629f2-b37e-75ad-7601-4f24b8561f8a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173629f2-b37e-75ad-7601-4f24b8561f8a@ti.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [220412 08:35]:
> On 11/04/2022 14:18, Tony Lindgren wrote:
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 2
> > +    description: Timer IO register range
> 
> if i'm not mistaken - you need to provide description for every item unless it's obviously determined by "-names" properties

OK thanks will update for reg and clocks.

> > +  clock-names:
> > +    description:
> > +      Timer clock names like "fck", "timer_sys_ck".
> 
> and description here make no sense

So you just want to leave out the description from the clock-names if
I read your comment above right?

Regards,

Tony
