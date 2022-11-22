Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCE746336B5
	for <lists+linux-omap@lfdr.de>; Tue, 22 Nov 2022 09:11:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbiKVILR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Nov 2022 03:11:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231934AbiKVILQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Nov 2022 03:11:16 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9CE3C3F04B;
        Tue, 22 Nov 2022 00:11:15 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 399978061;
        Tue, 22 Nov 2022 08:01:01 +0000 (UTC)
Date:   Tue, 22 Nov 2022 10:11:13 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pwm: Allow decimal format in
 addition to hex format
Message-ID: <Y3yEIch6IiLwuUZc@atomide.com>
References: <20221121115525.36362-1-tony@atomide.com>
 <20221121144000.7weeyfbbulltfxmd@pengutronix.de>
 <Y3uPvYqaILNiYW8K@atomide.com>
 <bb5ac0cf-84eb-165f-40bb-0f3c9afe084f@linaro.org>
 <Y3xTi5JeLPSWchT7@atomide.com>
 <8c37d6a6-497c-f761-1e27-1ef5b3e64250@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c37d6a6-497c-f761-1e27-1ef5b3e64250@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [221122 07:26]:
> On 22/11/2022 05:43, Tony Lindgren wrote:
> > * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [221121 16:05]:
> >> On 21/11/2022 15:48, Tony Lindgren wrote:
> >>> * Uwe Kleine-König <u.kleine-koenig@pengutronix.de> [221121 14:30]:
> >>>> On Mon, Nov 21, 2022 at 01:55:24PM +0200, Tony Lindgren wrote:
> >>>>> Let's allow node numbering in decimal format too.
> >>>>>
> >>>>> Simple human-readable increments/IDs are usually decimal, hex is only for
> >>>>> addresses as noted by Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>.
> >>>>>
> >>>>> Cc: Thierry Reding <thierry.reding@gmail.com>
> >>>>> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> >>>>> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>>> Signed-off-by: Tony Lindgren <tony@atomide.com>
> >>>>> ---
> >>>>>  Documentation/devicetree/bindings/pwm/pwm.yaml | 2 +-
> >>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/pwm/pwm.yaml b/Documentation/devicetree/bindings/pwm/pwm.yaml
> >>>>> --- a/Documentation/devicetree/bindings/pwm/pwm.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/pwm/pwm.yaml
> >>>>> @@ -13,7 +13,7 @@ select: false
> >>>>>  
> >>>>>  properties:
> >>>>>    $nodename:
> >>>>> -    pattern: "^pwm(@.*|-[0-9a-f])*$"
> >>>>> +    pattern: "^pwm(@.*|-([0-9a-f]|1[0-5]))*$"
> >>>>
> >>>> I wonder why you don't make this:
> >>>>
> >>>> +    pattern: "^pwm(@.*|-[0-9a-f]*)$"
> >>
> >> Yes, the '*' should be within ().
> > 
> > Sorry I guess I don't follow. So for what type of naming is the second '*'
> > actually needed here, or is it needed at all?
> > 
> > We only want to match the following:
> > 
> > pwm@1234
> > 
> > pwm-0
> > ...
> > pwm-f
> > 
> > And now also:
> > 
> > pwm-0
> > ...
> > pwm-15
> > 
> > Is there yet another format I'm missing?
> > 
> >>> Hmm but I think this would also pass for node names like pwm-a-foo?
> >>>
> >>
> >> No, how?
> > 
> > Because of the second extra '*' there :)
> 
> It cannot multiple dashes...

Sorry I'm still confused.. Care to specify what match do you want to
use here and why?

Regards,

Tony
