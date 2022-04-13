Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4044FF171
	for <lists+linux-omap@lfdr.de>; Wed, 13 Apr 2022 10:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbiDMILw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Apr 2022 04:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbiDMILv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 13 Apr 2022 04:11:51 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 533C16384;
        Wed, 13 Apr 2022 01:09:28 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D96CF80F5;
        Wed, 13 Apr 2022 08:06:52 +0000 (UTC)
Date:   Wed, 13 Apr 2022 11:09:26 +0300
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
Message-ID: <YlaFNnpVl/R5onZm@atomide.com>
References: <20220412131644.59195-1-tony@atomide.com>
 <20220412131644.59195-2-tony@atomide.com>
 <1c455b6e-0009-6f8b-15c8-2a352479c5f2@linaro.org>
 <YlZoA/TX02E+Ey7U@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YlZoA/TX02E+Ey7U@atomide.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [220413 06:08]:
> * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [220412 17:04]:
> > Hmmm, in your previous version I had impression that first clock is not
> > the same on every flavor. Now it looks the same, so clocks you could
> > simplify even more:
> > 1. Define full list in main properties (not in allOf) with minItems:1
> > 2. Use maxItems:1, for this "else:" case.
> > 
> > This could greatly reduce amount of code you need and keep the actual
> > definition of clocks in main properties (not in allOf; allOf are only to
> > constrain it).
> 
> OK thanks I'll check. I think we can assume the first clock is "fck" if
> it is configured at all.

Yup, this works nicely :) Will send out v4 set.

Thanks,

Tony
