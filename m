Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 273096320C9
	for <lists+linux-omap@lfdr.de>; Mon, 21 Nov 2022 12:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbiKULhb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Nov 2022 06:37:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbiKULg4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 21 Nov 2022 06:36:56 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 655A4C1E;
        Mon, 21 Nov 2022 03:33:56 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5660A80A7;
        Mon, 21 Nov 2022 11:23:43 +0000 (UTC)
Date:   Mon, 21 Nov 2022 13:33:53 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] dt-bindings: pwm: ti,pwm-omap-dmtimer: Update binding
 for yaml
Message-ID: <Y3tiIXWpwYTNdYcV@atomide.com>
References: <20221118125435.9479-1-tony@atomide.com>
 <debfe50a-7e94-9703-efde-2c805faa3d2b@linaro.org>
 <Y3eXe/S6MMaDGwEt@atomide.com>
 <bedbaebe-d84b-fc0b-9492-4503a6d59a83@linaro.org>
 <Y3tOJZ3LJroyXD6D@atomide.com>
 <beb1a813-a1c3-d660-0fa1-ef4c167245e7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <beb1a813-a1c3-d660-0fa1-ef4c167245e7@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [221121 10:22]:
> On 21/11/2022 11:08, Tony Lindgren wrote:
> > * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [221118 14:33]:
> >> On 18/11/2022 15:32, Tony Lindgren wrote:
> >>> * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [221118 14:12]:
> >>>> On 18/11/2022 13:54, Tony Lindgren wrote:
> >>>>> +properties:
> >>>>> +  $nodename:
> >>>>> +    pattern: "^pwm-([1-9]|1[0-2])$"
> >>>>
> >>>> Drop the nodename, device schemas do not need to enforce it.
> >>>
> >>> Hmm I think that's needed to avoid warnings if the knob is
> >>> tweaked to 11? Right now the max timer value is 12.
> >>
> >> Which warnings? The pwm.yaml allows up to 15.
> > 
> > Heh I was using dec instead of hex.. :) Yup pwm.yaml works just fine.
> 
> This could be fixed (extended) in pwm.yaml as well, because simple
> human-readable increments/IDs are usually decimal. hex is only for
> addresses.

OK I'll do a patch for that.

Regards,

Tony
