Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0682E633A56
	for <lists+linux-omap@lfdr.de>; Tue, 22 Nov 2022 11:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232809AbiKVKnK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Nov 2022 05:43:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232378AbiKVKmk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Nov 2022 05:42:40 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 21A2E5FAA;
        Tue, 22 Nov 2022 02:37:28 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 20AEF8061;
        Tue, 22 Nov 2022 10:27:14 +0000 (UTC)
Date:   Tue, 22 Nov 2022 12:37:26 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pwm: Allow decimal format in
 addition to hex format
Message-ID: <Y3ymZphck8JM6g9B@atomide.com>
References: <20221121115525.36362-1-tony@atomide.com>
 <20221121144000.7weeyfbbulltfxmd@pengutronix.de>
 <Y3uPvYqaILNiYW8K@atomide.com>
 <bb5ac0cf-84eb-165f-40bb-0f3c9afe084f@linaro.org>
 <Y3xTi5JeLPSWchT7@atomide.com>
 <20221122093650.oouke2utlkvdd7r6@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221122093650.oouke2utlkvdd7r6@pengutronix.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Uwe Kleine-König <u.kleine-koenig@pengutronix.de> [221122 09:26]:
> On Tue, Nov 22, 2022 at 06:43:55AM +0200, Tony Lindgren wrote:
> > * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [221121 16:05]:
> > > On 21/11/2022 15:48, Tony Lindgren wrote:
> > > > * Uwe Kleine-König <u.kleine-koenig@pengutronix.de> [221121 14:30]:
> > > >> On Mon, Nov 21, 2022 at 01:55:24PM +0200, Tony Lindgren wrote:
> > > >>> Let's allow node numbering in decimal format too.
> > > >>>
> > > >>> Simple human-readable increments/IDs are usually decimal, hex is only for
> > > >>> addresses as noted by Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>.
> > > >>>
> > > >>> Cc: Thierry Reding <thierry.reding@gmail.com>
> > > >>> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > >>> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > >>> Signed-off-by: Tony Lindgren <tony@atomide.com>
> > > >>> ---
> > > >>>  Documentation/devicetree/bindings/pwm/pwm.yaml | 2 +-
> > > >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >>>
> > > >>> diff --git a/Documentation/devicetree/bindings/pwm/pwm.yaml b/Documentation/devicetree/bindings/pwm/pwm.yaml
> > > >>> --- a/Documentation/devicetree/bindings/pwm/pwm.yaml
> > > >>> +++ b/Documentation/devicetree/bindings/pwm/pwm.yaml
> > > >>> @@ -13,7 +13,7 @@ select: false
> > > >>>  
> > > >>>  properties:
> > > >>>    $nodename:
> > > >>> -    pattern: "^pwm(@.*|-[0-9a-f])*$"
> > > >>> +    pattern: "^pwm(@.*|-([0-9a-f]|1[0-5]))*$"
> > > >>
> > > >> I wonder why you don't make this:
> > > >>
> > > >> +    pattern: "^pwm(@.*|-[0-9a-f]*)$"
> > > 
> > > Yes, the '*' should be within ().
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
> 
> I think there is a misunderstanding about the type of pattern here. Do
> we talk about a shell pattern where "[0-9a-f]*" matches a name starting
> with a hex digit followed by any number of any caracter, or is it a
> regexp where the * means "any number of the preceding pattern", so
> effectively a word consisting of only hex digits.
> 
> The .* part makes me think we're talking about a regexp, so the old
> pattern ("^pwm(@.*|-[0-9a-f])*$") means that
> 
> 	pwm-1-2-3-4
> 
> is allowed but
> 
> 	pwm-10
> 
> isn't. And I think what we want is:
> 
> 	"^pwm(@.*|-[0-9a-f]*)$"

Heh so this fails for just node name pwm:

pwm: $nodename:0: 'pwm' does not match '^pwm(@.*|-[0-9a-f]*)$'

Maybe that's why the second '..)*$' was there originally for?
And adding it back there fixes pwm but allows pwm-1-2-3..

> (or maybe better "^pwm(@.+|-[0-9a-f]+)$" ?)

And this too fails for just pwm node name.

Regards,

Tony
