Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC8C1633BA1
	for <lists+linux-omap@lfdr.de>; Tue, 22 Nov 2022 12:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233412AbiKVLnQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Nov 2022 06:43:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233434AbiKVLmo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Nov 2022 06:42:44 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5642BDF4D;
        Tue, 22 Nov 2022 03:40:54 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 60B1D8061;
        Tue, 22 Nov 2022 11:30:39 +0000 (UTC)
Date:   Tue, 22 Nov 2022 13:40:52 +0200
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
Message-ID: <Y3y1RFUDY6C2fHdi@atomide.com>
References: <20221121115525.36362-1-tony@atomide.com>
 <20221121144000.7weeyfbbulltfxmd@pengutronix.de>
 <Y3uPvYqaILNiYW8K@atomide.com>
 <bb5ac0cf-84eb-165f-40bb-0f3c9afe084f@linaro.org>
 <Y3xTi5JeLPSWchT7@atomide.com>
 <20221122093650.oouke2utlkvdd7r6@pengutronix.de>
 <Y3ymZphck8JM6g9B@atomide.com>
 <20221122105710.5aow5qsri6pikgri@pengutronix.de>
 <Y3yubxJ3ZCIIed3T@atomide.com>
 <4128deb0-c5b8-2405-033b-35edc8c5110d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4128deb0-c5b8-2405-033b-35edc8c5110d@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [221122 11:20]:
> On 22/11/2022 12:11, Tony Lindgren wrote:
> >> Then let's pick:
> >>
> >>
> >> 	"^pwm(@.+|-[0-9a-f]+)?$"
> > 
> > That works for pwm and pwm-11, but now fails for pwm11 :)
> 
> Which was never valid, so no problem.

OK, let's go with that then! Thanks Krzysztof & Uwe, I'll post
updated patches.

Regards,

Tony
