Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97CB462F760
	for <lists+linux-omap@lfdr.de>; Fri, 18 Nov 2022 15:32:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241807AbiKROcg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Nov 2022 09:32:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242390AbiKROca (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Nov 2022 09:32:30 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 80F1C2338C;
        Fri, 18 Nov 2022 06:32:29 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 87C8B807E;
        Fri, 18 Nov 2022 14:22:22 +0000 (UTC)
Date:   Fri, 18 Nov 2022 16:32:27 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] dt-bindings: pwm: ti,pwm-omap-dmtimer: Update binding
 for yaml
Message-ID: <Y3eXe/S6MMaDGwEt@atomide.com>
References: <20221118125435.9479-1-tony@atomide.com>
 <debfe50a-7e94-9703-efde-2c805faa3d2b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <debfe50a-7e94-9703-efde-2c805faa3d2b@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [221118 14:12]:
> On 18/11/2022 13:54, Tony Lindgren wrote:
> > +properties:
> > +  $nodename:
> > +    pattern: "^pwm-([1-9]|1[0-2])$"
> 
> Drop the nodename, device schemas do not need to enforce it.

Hmm I think that's needed to avoid warnings if the knob is
tweaked to 11? Right now the max timer value is 12.

> > +  ti,prescaler:
> > +    description: legacy clock prescaled for timer
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
> > +    deprecated: true
> 
> This was not deprecated before and your commit msg does not mention it.

OK will add and fix up the other things you noticed too.

Thanks,

Tony
