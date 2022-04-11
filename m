Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC724FB57C
	for <lists+linux-omap@lfdr.de>; Mon, 11 Apr 2022 10:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243200AbiDKICo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Apr 2022 04:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241013AbiDKICn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 Apr 2022 04:02:43 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 91FE2DE8;
        Mon, 11 Apr 2022 01:00:29 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C25BB809F;
        Mon, 11 Apr 2022 07:57:57 +0000 (UTC)
Date:   Mon, 11 Apr 2022 11:00:27 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Keerthy <j-keerthy@ti.com>, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: timer: Update TI timer to yaml and add
 compatible for am6
Message-ID: <YlPgG0M6IS60Q1bc@atomide.com>
References: <20220408081258.57213-1-tony@atomide.com>
 <1649432514.728371.3536062.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649432514.728371.3536062.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Rob Herring <robh@kernel.org> [220408 15:39]:
> On Fri, 08 Apr 2022 11:12:58 +0300, Tony Lindgren wrote:
> > Let's update the TI timer binding to use yaml. And add compatible for
> > ti,am654-timer for TI am64, am65 and j72 SoCs. As the timer hardware is
> > the same between am64, am65 and j72 we use the compatible name for the
> > earliest SoC with this timer.
> > 
> > As this binding is specific to the TI dual-mode timers also known
> > as dm-timers, let's use ti,timer-dm.yaml naming for the new file.
> > 
> > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> > Cc: Keerthy <j-keerthy@ti.com>
> > Cc: Nishanth Menon <nm@ti.com>
> > Cc: Vignesh Raghavendra <vigneshr@ti.com>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> >  .../bindings/timer/ti,timer-dm.yaml           | 105 ++++++++++++++++++
> >  .../devicetree/bindings/timer/ti,timer.txt    |  44 --------
> >  2 files changed, 105 insertions(+), 44 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/timer/ti,timer.txt
> > 
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.

Well I was planning to drop the unused ti,am4372-timer related properties,
but instead will document those as discussed in the related dts thread.
I'll be sending an updated version a bit later on.

Regards,

Tony
